public class MobileInventoryExtension {
   
    //Constructors.  Needed to use as an extension.
    public MobileInventoryExtension(ApexPages.StandardController c) {}
    public MobileInventoryExtension(ApexPages.StandardSetController c) {}
   
    //Remote Action function allows JavaScript to call Apex directly
    @RemoteAction
    public static String updateMerchandiseItem(String productId,
Integer newInventory) {
             List<Merchandise__c> m = [SELECT Id, Name, Price__c, Total_Inventory__c, Description__c from Merchandise__c WHERE Id =: productId LIMIT 1];
            if(m.size() > 0) {
                m[0].Total_Inventory__c = newInventory;
                try {
                    update m[0];
                    return 'Item Updated';
                } catch (Exception e) {
                    return e.getMessage();
                }  
            }
            else {
                return 'No item found with that ID';
            }  
        }    
}