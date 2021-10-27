/**
 * @author rickybustillos - topi
 */
@isTest
public class AccountFilterTest {
    @isTest
    public static void givenAccountWithDocumentNumberWhenFilterThenSubListOnlyWithNotEmptyDocumentNumber() {

        
        List<Account> accounts = AccountFixtureFactory.createAccountList();

        AccountFilter filter = new AccountFilter();

        Test.startTest();

        List<Account> filteredAccounts = filter.filterNotEmptyDocumentNumber(accounts);

        Test.stopTest();

        System.assert(!filteredAccounts.isEmpty());
        System.assertEquals(5, filteredAccounts.size());
        System.assertEquals('123', filteredAccounts.get(0).DocumentNumber__c);
    }

    @isTest
    public static void givenAccountListWhenFilterValidDocumentNumberThenReturnDocumentsWithNoErrors() {

        List<Account> accounts = AccountFixtureFactory.createAccountList();

        accounts.get(0).addError('Invalid');

        AccountFilter filter = new AccountFilter();

        Test.startTest();

        List<Account> filteredAccounts = filter.filterWithDocumentNumberWithNoErrors(accounts);

        Test.stopTest();

        System.assert(!filteredAccounts.isEmpty());
        System.assertEquals(4, filteredAccounts.size());
    }
    
    @isTest
    public static void givenAccountListWhenFilterByCategoryThenReturnOnlyPremium() {

        List<Account> accounts = AccountFixtureFactory.createAccountList();

        AccountFilter filter = new AccountFilter();

        Test.startTest();

        List<Account> filteredAccounts = filter.filterWithCategory(accounts, 'Premium');

        Test.stopTest();

        System.assert(!filteredAccounts.isEmpty());
        System.assertEquals(filteredAccounts.size(), 2);
        System.assert(filteredAccounts.iterator().next().Category__c == 'Premium');
    }
    
    @isTest
    public static void givenAccountListWhenFilterByAnnualRevenueThenReturnGratherThanOneMillion() {

        List<Account> accounts = AccountFixtureFactory.createAccountList();

        AccountFilter filter = new AccountFilter();

        Test.startTest();

        List<Account> filteredAccounts = filter.filterWithAnnualRevenueGreatherThanOneMillion(accounts);

        Test.stopTest();

        System.assert(!filteredAccounts.isEmpty());
        System.assertEquals(3, filteredAccounts.size());
    }
}