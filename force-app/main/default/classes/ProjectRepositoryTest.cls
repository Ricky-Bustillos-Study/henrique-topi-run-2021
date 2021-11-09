/**
 * @author rickybustillos 
 */
@isTest
public class ProjectRepositoryTest {
    
    @isTest
    public static void givenCreatedProjectWhenFindByIdThenReturnProject() {
        
        Project__c createdProject = ProjectFixtureFactory.createProject();

        ProjectRepository repository = new ProjectRepository();

        Test.startTest();

        Project__c foundProject = repository.findById(createdProject.Id);

        Test.stopTest();

        System.assert(foundProject != null);
        System.assertEquals(createdProject.Id, foundProject.Id);
        System.assertEquals(createdProject.Name, foundProject.Name);
        System.assertEquals(createdProject.Status__c, foundProject.Status__c);
        System.assertEquals(createdProject.Budget__c, foundProject.Budget__c);
    }

    @isTest
    public static void givenCreatedProjectsWhenFindAllThenReturnAll() {
        
        List<Project__c> createdProjects = ProjectFixtureFactory.createProjects();

        ProjectRepository repository = new ProjectRepository();

        Test.startTest();

        List<Project__c> foundProjects = repository.findAll();

        Test.stopTest();

        System.assertEquals(4, foundProjects.size());
    }

}
