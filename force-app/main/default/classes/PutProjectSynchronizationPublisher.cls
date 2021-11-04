/**
 * @author rickybustillos 
 */
public class PutProjectSynchronizationPublisher {

    public static ProjectSynchronizationOutboundService outboundService;

    static {
        outboundService = new ProjectSynchronizationOutboundService();
    }

    public PutProjectSynchronizationPublisher() {
    }

    public void publish(List<Project__c> projects) {
        for (Project__c project : projects) {
            System.enqueueJob(new QueuedProjectSynchronizationOutbound(project));
        }
    }

    public class QueuedProjectSynchronizationOutbound implements Queueable, Database.AllowsCallouts {

        Project__c project;

        ProjectSynchronizationOutboundService outboundService;

        public QueuedProjectSynchronizationOutbound(Project__c project) {
            this.project = project;
            this.outboundService = new ProjectSynchronizationOutboundService();
        }

        public void execute(QueueableContext context) {
            this.outboundService.putProject(this.project);
        }

    }
}
