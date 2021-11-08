/**
 * @author rickybustillos 
 */
@isTest
public class ProjectEnricherTest {
    
    @isTest
    public static void givenValidProjectWhenEnrichedWithErrorSyncThenReturnErrorSyncStatus() {
        
        ProjectEnricher enricher = new ProjectEnricher();

        Project__c project = ProjectFixtureFactory.newProject();

        TopiRun2021ErrorResponse errorResponse = TopiRun2021FixtureFactory.newErrorResponse();

        Test.startTest();

        Project__c enrichedProject = enricher.withError(project, errorResponse);

        Test.stopTest();

        System.assertEquals('Erro na sincronização de projetos', enrichedProject.SynchronizationStatus__c);
        System.assertEquals(errorResponse.errorMessage, enrichedProject.ErrorMessage__c);
    }

    @isTest
    public static void givenValidProjectWhenEnrichedWithSuccessSyncThenReturnSuccessSyncStatus() {
        
        ProjectEnricher enricher = new ProjectEnricher();

        Project__c project = ProjectFixtureFactory.newProject();

        Test.startTest();

        Project__c enrichedProject = enricher.withSuccessSyncStatus(project);

        Test.stopTest();

        System.assertEquals('Integrado com sucesso', enrichedProject.SynchronizationStatus__c);
        System.assert(String.isEmpty(enrichedProject.ErrorMessage__c));
    }
}
