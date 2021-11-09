/**
 * @author rickybustillos 
 */
@isTest
public class ProjectFixtureFactory {
    
    public static Map<Id, Project__c> newProjectsMap (List<Project__c> projects) {
        return new Map<Id, Project__c>(projects);
    }

    public static List<Project__c> newProjects () {
        return new List<Project__c> {
            new Project__c (
                Status__c = 'Pendente', 
                Name = 'Project 1', 
                Type__c = 'Enterprise', 
                StartDate__c = Datetime.now().date(), 
                EndDate__c = Datetime.now().date().addDays(30), 
                Budget__c = 153000, 
                SynchronizationStatus__c = 'Pendente'),
            new Project__c (
                Status__c = 'Iniciado', 
                Name = 'Project 2', 
                Type__c = 'Custom', 
                StartDate__c = Datetime.now().date(), 
                EndDate__c = Datetime.now().date().addDays(30), 
                Budget__c = 68000, 
                SynchronizationStatus__c = 'Pendente'),
            new Project__c (
                Status__c = 'Concluído', 
                Name = 'Project 3', 
                Type__c = 'Enterprise', 
                StartDate__c = Datetime.now().date().addMonths(-8), 
                EndDate__c = Datetime.now().date().addDays(-25), 
                Budget__c = 180560, 
                SynchronizationStatus__c = 'Integrado com sucesso'),
            new Project__c (
                Status__c = 'Iniciado', 
                Name = 'Project 4', 
                Type__c = 'Enterprise', 
                StartDate__c = Datetime.now().date().addMonths(1), 
                EndDate__c = Datetime.now().date().addMonths(2), 
                Budget__c = 180560, 
                SynchronizationStatus__c = 'Integrado com sucesso')
        };
    }

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

    public static Map<Id, Project__c> createProjectsMap (List<Project__c> projects) {
        return new Map<Id, Project__c>( projects );
    }

    public static Map<Id, Project__c> createProjectsMap () {
        return createProjectsMap( createProjects() );
    }

    public static List<Project__c> createProjects () {
        return createProjects( newProjects() );
    }

    public static List<Project__c> createProjects (List<Project__c> projects) {

        ProjectRepository repository = new ProjectRepository();

        List<Project__c> createdProjects = repository.save(projects);

        return createdProjects;
    }
}
