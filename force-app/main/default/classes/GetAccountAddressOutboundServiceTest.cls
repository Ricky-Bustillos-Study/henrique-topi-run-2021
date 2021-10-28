
/**
 * @author rickybustillos 
 */
@isTest
public class GetAccountAddressOutboundServiceTest {
    
    @isTest
    public static void givenWhenThen() {
        
        GetAccountAddressOutboundService service = new GetAccountAddressOutboundService();
        service.setService(new GetViaCepAddressOutboundServiceMock());

        Account account = service.findAddressByAccountZipCode(new Account(BillingPostalCode = '01001000'));

        System.assertEquals('07132-030', account.BillingPostalCode);
        System.assertEquals('Guarulhos', account.BillingCity);
        System.assertEquals('Brasil', account.BillingCountry);
    }

    public class GetViaCepAddressOutboundServiceMock extends GetViaCepAddressOutboundService {

        override public ViaCepZipCodeAddressResponse getViaCepAddress(String zipCode) {
            return ViaCepZipCodeAddressFixtureFactory.newViaCepZipCodeAddressResponse();
        }
    }
}
