/**
 * @author rickybustillos
 */
public class GetAccountAddressOutboundService {
    GetViaCepAddressOutboundService service;

    AccountAddressTransformer transformer;

    public GetAccountAddressOutboundService() {
        transformer = new AccountAddressTransformer();
        service = new GetViaCepAddressOutboundService();
    }

    public Account findAddressByAccountZipCode(Account account) {

        ViaCepZipCodeAddressResponse response = this.service.getViaCepAddress(account.BillingPostalCode);

        return this.transformer.toAccount(response, account);
    }
}