/**
 * @author rickybustillos 
 */
@isTest
public class ProjectFixtureFactory {
    
    public static Project__c newProject () {
        return new Project__c(
            Status__c = 'Pendente',
            Name = 'Test Project',
            Type__c = 'Enterprise',
            StartDate__c = Datetime.now().date(),
            EndDate__c = Datetime.now().date().addDays(30),
            Budget__c = 60300,
            SynchronizationStatus__c = 'Pendente',
            ErrorMessage__c = ''
        );
    }

    public static Project__c createProject () {
        return createProject( newProject() );
    }

    public static Project__c createProject (Project__c project) {

        ProjectRepository repository = new ProjectRepository();

        List<Project__c> createdProject = repository.save(project);

        return createdProject.get(0);
    }

}
