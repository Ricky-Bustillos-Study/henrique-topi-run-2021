/**
 * @author ercarval - topi
 */
@isTest
public class BrazilianDocumentFormatterTest {

    @isTest
    private static void itShouldFormatCpf() {
        String validCpf = '12345678901';
        String invalidCpfTooLong = '1234567890123';
        String invalidCpfTooShort = '123456789';

        Test.startTest();

        BrazilianDocumentFormatter formatter = new BrazilianDocumentFormatter();

        System.assert(formatter.formatCpf(validCpf) == '123.456.789-01', 'Wrong format');

        try {
            formatter.formatCpf(invalidCpfTooLong);
            System.assert(false, 'It should throw exception');
        } catch (BrazilianDocumentFormatter.InvalidInputException ex) {
            System.assert(ex.getMessage() == 'Cpf should have length 11');
        }

        try {
            formatter.formatCpf(invalidCpfTooShort);
            System.assert(false, 'It should throw exception');
        } catch (BrazilianDocumentFormatter.InvalidInputException ex) {
            System.assert(ex.getMessage() == 'Cpf should have length 11');
        }

        Test.stopTest();
    }

    @isTest
    private static void givenInvalidDocumentWhenFormattedThenShouldThrowInvalidInputException() {

        String invalidCpfTooLong = '1234567890123';
        String invalidCpfTooShort = '123456789';

        String invalidCnpjTooLong = '123456789012345';
        String invalidCnpjTooShort = '12345678901';


        Test.startTest();

        BrazilianDocumentFormatter formatter = new BrazilianDocumentFormatter();

        try {
            formatter.formatCpf(invalidCpfTooLong);
            System.assert(false, 'It should throw exception');
        } catch (BrazilianDocumentFormatter.InvalidInputException ex) {
            System.assert(ex.getMessage() == 'Cpf should have length 11');
        }


        try {

            formatter.formatCpf(invalidCpfTooShort);
            System.assert(false, 'It should throw exception');
        } catch (BrazilianDocumentFormatter.InvalidInputException ex) {
            System.assert(ex.getMessage() == 'Cpf should have length 11');
        }


        try {

            formatter.formatCnpj(invalidCnpjTooShort);
            System.assert(false, 'It should throw exception');
        } catch (BrazilianDocumentFormatter.InvalidInputException ex) {
            System.assert(ex.getMessage() == 'Cnpj should have length 14');
        }

        try {
            formatter.formatCnpj(invalidCnpjTooLong);
            System.assert(false, 'It should throw exception');
        } catch (BrazilianDocumentFormatter.InvalidInputException ex) {
            System.assert(ex.getMessage() == 'Cnpj should have length 14');
        }

        Test.stopTest();
    }

}