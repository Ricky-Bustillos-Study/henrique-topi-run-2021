/**
 * @author rickybustillos 
 */
@isTest
public class ProjectSyncOutboundServiceTest {
    
    @isTest
    public static void givenProjectToSyncWhenSyncThenReturnProjectWithError() {
        
        Project__c project = ProjectFixtureFactory.createProject();

        String errorResponsePayload = TopiRun2021FixtureFactory.newProjectErrorPayload();

        TopiRun2021ErrorResponse errorResponse = TopiRun2021FixtureFactory.newErrorResponse();

        ProjectSynchronizationOutboundService service = new ProjectSynchronizationOutboundService();

        Test.setMock(HttpCalloutMock.class, new TopiRun2021ProjectHttpMock(errorResponsePayload, 400));
        Test.startTest();

        service.putProject(project);

        Test.stopTest();

        ProjectRepository repository = new ProjectRepository();

        Project__c projectFromRepository = repository.findById(project.Id);

        System.assertEquals(errorResponse.errorMessage, projectFromRepository.ErrorMessage__c);
        System.assertEquals('Erro na sincronização de projetos', projectFromRepository.SynchronizationStatus__c);
    }

}
