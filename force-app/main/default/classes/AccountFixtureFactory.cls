/**
 * @author rickybustillos - topi
 */
@isTest
public class AccountFixtureFactory {
    public static Account newAccount(String name, String billingCountry) {
        return new Account( Name = name, BillingCity = 'Guarulhos', BillingCountry = billingCountry );
    }

    public static Account newAccount() {
        return new Account( Name = 'Ricky', BillingCountry = 'Brasil' );
    }

    public static Account createAccount() {
        return createAccount(newAccount());
    }

    public static Account createAccount(String name, String billingCountry) {
        return createAccount(newAccount(Name = name, BillingCountry = billingCountry));
    }

    public static Account createAccount(Account account) {
        insert account;
        return account;
    }
}