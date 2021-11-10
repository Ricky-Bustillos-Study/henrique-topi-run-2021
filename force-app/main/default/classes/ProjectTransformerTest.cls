/**
 * @author rickybustillos 
 */
@isTest
public class ProjectTransformerTest {
    
    @isTest
    public static void givenProjectWhenTransformedThenReturnTopiRun2021ProjectRequest() {
        
        TopiRun2021ProjectRequest expectedRequest = TopiRun2021FixtureFactory.newProjectRequest();

        Project__c project = ProjectFixtureFactory.newProject();

        ProjectTransformer transformer = new ProjectTransformer();

        Test.startTest();

        TopiRun2021ProjectRequest transformedProject = transformer.toTopiRun2021Project(project);

        Test.stopTest();

        System.assertEquals(expectedRequest.name, transformedProject.name);
        System.assertEquals(expectedRequest.budget, transformedProject.budget);
        System.assertEquals(expectedRequest.startDate, transformedProject.startDate);
        System.assertEquals(expectedRequest.endDate, transformedProject.endDate);
        System.assertEquals(expectedRequest.status, transformedProject.status);
    }
}
