/**
 * @author rickybustillos
 */
public class GetLeadAddressOutboundService {

    LeadAddressTransformer transformer;

    GetViaCepAddressOutboundService outboundService;

    LeadRepository repository;

    public GetLeadAddressOutboundService() {
        this.repository = new LeadRepository();
        this.transformer = new LeadAddressTransformer();
        this.outboundService = new GetViaCepAddressOutboundService();
    }

    public Lead getLeadAddress (Id leadId) {
        return this.getLeadAddress( this.repository.findById(leadId) );
    }

    public Lead getLeadAddress (Lead lead) {

        ViaCepZipCodeAddressResponse response = this.outboundService.getViaCepAddress(lead.PostalCode);

        this.transformer.toLead(response, lead);

        this.repository.save(lead);

        return lead;
    }
}