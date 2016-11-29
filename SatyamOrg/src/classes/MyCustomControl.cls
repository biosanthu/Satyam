public class MyCustomControl
 { 

    public String task { get; set; }
  public ApexPages.StandardSetController setCon 
  {
   get 
   {
    if(setCon == null) 
    {
        setCon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT name,company,title,city,state,email,id, (SELECT id,subject FROM tasks order by lastmodifieddate desc limit 1) FROM lead]));
    }
    return setCon;
   }
   set;
  }
  public List<Lead> getleads() 
  {
// LdList = setCon.getRecords();
  return (List<Lead>) setCon.getRecords();
//  return LdList;
  }



 //Task task;
 //public MyCustomControl()
 //{
  // task =[select subject from Task where whoid =:ApexPages.currentPage().getParameters().get('id') limit 1];
 //}

// public Task getTask()
 //{
  // return task;
 //}
 }