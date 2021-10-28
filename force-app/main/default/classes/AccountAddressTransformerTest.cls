/**
 * @author rickybustillos
 */
@isTest
public class AccountAddressTransformerTest {
    @isTest
    public static void givenReceivedViaCepAddressWhenTransformToAccountThenMappingBillingAddressWithServiceData() {

        Account account = AccountFixtureFactory.newAccount();
        account.BillingPostalCode = '01001000';

        ViaCepZipCodeAddressResponse response = ViaCepZipCodeAddressFixtureFactory.newViaCepZipCodeAddressResponse();

        AccountAddressTransformer transformer = new AccountAddressTransformer();

        Test.startTest();

        Account transformedAccount = transformer.toAccount(response, account);

        Test.stopTest();

        System.assertEquals(response.cep, transformedAccount.BillingPostalCode);
        System.assertEquals('Brasil', transformedAccount.BillingCountry);
    }
}