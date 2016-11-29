/*
 * SF Portlets Header - Do not remove!
 *
 * $Author: Aslam Bari  $
 * $Change:  $
 * $DateTime: 12 Oct, 2010 $
 * $File: Portlet.cls $
 * $Id:  $
 * $Revision:  1.0 $
 */

/*
 * This class is used to hold Portlet Model
 *
 * Note: Code is written to just show the working demo. Can be optimized for best use.
 * @author Aslam Bari
*/
public class Portlet{
        public Portlet__c portletRecord {get;set;}
        public string getTableData(){
            if(portletRecord.Type__c == 'Query'){
                return DBData.getData(portletRecord.Data__c.trim());
            }
                return '';
        }
        public Portlet(Portlet__c prt){
            portletRecord = prt;
        }
    }