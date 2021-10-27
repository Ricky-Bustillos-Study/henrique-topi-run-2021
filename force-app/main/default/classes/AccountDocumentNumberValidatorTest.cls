/**
 * @author rickybustillos
 */
@isTest
public class AccountDocumentNumberValidatorTest {
    @isTest
    public static void givenAccountWhenValidateInvalidDocumentNumberThenAddError() {

        List<Account> accounts = AccountFixtureFactory.createAccountList();

        AccountDocumentNumberValidator validator = new AccountDocumentNumberValidator();

        Test.startTest();

        validator.validate(accounts);

        Test.stopTest();

        Integer counter = 0;

        for ( Account account : accounts ) {
            String documentNumber = account.DocumentNumber__c;
            if ( account.hasErrors(  ) && account.getErrors(  )[0].message == 'Invalid Document Number' ) {
                counter++;
            }
        }
        System.assertEquals(2, counter);
    }
}