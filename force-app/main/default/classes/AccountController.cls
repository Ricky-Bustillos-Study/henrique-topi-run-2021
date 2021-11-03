/**
 * @author rickybustillos 
 */
@RestResource(urlMapping = '/api/account')
global with sharing class AccountController {

    public static AccountRepository repository;

    static {
        repository = new AccountRepository();
    }
    
    @HttpPost
    global static void create (AccountRequest request) {

        RestResponse response = RestContext.response;
        response.statuscode = 200;
        response.headers.put('Content-Type', 'application/json');

        Savepoint savepoint = Database.setSavepoint();
        
        try {
            repository.save(request.account);
            repository.saveRelated(request.contacts, request.account.Id, 'AccountId');
            response.responseBody = Blob.valueOf( JSON.serialize(request) );

        } catch (RepositoryException e) {
            throw e;
            
        } catch (Exception e) {
            Database.rollback(savepoint);
            response.statusCode = 400;
            response.responseBody = Blob.valueOf( '{ "error": "' + e.getMessage() + '" }' );
        }
    }

    @HttpPut
    global static Account change (Account account) {
        
        Account changedAccount = (Account) repository.save(account).get(0);

        return account;
    }

    @HttpGet
    global static Account get () {

        RestRequest request = RestContext.request;

        String accountId = request.params.get('accountId');
        
        List<Account> accounts = repository.findById(accountId);

        return accounts.isEmpty() ? null : accounts.get(0);
    }

}