/*
 * SF Portlets Header - Do not remove!
 *
 * $Author: Aslam Bari  $
 * $Change:  $
 * $DateTime: 12 Oct, 2010 $
 * $File: PortletHomeController.cls $
 * $Id:  $
 * $Revision:  1.0 $
 */

/*
 * This class is main PortletHome Page controller. Responsible for fetching all config
 * and portlet data load the page.
 *
 * Note: Code is written to just show the working demo. Can be optimized for best use.
 * @author Aslam Bari
*/
public class PortletHomeController{    
    public PortletConfig config{get;set;}
    public Integer flag{get;set;}
    public List<Portlet> portletList{get;set;}
    public List<List<Portlet>> allPortletList{get;set;}
    public integer columns {get;set;}
    public integer rows {get;set;}
    
    //Constructor
    public PortletHomeController(){
        config = new PortletConfig();
        config.settings.Columns__c = config.settings.Columns__c == null ? 0 : config.settings.Columns__c;
        columns = Integer.valueOf(config.settings.Columns__c + '');
        portletList = new List<Portlet>();
        allPortletList = new List<List<Portlet>>();
        for(Portlet__c prt: [SELECT Id, Name, Type__c, Data__c from Portlet__c WHERE Portlet_Config__c =: config.settings.Id AND Active__c = true ORDER BY LastModifiedDate DESC]){
            Portlet prtObj = new Portlet(prt); 
            portletList.add(prtObj);  
        }  
        integer index = 0;
        rows = (Math.ceil(portletList.size() / config.settings.Columns__c)).intValue();
        for(integer row = 1; row <= columns ; row++){
            List<Portlet> tempList = new List<Portlet>();
            for(integer column = 0; column < rows && index < portletList.size(); column++){
                tempList.add(portletList.get(index++));
            }
            allPortletList.add(tempList);
        }
    }
}