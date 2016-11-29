/*
 * SF Portlets Header - Do not remove!
 *
 * $Author: Aslam Bari  $
 * $Change:  $
 * $DateTime: 12 Oct, 2010 $
 * $File: DBData.cls $
 * $Id:  $
 * $Revision:  1.0 $
 */

/*
 * This class is used to get Query type porlet data. It accepts one dynamic 
 * query from the user enterd and provide the result to portlet.
 *
 * Note: Code is written to just show the working demo. Can be optimized for best use.
 * @author Aslam Bari
*/
public class DBData{
    private static String outputData = '';
    private static Map<String,Map<String, Schema.SObjectField>> fieldMaps= new Map<String,Map<String, Schema.SObjectField>>();
 
    private static Set<String> getFields(String sQuery){
        integer startIndex;
        integer lastIndex = sQuery.indexOf('from');
        startIndex = sQuery.indexOf('select');
        List<String> tokens = sQuery.split(' ');
        List<String> fieldTokens;
        sQuery = sQuery.substring(startIndex + 6, lastIndex);
        fieldTokens = sQuery.split(',');

        if(fieldTokens != null && fieldTokens.size() > 0){
           Set<String> fields = new Set<String>();
           for(String field: fieldTokens){
               fields.add(field.trim());
           }
           return fields; 
        }
        return null;
    }
    
    public static string getData(string query){
        outputData = '<table class="sf-table">';
        try{
            
            if(query != null && query.trim().length() > 0 ){
                query =  query.trim().toLowerCase();
                List<SObject> objects = Database.Query(query);
                Schema.SObjectType sObjType=objects[0].getSObjectType();
                Schema.DescribeSObjectResult descRes= sObjType.getDescribe();
                Map<String, Schema.SObjectField> fieldMap= descRes.fields.getMap();
                Set<String> fields = getFields(query);
                //outputData = '<table>';
                outputdata += '<tr>';
                for(String key : fields){
                    outputData += '<th class="sf-heading ui-widget-header">' + key + '</th>';
                }
                outputData += '</tr>';
                
                for(SObject obj: objects){
                    outputData += '<tr>';
                    for(String key : fields){
                        getFieldData(obj, key, fieldMap);
                    }                    
                    
                     outputData = outputData.substring(0,outputData.length());
                     outputData += '</tr>';
                     System.debug('### Output = ' + outputData);
                 }
                 
                  
                 
            }
        }catch(Exception e){
            System.debug(e);
        }
        outputData += '</table>';
        return outputData;
    }
    
    /**
    * Method : getFieldData
    *
    * @param object SObject
    * @param key String
    * @param object SObject
    * @param fieldMap Map<String, Schema.SObjectField>*/

    private static void getFieldData(SObject sfObject, String key, Map<String, Schema.SObjectField> fieldMap){
    System.Debug('##### - Key == ' + key);
        if(key.indexOf('.') < 0){
            if(fieldMap.get(key) != null){
                outputData = outputData + '<td>' + (sfObject.get(fieldMap.get(key))==null ? ' ' : sfObject.get(fieldMap.get(key))) + '</td>';
                //System.debug('### outputdata = ' + outputData);
            }
            return;        
        }
        String objectKey =key.subString(0,key.indexOf('.')).trim();
        String subjectKey =key.subString(key.indexOf('.')+1).trim();
        SObject childData = sfObject.getSObject(objectKey);
        
        if(fieldMaps.containsKey(key)){
          fieldMap=fieldMaps.get(key);
        }
        else{
          if(childData != null){
            Schema.SObjectType sObjType=childData.getSObjectType();
            Schema.DescribeSObjectResult descRes= sObjType.getDescribe();
            fieldMap = descRes.fields.getMap();
            fieldMaps.put(key,fieldMap);
          }
        }
            
        if(childData != null)  {
          getFieldData(childData, subjectKey, fieldMap);
          
        }
        else{
          outputData = outputData;
          return;
        }
    }
}