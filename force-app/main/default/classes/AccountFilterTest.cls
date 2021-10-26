/**
 * @author rickybustillos - topi
 */
@isTest
public class AccountFilterTest {
    @isTest
    public static void givenAccountWithDocumentNumberWhenFilterThenSubListOnlyWithNotEmptyDocumentNumber() {

        // Criar uma fixturefactory
        List<Account> accounts = new List<Account>{ 
            new Account( DocumentNumber__c = '123' ), 
            new Account( DocumentNumber__c = '', Name = 'Ricky' ), 
            new Account( Name = 'RickyBustillos' ) 
        };

        AccountFilter filter = new AccountFilter();

        Test.startTest();

        List<Account> filteredAccounts = filter.filterNotEmptyDocumentNumber(accounts);

        Test.stopTest();

        System.assert(!filteredAccounts.isEmpty());
        System.assertEquals(1, filteredAccounts.size());
        System.assertEquals('123', filteredAccounts.get(0).DocumentNumber__c);
    }

    @isTest
    public static void givenAccountListWhenFilterByCategoryThenReturnOnlyPremium() {

        // Criar uma fixture factory
        List<Account> accounts = new List<Account>{ 
            new Account( Name = 'Ricky', Category__c = 'Premium', AnnualRevenue = 1300500 ), 
            new Account( Name = 'Henrique', Category__c = 'Premium', AnnualRevenue = 640500 ), 
            new Account( Name = 'Bissolino', Category__c = 'Standard', AnnualRevenue = 500600 ),
            new Account( Name = 'Bisso', Category__c = 'Standard', AnnualRevenue = 1500200 )
        };

        AccountFilter filter = new AccountFilter();

        Test.startTest();

        List<Account> filteredAccounts = filter.filterWithCategory(accounts, 'Premium');

        Test.stopTest();

        System.assert(!filteredAccounts.isEmpty());
        System.assertEquals(filteredAccounts.size(), 2);
        System.assert(filteredAccounts.iterator().next().Category__c == 'Premium');
    }
}