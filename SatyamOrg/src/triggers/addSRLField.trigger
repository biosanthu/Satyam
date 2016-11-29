trigger addSRLField on Contact (after insert,after update) {
List<Sales_Ready_Lead__c>  SRLead = new List<Sales_Ready_Lead__c>();
  
   for (Contact ct: Trigger.New){
                   if(ct.LeadScore__c > 10){
                 SRLead.add(new Sales_Ready_Lead__c( Name='SRL-'+ ct.id ,Contact__c =ct.id,Product__c ='01t90000000EVYeAAO',HSTM_User__c=UserInfo.getUserId(),Status__c='InProgress',Account__c=ct.AccountId));                     
   }  
} 
  insert SRLead;
}