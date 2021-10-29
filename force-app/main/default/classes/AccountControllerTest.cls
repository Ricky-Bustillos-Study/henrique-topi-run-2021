/**
 * @author rickybustillos
 */
@isTest
public class AccountControllerTest {
    @isTest
    public static void givenRequestAccountWhenPostToServerThenCreateAnAccount() {

        Account account = AccountController.create(AccountFixtureFactory.newAccount());

        System.assert(account.Id != null);
    }

    @isTest
    public static void givenCreatedAccountWhenPutToServerThenChangeAnAccount() {

        Account accountToChange = AccountFixtureFactory.createAccount();

        accountToChange.Name = 'Teste del Bustillos';

        Account changedAccount = AccountController.change(accountToChange);

        System.assertEquals(accountToChange.Id, changedAccount.Id);
        System.assertEquals('Teste del Bustillos', changedAccount.Name);
    }

    @isTest
    public static void givenValidAccountIdWhenGetAccountThenReturnAccount() {

        Account expectedAccount = AccountFixtureFactory.createAccount();

        RestContext.request = new RestRequest();
        RestContext.request.params.put('accountId', expectedAccount.Id);

        Account account = AccountController.get();

        System.assertEquals(expectedAccount.Id, account.Id);
        System.assertEquals(expectedAccount.Name, account.Name);
    }
}