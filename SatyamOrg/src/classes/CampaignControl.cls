public class CampaignControl
{ 
  private Campaign Campaign1;     
    
 public CampaignControl (ApexPages.StandardController controller) 
 {         
     this.Campaign1 =(Campaign)controller.getRecord();   
 }      
 
 List<Campaign> CampaignControl = new List<Campaign>();        
 public List<Campaign> Campaign 
 {    
     get
     {            
         CampaignControl= [Select startdate,enddate,type,Name from campaign];            
         return CampaignControl;    
     }        
 }          
}