trigger UpdateExisting on Merchandise__c (before insert) {
 Map<string,Merchandise__c > merext = new Map<string,Merchandise__c >();
 String  MerchandId ;
 List<Merchandise__c> upsertlist = new  List<Merchandise__c>();
 for(Merchandise__c m:trigger.new){
 
 MerchandId = m.External_ID__c;
 merext.put(MerchandId,m); 
 
 }
 
 for(Merchandise__c mlist:[SELECT Id,Description__c,External_ID__c,Name,Price__c,Total_Inventory__c FROM Merchandise__c where External_ID__c IN :merext.keyset()]){

 
    upsertlist.add(mlist); 
 }
 upsert upsertlist External_ID__c;
}