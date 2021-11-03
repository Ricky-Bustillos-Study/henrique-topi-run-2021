/**
 * @author rickybustillos 
 */
public class LeadFilter {
    

    public List<Lead> byChangedPostalCode (List<Lead> newLeads, Map<Id, Lead> oldLeads) {

        List<Lead> filteredLeads = new List<Lead>();

        for (Lead lead : newLeads) {

            Lead oldLead = oldLeads.get(lead.Id);

            if( String.isNotEmpty(lead.PostalCode) && oldLead == null) {
                filteredLeads.add(lead);
                continue;
            }

            if( String.isNotEmpty(lead.PostalCode) && lead.PostalCode != oldLead.PostalCode) {
                filteredLeads.add(lead);
            }
        }

        return filteredLeads;

    }

}
