/**
 * @author rickybustillos 
 */
public class ProjectFilter {
    
    public List<Project__c> byType(List<Project__c> projects, String type) {
        List<Project__c> filteredProjects = new List<Project__c>();

        for (Project__c project : projects) {
            if (project.Type__c.equals(type)) {
                filteredProjects.add(project);
            }
        }

        return filteredProjects;
    }

    public List<Project__c> byStatus(List<Project__c> projects, String status) {
        List<Project__c> filteredProjects = new List<Project__c>();

        for (Project__c project : projects) {
            if (project.Status__c.equals(status)) {
                filteredProjects.add(project);
            }
        }
        
        return filteredProjects;
    }

    public List<Project__c> byStatusChangedTo(List<Project__c> newProjects, Map<Id, Project__c> oldProjects, String status) {
        List<Project__c> filteredProjects = new List<Project__c>();

        List<Project__c> statusChangedProjects = byStatus(newProjects, status);

        for (Project__c project : statusChangedProjects) {
             
            Project__c oldProject = oldProjects.get(project.Id);

             if(oldProject.Status__c != project.Status__c) {
                 filteredProjects.add(project);
             }
        }

        return filteredProjects;
    }
}
