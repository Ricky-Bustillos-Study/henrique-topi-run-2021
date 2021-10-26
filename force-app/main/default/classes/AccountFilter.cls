/**
 * @author ercarval - topi
 */
public class AccountFilter {
    public List<Account> filterNotEmptyDocumentNumber(List<Account> accounts) {

        List<Account> filteredAccountsWithDocument = new List<Account>();

        for ( Account account : accounts ) {

            if ( String.isNotEmpty(account.DocumentNumber__c) ) {
                filteredAccountsWithDocument.add(account) ;
            }

        }

        return filteredAccountsWithDocument;
    }

    public List<Account> filterWithValidDocumentNumber(List<Account> accounts) {

        List<Account> filteredAccounts = new List<Account>();

        for ( Account account : filterNotEmptyDocumentNumber(accounts) ) {
            if ( !account.hasErrors(  ) ) {
                filteredAccounts.add(account) ;
            }
        }
        return filteredAccounts;
    }

    public List<Account> filterWithCategory(List<Account> accounts, String category) {

        List<Account> filteredPremiumAccounts = new List<Account>();

        for ( Account account : accounts ) {
            if ( account.Category__c.equals( 'Premium' ) ) {
                filteredPremiumAccounts.add(account) ;
            }
        }

        return filteredPremiumAccounts;
    }

    public List<Account> filterWithAnnualRevenueGreatherThanOneMillion(List<Account> accounts) {

        List<Account> filteredAccounts = new List<Account>();

        for ( Account account : accounts ) {

            if ( account.AnnualRevenue > 1000000 ) {
                filteredAccounts.add(account) ;
            }

        }

        return filteredAccounts;
    }
}