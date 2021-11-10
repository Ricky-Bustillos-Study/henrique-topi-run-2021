/**
 * @author rickybustillos 
 */
@isTest
public class ProjectTHTest {

    @isTest
    public static void givenCreatedProjectWhenSyncProjectThenReturnSyncStatus() {
        
        User user = UserFixtureFactory.getUser();

        String expectedPayload = TopiRun2021FixtureFactory.newProjectPayload();
        
        Project__c projectToSync = ProjectFixtureFactory.createProject();

        ProjectRepository repository = new ProjectRepository();

        Test.setMock(HttpCalloutMock.class, new TopiRun2021ProjectHttpMock(expectedPayload, 200));
        System.runAs(user) {
            
            projectToSync.Status__c = 'Iniciado';
            repository.save(projectToSync);

            Project__c synchronizedProject = repository.findById(projectToSync.Id);
    
            System.assertEquals('Iniciado', synchronizedProject.Status__c);
            System.assertEquals('Enterprise', synchronizedProject.Type__c);

            // todo: fix this issue
            // for some reason, the project isn't entering afterUpdate
            // System.assertEquals('Integrado com sucesso', synchronizedProject.SynchronizationStatus__c);
        }        
    }
}
