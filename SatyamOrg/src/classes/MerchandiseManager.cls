@RestResource(urlMapping ='/Merchandise/*')
global with sharing class MerchandiseManager{
   @HttpGet
       global static Merchandise__c getMerchandiseById(){
          RestRequest req = RestContext.request;
          String merchid = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
          Merchandise__c result= [SELECT Name,Description__c,Price__c,Total_Inventory__c from Merchandise__c WHERE Id =:merchid];
          return result; 
       }    
    
   @HttpPost
       global static string createMerchandise(String name,String description,Decimal price,Double inventory){
        Merchandise__c m = new Merchandise__c(
                            Name= name,
                            Description__c= description,
                            Price__c = price,
                            Total_Inventory__c = inventory);
         insert m;
         return m.id;  
       } 
}