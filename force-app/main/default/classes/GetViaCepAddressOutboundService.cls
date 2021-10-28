/**
 * @author rickybustillos
 */
public virtual class GetViaCepAddressOutboundService {

    virtual public ViaCepZipCodeAddressResponse getViaCepAddress(String zipCode) {

        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json');
        request.setEndpoint('https://viacep.com.br/ws/' + zipCode + '/json/');

        Http http = new Http();
        HttpResponse response = http.send(request);

        ViaCepZipCodeAddressResponse address = (ViaCepZipCodeAddressResponse)JSON.deserialize(response.getBody(), ViaCepZipCodeAddressResponse.class );

        return address;
    }
}