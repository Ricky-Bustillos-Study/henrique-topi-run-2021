/**
 * @author rickybustillos
 */
virtual public class ProjectRepository extends AbstractRepository {
	virtual public List<Project__c> findAll() {
		return [ SELECT Id, Name, Code__c, Status__c,
					StartDate__c, EndDate__c, Budget__c, 
					SynchronizationStatus__c, LastSyncDate__c, Type__c,
					ErrorMessage__c
				FROM Project__c ];
	}

	virtual public Project__c findById(String id) {
		return [ SELECT Id, Name, Code__c, Status__c, 
		            StartDate__c, EndDate__c, Budget__c, 
					SynchronizationStatus__c, LastSyncDate__c, Type__c,
					ErrorMessage__c
		        FROM Project__c
		        WHERE Id = :id 
						LIMIT 1];
	}
}