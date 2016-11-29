public class MyOpprtunity {

  
 public String task { get; set; }
 public ApexPages.StandardSetController setCon 
  {
   get 
   {
    if(setCon == null) 
    {
        setCon = new ApexPages.StandardSetController(Database.getQueryLocator([Select Name,(Select Name,Phone,Email From Contacts), 
(Select Name,StageName,Type From Opportunities limit 1) from Account WHERE Id IN 
(SELECT AccountId FROM Opportunity)]));
    }
    return setCon;
   }
   set;
  }
  public List<Account> getAccounts() 
  {
   return (List<Account>) setCon.getRecords();
  }
}