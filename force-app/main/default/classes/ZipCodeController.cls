/**
 * @author rickybustillos 
 */
public with sharing class ZipCodeController {
    
    public static GetViaCepAddressOutboundService service;

    static {
        service = new GetViaCepAddressOutboundService();
    }

    @AuraEnabled
    public static ZipCodeAddress findAddressByZipCode(String zipCode) {

        ZipCodeAddressTransformer transformer = new ZipCodeAddressTransformer();

        zipCode = zipCode.remove('-');

        return transformer.toAddress( service.getViaCepAddress(zipCode) );
    }

}
