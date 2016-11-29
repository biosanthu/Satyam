trigger leadDuplicatePreventer on Lead (before insert, before update) {
Map<String, Lead> leadMap = new Map<String, Lead>();
   for (Lead lead : System.Trigger.new) {
              
     if ((lead.Email != null) && (System.Trigger.isInsert || (lead.Email != System.Trigger.oldMap.get(lead.Id).Email))) {
   
         // Make sure another new lead isn't also a duplicate
          if (leadMap.containsKey(lead.Email)) {
              lead.Email.addError('Another new lead has the same email address.');
          } else {
              leadMap.put(lead.Email, lead);
          }
      }
  }
  
  for(Lead lead:[Select email from Lead where email In : leadMap.KeySet()]){
     Lead newlead = leadMap.get(lead.email);
     newlead.email.adderror('A lead with this email address already exists.');
  }
}