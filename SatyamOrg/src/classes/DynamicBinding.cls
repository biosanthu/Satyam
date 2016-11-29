public class DynamicBinding {
    
    public sObject sObjectToBind {get;set;}
    public List<String> listObjectFields {get;set;}
        
    public DynamicBinding()
    {
        listObjectFields =  new List<String>();
        Map<String , Schema.SObjectType> globalDescription = Schema.getGlobalDescribe();
        //In this example I have hard coded the object name
        Schema.sObjectType sObjType = globalDescription.get('Opportunity');
        
        sObjectToBind = sObjType.newSObject();
        Schema.DescribeSObjectResult r1 = sObjType.getDescribe();
        
        Map<String , Schema.SObjectField> mapFieldList = r1.fields.getMap();
        Integer i = 0;
        for(Schema.SObjectField field : mapFieldList.values())
            {
                Schema.DescribeFieldResult fieldResult = field.getDescribe();
                if(fieldResult.isAccessible() && fieldResult.isUpdateable())
                    {
                        listObjectFields.add(fieldResult.getName());
                    }
                if(i == 5)
                    break;
                
                i++;
            }
                        
    }
}