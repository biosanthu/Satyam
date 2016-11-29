trigger AddMarketObjectFields on Lead (after update) {
 List<MarketingObject__c>  MarketingObjectVar = new List<MarketingObject__c>();

    for(Lead lead:Trigger.old) 
    {                               
      if(lead.Status == 'Closed - Converted')           
       {
      // Assign the Activity date from lead object to Marketing object              
                 MarketingObjectVar.add(new MarketingObject__c(Name='hai',Last_Activity_Date__c= lead.LastActivityDate));     
      }    
      }    
     insert MarketingObjectVar;
    }