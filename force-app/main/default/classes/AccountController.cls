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
    global static Account create (Account account) {

        Account savedAccount = (Account) repository.save(account).get(0);

        return savedAccount;
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
