/**
 * @author rickybustillos 
 */
virtual public class ProjectRepository extends AbstractRepository {
  virtual
  public Project__c findById(String id) {
    return [ SELECT Id, Name, Code__c, Status__c,
              StartDate__c, EndDate__c, Budget__c,
              SynchronizationStatus__c, LastSyncDate__c,
              Type__c
            FROM Project__c
            WHERE Id = :id ];
  }
}
