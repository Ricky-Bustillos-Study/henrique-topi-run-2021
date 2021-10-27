/**
 * @author ercarval - topi
 */
@isTest
public class AccountFixtureFactory {

    public static List<Account> newAccountList () {
        return new List<Account>{ 
            new Account( Name = 'Ricky', DocumentNumber__c = '123', Category__c = 'Premium', AnnualRevenue = 1300500, BillingCountry = 'Brasil' ), 
            new Account( Name = 'Henrique', DocumentNumber__c = '',  Category__c = 'Premium', AnnualRevenue = 640500 , BillingCountry = 'Brasil'), 
            new Account( Name = 'Bissolino', DocumentNumber__c = '664.352.285-40', Category__c = 'Standard', AnnualRevenue = 500600, BillingCountry = 'Brasil'),
            new Account( Name = 'Eduardo', DocumentNumber__c = '54821785790', Category__c = 'Standard', AnnualRevenue = 1500200, BillingCountry = 'Brasil'),
            new Account( Name = 'Bisso', DocumentNumber__c = '10871666000179',  Category__c = 'Basic', AnnualRevenue = 60300 , BillingCountry = 'Brasil'),
            new Account( Name = 'Tormen', DocumentNumber__c = '98884857000116',  Category__c = 'Basic', AnnualRevenue = 1100300 , BillingCountry = 'Brasil')
        };
    }

    public static Account newPremiumAccount ( Decimal annualRevenue ) {
        return new Account (Name = 'Henrique'
                        , DocumentNumber__c = '54821785790'
                        , BillingCity = 'Sao Jose dos Campos'
                        , BillingCountry = 'Brasil'
                        , Category__c = 'Premium'
                        , AnnualRevenue = annualRevenue);
    }

    public static Account newAccount ( String name, String billingCountry ) {
        return new Account(Name = name
                        , DocumentNumber__c = '54821785790'
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

    public static List<Account> createAccountList () {
        return createAccountList ( newAccountList() );
    }

    public static Account createPremiumAccount ( Decimal annualRevenue ) {
        return createAccount( newPremiumAccount(annualRevenue) );
     }

    public static Account createAccount (Account account) {
        AccountRepository accountRepository = new AccountRepository();

        List<Account> createdAccount = accountRepository.save(account);

        return createdAccount[0];
    }

    public static List<Account> createAccountList (List<Account> accounts) {
        AccountRepository accountRepository = new AccountRepository();

        List<Account> createdAccount = accountRepository.save(accounts);

        return createdAccount;
    }

}