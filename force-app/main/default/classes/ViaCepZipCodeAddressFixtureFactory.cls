/**
 * @author rickybustillos on 10/12/16.
 */
@isTest
public class ViaCepZipCodeAddressFixtureFactory {

    public static ViaCepZipCodeAddressResponse newViaCepZipCodeAddressResponse() {
        String responsePayload = '{ "cep": "07132-030", "logradouro": "Rua Araçoiaba da Serra", "complemento": "", "bairro": "Jardim Jovaia", "localidade": "Guarulhos", "uf": "SP", "ibge": "3518800", "gia": "3360", "ddd": "11", "siafi": "6477"}';

        ViaCepZipCodeAddressResponse response = (ViaCepZipCodeAddressResponse) JSON.deserialize(
            responsePayload, 
            ViaCepZipCodeAddressResponse.class 
        );

        return response;
    }
}