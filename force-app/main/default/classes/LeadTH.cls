/**
 * @author rickybustillos
 */
public with sharing class LeadTH extends TriggerHandler {
    List<Lead> newLeads;

    Map<Id, Lead> oldLeads;

    LeadFilter filter;

    GetLeadAddressPublisher publisher;

    public LeadTH() {
        this((List<Lead>)Trigger.new, (Map<Id, Lead>)Trigger.oldMap);
    }

    public LeadTH(List<Lead> newLeads, Map<Id, Lead> oldLeads) {
        this.newLeads = newLeads;
        this.oldLeads = oldLeads;
        this.filter = new LeadFilter();
        this.publisher = new GetLeadAddressPublisher();
    }

    override 
    public void afterInsert() {
        this.publishLeadAddress();
    }

    override 
    public void afterUpdate() {
        this.publishLeadAddress();
    }

    public void publishLeadAddress () {
        
        List<Lead> leads = this.filter.byChangedPostalCode(newLeads, oldLeads);

        this.publisher.publish(leads);
    }
}