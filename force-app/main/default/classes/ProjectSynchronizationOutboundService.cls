/**
 * @author rickybustillos
 */
public class ProjectSynchronizationOutboundService {

    ProjectTransformer transformer;

    ProjectRepository repository;

    ProjectEnricher enricher;

    TopiRun2021ProjectOutboundService outboundService;

    public ProjectSynchronizationOutboundService() {
        this.transformer = new ProjectTransformer();
        this.repository = new ProjectRepository();
        this.outboundService = new TopiRun2021ProjectOutboundService();
        this.enricher = new ProjectEnricher();
    }

    public void putProject(Project__c project) {

        project = this.repository.findById(project.Id);

        TopiRun2021ProjectRequest transformedProject = transformer.toTopiRun2021Project(project);

        HttpResponse response = this.outboundService.putTopiRun2021Project(transformedProject);

        if ( response.getStatusCode() != 200 ) {
            TopiRun2021ErrorResponse errorResponse = (TopiRun2021ErrorResponse) JSON.deserialize(response.getBody(), TopiRun2021ErrorResponse.class);

            System.debug('Retornou erro');
            this.enricher.withError(project, errorResponse);
            
        } else {
            System.debug('Retornou sucesso');
            this.enricher.withSuccessSyncStatus(project);
        }
    }
}
