/**
 * @author rickybustillos
 */
public class CompleteLeadAddressJob implements Schedulable {

    LeadRepository repository;

    GetLeadAddressPublisher publisher;

    public CompleteLeadAddressJob() {
        this.publisher = new GetLeadAddressPublisher();
        this.repository = new LeadRepository();
    }

    public void execute (SchedulableContext context) {
        
        List<Lead> leads = this.repository.findByPendingCompleteAddress();

        if (leads.isEmpty()) {
            return;
        }

        this.publisher.publish(leads);
    }

    public static void start () {
        System.schedule('CompleteLeadAddress 10', '0 27 15 * * ?', new CompleteLeadAddressJob());
    }
}
