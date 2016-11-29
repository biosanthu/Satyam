public class OliControl {

 List<MarketingObject__c> MarketingObjects ;

public ApexPages.StandardSetController setCon 
{
get 
{
if(setCon == null) 
{
setCon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id, Name,Stagename,account.name,Type,Amount,LeadSource,createdDate,MarketingObject__r.Name,MarketingObject__r.Customer_Number__c,MarketingObject__r.CreatedDate,
(SELECT Description,Quantity, UnitPrice, TotalPrice,PricebookEntry.Name,PricebookEntry.ProductCode
FROM OpportunityLineItems)
FROM Opportunity where id =:ApexPages.currentPage().getParameters().get('id')]));
}
return setCon;
}
set;
}
public List<Opportunity> getopportunities() 
{
return (List<Opportunity>) setCon.getRecords();
}
public List<MarketingObject__c> getMarketingObjects() {
 MarketingObjects = [select name,Customer_number__c,createdDate,opportunity_name__c from marketingobject__c  where opportunity_name__c = :ApexPages.currentPage().getParameters().get('id')];
     return MarketingObjects;
  }
}