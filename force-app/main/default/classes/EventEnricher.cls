/**
 * @author rickybustillos
 */
public class EventEnricher {
    public List<Event> enrichForPremiumAccountPresentation(List<Account> accounts) {

        EventRepository eventRepository = new EventRepository();

        List<Event> eventsToCreate = new List<Event>();

        for ( Account account : accounts ) {
            Event event = new Event();
            Datetime now = Datetime.now();
            event.WhatId = account.Id;
            event.Description = 'Apresentar o portifolio de Produtos para o novo cliente com enfoque em nossa carteira Premium';
            event.Subject = 'Apresentação institucional dos produtos Premium';
            event.StartDateTime = now.addDays(1);
            event.EndDateTime = now.addDays(1).addHours(1);
            event.ContactType__c = 'Telefônico';
            eventsToCreate.add(event) ;
        }
        
        return eventRepository.save(eventsToCreate);
    }
}