/**
 * @author rickybustillos 
 */
public with sharing class ClearLeadLocationBatch implements Database.Batchable<SObject> {
    
    String query = 'SELECT Id, Street, PostalCode, City, Country FROM Lead WHERE Longitude = null';

    LeadRepository repository;

    public ClearLeadLocationBatch() {
        this.repository = new LeadRepository();

    }
    
    public Database.QueryLocator start (Database.BatchableContext context) {
        System.debug('ClearLeadLocationBatch Start');
        return Database.getQueryLocator(this.query);
    }

    public void execute (Database.BatchableContext context, List<SObject> scope) {
        System.debug('ClearLeadLocationBatch Executing');
        
        List<Lead> leads = (List<Lead>) scope;

        System.debug('Process [ ' + leads.size() + ' ] leads');
        
        for (Lead lead : leads) {
            lead.Longitude = -46.633308;
            lead.Latitude = -23.550070;
        }
        
        this.repository.save(leads);
        
    }
    
    public void finish (Database.BatchableContext context) {
        System.debug('ClearLeadLocationBatch Finish');

    }

    public static void start () {
        Database.executeBatch(new ClearLeadLocationBatch(), 3);
    }

}
