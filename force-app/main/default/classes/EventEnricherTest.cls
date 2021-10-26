/**
 * @author rickybustillos
 */
@isTest
public class EventEnricherTest {
    @isTest
    public static void givenPremiumAccountWhenCreatedThenReturnEventToCreate() {

        List<Account> accounts = new List<Account>{ AccountFixtureFactory.createPremiumAccount(1200100) };

        EventEnricher eventEnricher = new EventEnricher();

        Test.startTest();

        List<Event> createdEvents = eventEnricher.enrichForPremiumAccountPresentation(accounts);

        Test.stopTest();

        System.assert(createdEvents.size() == 1);

        Event createdEvent = createdEvents.get(0);

        System.assertEquals(accounts.get(0).Id, createdEvent.WhatId);
        System.assertEquals('Apresentar o portifolio de Produtos para o novo cliente com enfoque em nossa carteira Premium', createdEvent.Description);
        System.assertEquals('Apresentação institucional dos produtos Premium', createdEvent.Subject);
    }
}