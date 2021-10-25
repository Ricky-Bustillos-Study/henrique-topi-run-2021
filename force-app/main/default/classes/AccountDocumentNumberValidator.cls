public class AccountDocumentNumberValidator {
    BrazilianDocumentValidator brazilianDocumentValidator;

    public AccountDocumentNumberValidator() {
        brazilianDocumentValidator = new BrazilianDocumentValidator();
    }

    public void validate(List<Account> accounts) {

        for ( Account account : accounts ) {
            if ( !isValid(account.DocumentNumber__c) ) {
                account.DocumentNumber__c.addError( 'Invalid Document Number' );
            }
        }
    }

    private Boolean isValid(String documentNumber) {
        return brazilianDocumentValidator.isCpf(documentNumber) || brazilianDocumentValidator.isCnpj(documentNumber);
    }
}