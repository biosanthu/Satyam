public with sharing class DisplaySectionsController {
    public List<Account> accounts {get;set;}
    public String[] states {get;set;}
  public void load(){
        accounts = [Select ID, Name,BillingStreet,BillingCity,BillingState,BillingPostalCode,BillingCountry From Account Where BillingState IN ('CA','NY','TN','DE','IL')];
        Set<String> stateset = new Set<String>();
        for(Account a:accounts)
        stateset.add(a.BillingState);
        
        states = new String[stateset.size()];
        integer i=0;
        for(String state:stateset)
        {
        	states[i]= state;
        	i++;
        }
  }      
  
}