/**
 * @author ercarval - topi
 *
 * Quase sempre ter esses comportamentos
 *
 * Filtrar
 * Validação
 * Enriquecer
 * Integração Sistêmica
 */
public with sharing class AccountTH extends TriggerHandler {
    List<Account> newAccounts;

    Map<Id, Account> oldAccounts;

    AccountFilter filter;

    AccountDocumentNumberValidator documentValidator;

    AccountEnricher enricher;

    EventRepository eventRepository;

    EventEnricher eventEnricher;

    public AccountTH() {
        this( ( List<Account> )Trigger.new, ( Map<Id, Account> )Trigger.oldMap );
    }

    public AccountTH(List<Account> newAccounts, Map<Id, Account> oldAccounts) {
        this.newAccounts = newAccounts;
        this.oldAccounts = oldAccounts;
        this.filter = new AccountFilter();
        this.documentValidator = new AccountDocumentNumberValidator();
        this.enricher = new AccountEnricher();
        this.eventRepository = new EventRepository();
        this.eventEnricher = new EventEnricher();
    }

    override public void afterInsert() {

        createEventToPremiumAccounts();
    }

    override public void beforeUpdate() {

        validateDocumentNumber();

        enrichAccounts();
    }

    public void validateDocumentNumber() {

        List<Account> filteredAccountWithDocumentNumber = this.filter.filterNotEmptyDocumentNumber(this.newAccounts);

        this.documentValidator.validate(this.newAccounts);
    }

    public void enrichAccounts() {
        this.enricher.enrich(this.filter.filterWithDocumentNumberWithNoErrors(this.newAccounts));
    }


    public void createEventToPremiumAccounts() {

        List<Account> filteredPremiumAccounts = this.filter.filterWithCategory(this.newAccounts, 'Premium');

        List<Account> filteredWithAnnualRevenueGreatherThanOneMillion = this.filter.filterWithAnnualRevenueGreatherThanOneMillion(filteredPremiumAccounts);

        List<Event> eventsToCreate = this.eventEnricher.enrichForPremiumAccountPresentation(filteredWithAnnualRevenueGreatherThanOneMillion);

        this.eventRepository.save(eventsToCreate);
    }
}