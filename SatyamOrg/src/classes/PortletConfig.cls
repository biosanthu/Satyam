/*
 * SF Portlets Header - Do not remove!
 *
 * $Author: Aslam Bari  $
 * $Change:  $
 * $DateTime: 12 Oct, 2010 $
 * $File: PortletConfig.cls $
 * $Id:  $
 * $Revision:  1.0 $
 */

/*
 * This class is used to hold Portlet Config and Loads the configuration settings
 *
 * Note: Code is written to just show the working demo. Can be optimized for best use.
 * @author Aslam Bari
*/
public class PortletConfig{
    public Portlet_Config__c settings{get;set;}
    public string portletWidth {get;set;}
    public string logoId {get;set;}
    public PortletConfig(){        
        List<Portlet_Config__c> configList = [SELECT Id, Show_Header__c, Columns__c,Portlet_Width__c, Theme__c, Show_Section_Bar__c, Section_Title__c,(Select Id from Attachments ORDER BY CreatedDate DESC LIMIT 1), Section_SubTitle__c from Portlet_Config__c ORDER BY CreatedDate DESC LIMIT 1];
        if(configList.size() > 0){
            settings = configList.get(0);
        }else{
            settings = new Portlet_Config__c();
        }
        
        if(settings.Portlet_Width__c != null)
            portletWidth = settings.Portlet_Width__c + '';
        else
            portletWidth = '250';
            
        
        if(settings.Attachments.size() > 0){
            logoId = settings.Attachments.get(0).Id;
        }
    }
}