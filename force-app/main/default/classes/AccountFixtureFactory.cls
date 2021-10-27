/**
 * @author ercarval - topi
 */
@isTest
public class AccountFixtureFactory {

    public static Account newPremiumAccount ( Decimal annualRevenue ) {
        return new Account (Name = 'Henrique'
                        , DocumentNumber__c = '40959705880'
                        , BillingCity = 'Sao Jose dos Campos'
                        , BillingCountry = 'Brasil'
                        , Category__c = 'Premium'
                        , AnnualRevenue = annualRevenue);
    }

    public static Account newAccount ( String name, String billingCountry ) {
        return new Account (Name = name
                        , DocumentNumber__c = '40959705880'
                        , BillingCity = 'Sao Jose dos Campos'
                        , BillingCountry =  billingCountry);
    }

    public static Account newAccount () {
        return newAccount('Bisso', 'Brasil');
    }

    public static Account createAccount () {
        return createAccount ( newAccount() );
    }
    
    public static Account createAccount ( String name, String billingCountry ) {
        return createAccount ( newAccount(name, billingCountry) );
    }

    public static Account createPremiumAccount ( Decimal annualRevenue ) {
        return createAccount( newPremiumAccount(annualRevenue) );
     }

    public static Account createAccount (Account account) {
        AccountRepository accountRepository = new AccountRepository();

        List<Account> createdAccount = accountRepository.save(account);

        return createdAccount[0];
    }

}