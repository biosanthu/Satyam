trigger CheckAccountType on Account (after insert, after update) {
	
   
  	
   List <Contact> cons = new List <Contact>();
   if(Trigger.isInsert||Trigger.isUpdate){
   	List<Account> accts = [Select Name, Id,RecordTypeId,(Select Id, Record_type_Check__c From Contacts) From Account where RecordTypeId='012900000007H09' and id IN:Trigger.newMap.keySet()];
   for(Account a:accts){
   for(Contact c:a.Contacts){
   	if(!accts.isEmpty())
   {
       c.Record_type_Check__c = True;
   }
   else
   {
   	c.Record_type_Check__c = False;
   }
       cons.add(c);
   }
   }    
   update cons;
   }   
}