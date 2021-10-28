/**
 * @author rickybustillos on 10/12/16.
 */
@isTest
public class GetViaCepAddressOutboundServiceTest {
    @isTest
    public static void givenValidZipCodeWhenGetViaCepAddressThenReturnCompleteAddress() {

        String expectedResponsePayload = ViaCepZipCodeAddressFixtureFactory.newViaCepZipCodeAddressResponsePayload();

        ViaCepZipCodeAddressResponse expectedResponse = ViaCepZipCodeAddressFixtureFactory.newViaCepZipCodeAddressResponse();

        GetViaCepAddressOutboundService service = new GetViaCepAddressOutboundService();

        Test.setMock(HttpCalloutMock.class, new ViaCepZipCodeAddressHttpMock(expectedResponsePayload));
        Test.startTest();

        ViaCepZipCodeAddressResponse response = service.getViaCepAddress('07132030');

        Test.stopTest();

        System.assertEquals(expectedResponse.bairro, response.bairro);
        System.assertEquals(expectedResponse.cep, response.cep);
        System.assertEquals(expectedResponse.logradouro, response.logradouro);
        System.assertEquals(expectedResponse.ibge, response.ibge);

    }

    public class ViaCepZipCodeAddressHttpMock implements HttpCalloutMock {
        String payload;

        public ViaCepZipCodeAddressHttpMock(String payload) {
            this.payload = payload;
        }

        public HttpResponse respond(HttpRequest request) {
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setBody(this.payload);

            return response;
        }
    }
}