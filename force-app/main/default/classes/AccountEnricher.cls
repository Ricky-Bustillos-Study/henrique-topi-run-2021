/**
 * @author rickybustillos
 */
public class AccountEnricher {
    public List<Account> enrich(List<Account> accounts) {
        for ( Account account : accounts ) {
            this.withFormattedDocumentNumber(account) ;
        }
        return accounts;
    }

    private Account withFormattedDocumentNumber(Account account) {

        BrazilianDocument document = new BrazilianDocument(account.DocumentNumber__c);

        if ( document.isCpf() ) {
            account.DocumentNumber__c = document.getFormattedCpf();
        } else if ( document.isCnpj() ) {
            account.DocumentNumber__c = document.getFormattedCnpj();
        }

        return account;
    }
}