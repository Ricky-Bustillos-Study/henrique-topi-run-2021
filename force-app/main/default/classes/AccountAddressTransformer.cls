/**
 * @author rickybustillos
 */
public class AccountAddressTransformer {

    public Account toAccount(ViaCepZipCodeAddressResponse response, Account account) {

        account.BillingCity = response.localidade;
        account.BillingStreet = response.logradouro + ' ' + response.complemento;
        account.BillingState = response.uf;
        account.BillingPostalCode = response.cep;
        account.BillingCountry = 'Brasil';

        return account;
    }
}