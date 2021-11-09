/**
 * @author rickybustillos 
 */
@isTest
public class ProjectFilterTest {
    
    @isTest
    public static void givenProjectsWhenFilteredByTypeThenReturnFiltered() {
        
        ProjectFilter filter = new ProjectFilter();

        List<Project__c> projects = ProjectFixtureFactory.newProjects();

        Test.startTest();

        List<Project__c> filtered = filter.byType(projects, 'Enterprise');

        Test.stopTest();

        System.assertEquals(3, filtered.size());
    }

    @isTest
    public static void givenProjectsWhenFilteredByStatusThenReturnFiltered() {
        
        ProjectFilter filter = new ProjectFilter();

        List<Project__c> projects = ProjectFixtureFactory.newProjects();

        Test.startTest();

        List<Project__c> filtered = filter.byStatus(projects, 'Iniciado');

        Test.stopTest();

        System.assertEquals(2, filtered.size());
    }

    
    @isTest
    public static void givenUpdatedProjectsWhenFilteredChangesByStatusThenReturnFiltered() {
        
        ProjectRepository repository = new ProjectRepository();

        ProjectFilter filter = new ProjectFilter();
        
        List<Project__c> newProjects = ProjectFixtureFactory.createProjects();
    
        Map<Id,Project__c> oldProjects = ProjectFixtureFactory.newProjectsMap(repository.findAll());

        newProjects.get(0).Status__c = 'Iniciado';

        Test.startTest();
        
        List<Project__c> filtered = filter.byStatusChangedTo(newProjects, oldProjects, 'Iniciado');

        Test.stopTest();

        System.assertEquals(1, filtered.size());
        System.assertEquals('Iniciado', filtered.iterator().next().Status__c);
        
    }
}
