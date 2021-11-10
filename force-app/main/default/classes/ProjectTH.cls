/**
 * @author rickybustillos 
 */
public with sharing class ProjectTH extends TriggerHandler {

    List<Project__c> newProjects;

    Map<Id, Project__c> oldProjects;

    ProjectFilter filter;

    PutProjectSynchronizationPublisher projectSyncPublisher;
    
    public ProjectTH() {
        this((List<Project__c>)Trigger.new, (Map<Id, Project__c>)Trigger.oldMap);
    }

    public ProjectTH(List<Project__c> newProjects, Map<Id, Project__c> oldProjects) {
        this.newProjects = newProjects;
        this.oldProjects = oldProjects;
        this.filter = new ProjectFilter();
        this.projectSyncPublisher = new PutProjectSynchronizationPublisher();
    }

    override
    public void afterUpdate() {

        this.publishEnterpriseProjects();
    }
    
    public void publishEnterpriseProjects() {
        // todo: filter Enterprise projects
        List<Project__c> enterpriseProjects = this.filter.byType(this.newProjects, 'Enterprise');

        // todo: filter if project status changed to Iniciado
        List<Project__c> newStartedProjects = this.filter.byStatusChangedTo(enterpriseProjects, this.oldProjects, 'Iniciado');

        // todo: publish to TopiRun2021 & enrich with SynchronizationStatus and LastSyncDate
        this.projectSyncPublisher.publish(newStartedProjects);
    }

}
