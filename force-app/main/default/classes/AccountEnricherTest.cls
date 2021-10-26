/**
 * @author rickybustillos
 */
@isTest
public class AccountEnricherTest {
    @isTest
    public static void givenAccountWithValidCpfWhenEnrichThenReturnFormattedDocumentNumber() {

        AccountEnricher accountEnricher = new AccountEnricher();

        Account account = new Account(  );
        account.DocumentNumber__c = '40959705880';

        List<Account> accounts = new List<Account>{ account };

        Test.startTest();

        List<Account> enrichedAccounts = AccountEnricher.enrich(accounts);

        Test.stopTest();

        Account enrichedAccount = enrichedAccounts.get(0);

        System.assertEquals('409.597.058-80', enrichedAccount.DocumentNumber__c);
    }

    @isTest
    public static void givenAccountWithValidCnpjWhenEnrichThenReturnFormattedDocumentNumber() {

        AccountEnricher accountEnricher = new AccountEnricher();

        Account account = new Account(  );
        account.DocumentNumber__c = '10871666000179';

        List<Account> accounts = new List<Account>{ account };

        Test.startTest();

        List<Account> enrichedAccounts = AccountEnricher.enrich(accounts);

        Test.stopTest();

        Account enrichedAccount = enrichedAccounts.get(0);

        System.assertEquals('10.871.666/0001-79', enrichedAccount.DocumentNumber__c);
    }

    @isTest
    public static void givenAccountWithInvalidDocumentNumberWhenEnrichThenReturnSameValue() {
        
        AccountEnricher accountEnricher = new AccountEnricher();

        Account account = new Account(  );
        account.DocumentNumber__c = '';

        List<Account> accounts = new List<Account>{ account };

        Test.startTest();

        List<Account> enrichedAccounts = AccountEnricher.enrich(accounts);

        Test.stopTest();

        Account enrichedAccount = enrichedAccounts.get(0);

        System.assertEquals('', enrichedAccount.DocumentNumber__c);
        
    }

}