trigger AddMA on Contact (after insert) {
 List<MarketingObject__c>  MarketingObjectVar = new List<MarketingObject__c>();
 Lead lead = new Lead();
 for (Contact ct: Trigger.New){
 if(lead.LastActivityDate <> null )
 MarketingObjectVar.add(new MarketingObject__c(Name='hai',Last_Activity_Date__c = lead.LastActivityDate));  
 }
 insert MarketingObjectVar;
}