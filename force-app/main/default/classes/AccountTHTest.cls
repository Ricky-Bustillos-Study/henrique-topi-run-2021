/**
 * @author rickybustillos
 */
@isTest(seeAllData = true)
public class AccountTHTest {
  @isTest
  public static void givenAccountToEditWhenEditItThenReturnFormattedValidDocumentNumber() {

    User user = [SELECT Name, Id FROM user LIMIT 1];

    Account accountToEdit = AccountFixtureFactory.createAccount();
    
    AccountRepository accountRepository = new AccountRepository();
    
    System.runAs(user) {
      
      accountToEdit.DocumentNumber__c = '66435228540';
      accountRepository.save(accountToEdit);

      Account editedAccount = accountRepository.findById(accountToEdit.Id)[0];
  
      System.assertEquals(editedAccount.DocumentNumber__c, '664.352.285-40');
      
    }
  }
}