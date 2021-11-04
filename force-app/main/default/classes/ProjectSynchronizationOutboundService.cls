/**
 * @author rickybustillos 
 */
public class ProjectSynchronizationOutboundService {

    ProjectTransformer transformer;

    ProjectRepository repository;
    
    public ProjectSynchronizationOutboundService() {
        this.transformer = new ProjectTransformer();
        this.repository = new ProjectRepository();
    }

    public Project__c putProject(Project__c project) {

        TopiRun2021Project transformedProject = transformer.toTopiRun2021Project(project);

        // todo: create a JSON object to send
        // todo: set PUT request to TopiRun2021 API
        // todo: if status code is 200, update SyncStatus & LastSyncDate
        // todo: if not, update ErrorMessage

        return project;
    }
}
