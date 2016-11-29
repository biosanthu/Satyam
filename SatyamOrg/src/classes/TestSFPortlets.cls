/*
 * SF Portlets Header - Do not remove!
 *
 * $Author: Aslam Bari  $
 * $Change:  $
 * $DateTime: 12 Oct, 2010 $
 * $File: TestSFPortlets.cls $
 * $Id:  $
 * $Revision:  1.0 $
 */

/*
 * This class is used test code coverage for all SF Portlets Classes
 *
 * Note: Code is written to just show the working demo. Can be optimized for best use.
 * @author Aslam Bari
*/
public class TestSFPortlets {
	@isTest
	private static void testSFPortletsApp(){
		Portlet_Config__c config = new Portlet_Config__c();
		config.Columns__c = 2;
		config.Theme__c = 'Default';
		insert config;
		
		List<Portlet__c> lstPortlets = new List<Portlet__c>();
		Portlet__c portletObj = new Portlet__c();
		portletObj.Name = 'test';
		portletObj.Portlet_Config__c = config.Id;
		portletObj.Type__c = 'Text';
		portletObj.Data__c = 'Test';
		portletObj.Active__c = true;
		lstPortlets.add(portletObj);
		
		Portlet__c portletObj2 = new Portlet__c();
		portletObj2.Name = 'test';
		portletObj2.Portlet_Config__c = config.Id;
		portletObj2.Type__c = 'Text';
		portletObj2.Data__c = 'Test';
		portletObj2.Active__c = true;
		lstPortlets.add(portletObj2);
		insert lstPortlets;
		
		PortletHomeController phc = new PortletHomeController();
		DBData.getData('SELECT Name, Email, Phone from Contact LIMIT 2');
	}

}