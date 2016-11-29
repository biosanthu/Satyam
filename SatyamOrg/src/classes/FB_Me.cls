public with sharing class FB_Me {

	public string doFBMe(string accessToken){
		
		FB_Graph_Settings__c fb = FB_Graph_Settings__c.getInstance();
		string endpoint = 	fb.Graph_Endpoint__c+'me?access_token='+accessToken;
		return endpoint;
	}
	
	 
	
		
	
	/***********************************************************
	* 						TEST METHODS
	***********************************************************/
	
	static testMethod void test_doFBMe(){
		
		test.startTest();
		
		
		FB_Graph_Settings__c fb = FB_Graph_Settings__c.getInstance();
		
		if(fb == null) {
            fb = new FB_Graph_Settings__c(SetupOwnerId = UserInfo.getOrganizationId());
        }
        
        fb.API_Key__c = '7b2fd8227c4e4767d05c6d010c2d724d';
        fb.App_Secret__c = '53ccf99438c8968b94e68ec9d2ae631d';
        fb.Development_Mode__c = true;
        fb.FB_App_Id__c = '170909779623787';
        fb.FB_Permissions_Requested__c = 'email,read_stream,publish_stream,offline_access,user_birthday';
        fb.Graph_Endpoint__c = 'https://graph.facebook.com/';
        fb.Host_Header__c = 'graph.facebook.com';
        
        Database.upsert(fb);
		
		 
		string accessToken = '12345';
		FB_Me cls = new FB_Me();
		string endpoint = cls.doFBMe(accessToken);
		test.stopTest();
		
		system.assert(endpoint.contains(accessToken));
		
	}
	

}