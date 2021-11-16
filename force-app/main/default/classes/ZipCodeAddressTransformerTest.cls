/**
 * @author rickybustillos 
 */
@isTest
public class ZipCodeAddressTransformerTest {
    
    @isTest
    public static void givenViaCepZipCodeWhenTransformedThenReturnZipCodeAddress() {
        
        ViaCepZipCodeAddressResponse viaCepZipCode = ViaCepZipCodeAddressFixtureFactory.newViaCepZipCodeAddressResponse();

        ZipCodeAddressTransformer transformer = new ZipCodeAddressTransformer();

        Test.startTest();

        ZipCodeAddress transformedZipCode = transformer.toAddress(viaCepZipCode);

        Test.stopTest();
        
        System.assertEquals(viaCepZipCode.logradouro, transformedZipCode.street);
        System.assertEquals(viaCepZipCode.cep, transformedZipCode.zipCode);
        System.assertEquals(viaCepZipCode.localidade, transformedZipCode.city);
        System.assertEquals(viaCepZipCode.uf, transformedZipCode.state);
        
    }

}
