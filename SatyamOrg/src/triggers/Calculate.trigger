trigger Calculate on Item__c (before delete, before insert, before update) {
	
 Map<ID,Shipping_Invoice__c> updateMap = new Map<ID,Shipping_Invoice__c>();
 
 Integer subtract;
 
 List<Item__c> itemList;
 if(Trigger.isInsert||Trigger.isUpdate)
 {
 	itemList = Trigger.new;
 	subtract = 1;
 }else if(Trigger.isDelete)
 {
 	itemList = Trigger.old;
 	subtract = -1;
 }
 set<Id> Allitems = new set<Id>();
 
 for(Item__c i:itemList)
 {
 	system.assert(i.Quantity__c > 0, 'Quantity must be positive');
    system.assert(i.Weight__c >= 0, 'Weight must be non-negative');
    system.assert(i.Price__c >= 0, 'Price must be non-negative');
    
    Allitems.add(i.Shipping_Invoice__c);
 } 
 List<Shipping_Invoice__c> AllShippingInvoices = [SELECT id, ShippingDiscount__c, 
                   Sub_Total__c, TotalWeight__c, Tax__c, GrandTotal__c 
                   FROM Shipping_Invoice__C where id in :AllItems]; 
                   
  Map<ID,Shipping_Invoice__c> SIMap = new Map<ID,Shipping_Invoice__c>();
  
  for(Shipping_Invoice__c sc:AllShippingInvoices)
  {
  	SIMap.put(sc.id,sc);
  }
  
  if(Trigger.isUpdate){
  for(Integer x = 0; x < trigger.old.size(); x++)
        {
            Shipping_Invoice__c myOrder;
            myOrder = SIMap.get(trigger.old[x].Shipping_Invoice__c);

            // Decrement the previous value from the subtotal and weight.  
             
            myOrder.Sub_Total__c -= (trigger.old[x].Price__c * 
                                    trigger.old[x].Quantity__c);
            myOrder.TotalWeight__c -= (trigger.old[x].Weight__c * 
                                       trigger.old[x].Quantity__c);
                
            // Increment the new subtotal and weight.  
    
            myOrder.Sub_Total__c += (trigger.new[x].Price__c * 
                                    trigger.new[x].Quantity__c);
            myOrder.TotalWeight__c += (trigger.new[x].Weight__c * 
                                       trigger.new[x].Quantity__c);
        }
  for(Shipping_Invoice__C myOrder : AllShippingInvoices)
        {
            
            // Set tax rate to 9.25%  Please note, this is a simple example.    
    
            // Generally, you would never hard code values.  
    
            // Leveraging Custom Settings for tax rates is a best practice.    
    
            // See Custom Settings in the Apex Developer's guide   
    
            // for more information.  
    
            myOrder.Tax__c = myOrder.Sub_Total__c * .0925;
            
            // Reset the shipping discount  
           
            myOrder.ShippingDiscount__c = 0;
    
            // Set shipping rate to 75 cents per pound.    
    
            // Generally, you would never hard code values.  
    
            // Leveraging Custom Settings for the shipping rate is a best practice.  
    
            // See Custom Settings in the Apex Developer's guide   
    
            // for more information.  
             
            myOrder.Shipping__c = (myOrder.TotalWeight__c * .75);
            myOrder.GrandTotal__c = myOrder.Sub_Total__c + myOrder.tax__c + myOrder.Shipping__c;
            updateMap.put(myOrder.id, myOrder);
         }
  
  }
  else{
      for(Item__c itemToProcess : itemList)
        {
            Shipping_Invoice__C myOrder;
    
            // Look up the correct shipping invoice from the ones we got earlier  
    
            myOrder = SIMap.get(itemToProcess.Shipping_Invoice__C);
            myOrder.Sub_Total__c += (itemToProcess.Price__c * 
                                    itemToProcess.Quantity__c * subtract);
            myOrder.TotalWeight__c += (itemToProcess.Weight__c * 
                                       itemToProcess.Quantity__c * subtract);
        }
        
        for(Shipping_Invoice__C myOrder : AllShippingInvoices)
        {
            
             // Set tax rate to 9.25%  Please note, this is a simple example.    
    
             // Generally, you would never hard code values.  
    
             // Leveraging Custom Settings for tax rates is a best practice.    
    
             // See Custom Settings in the Apex Developer's guide   
    
             // for more information.  
    
             myOrder.Tax__c = myOrder.Sub_Total__c * .0925;
             
             // Reset shipping discount  
    
             myOrder.ShippingDiscount__c = 0;
    
            // Set shipping rate to 75 cents per pound.    
    
            // Generally, you would never hard code values.  
    
            // Leveraging Custom Settings for the shipping rate is a best practice.  
    
            // See Custom Settings in the Apex Developer's guide   
    
            // for more information.  
    
            myOrder.Shipping__c = (myOrder.TotalWeight__c * .75);
            myOrder.GrandTotal__c = myOrder.Sub_Total__c + myOrder.Tax__c + 
                                    myOrder.Shipping__c;
                                       
            updateMap.put(myOrder.id, myOrder);
    
         }  
  }
  // Only use one DML update at the end.  
    
     // This minimizes the number of DML requests generated from this trigger.  
    
     update updateMap.values();
  
}