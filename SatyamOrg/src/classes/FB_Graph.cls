public with sharing class FB_Graph {
  	 
	
	boolean FBDevMode;
	
	public string doCallout(string endpoint){
		try{
			
			FBDevMode = FB_Graph_Settings__c.getInstance().Development_Mode__c;
				
			Http h = new Http();
			HttpRequest req = buildWebServiceRequest(endpoint);
			HttpResponse res = new HttpResponse();
			
			if(FBDevMode == false){
				res = invokeWebService(h, req);
			}
			
	        return handleWebServiceResponse(res, FBDevMode);
		
		}catch(exception e){
			system.debug(e);
			return null;
		}
     }
     
     public string doPOSTCallout(string body, string endpoint){
		try{
			
			FBDevMode = FB_Graph_Settings__c.getInstance().Development_Mode__c;
				
			Http h = new Http();
			HttpRequest req = buildPOSTWebServiceRequest(body, endpoint);
			HttpResponse res = new HttpResponse();
			
			if(FBDevMode == false){
				res = invokeWebService(h, req);
			}
			
	        return handleWebServiceResponse(res, FBDevMode);
		
		}catch(exception e){
			system.debug(e);
			return null;
		}
     }
	
	//GET
	public HttpRequest buildWebServiceRequest(string endpoint){ 
		
		try{
			FB_Graph_Settings__c fb = FB_Graph_Settings__c.getInstance();
			httpRequest req = new httpRequest();
	        req.setMethod('GET');
	        req.setHeader('content-type', 'application/x-www-form-urlencoded');
	        req.setTimeout(60000);
	        req.setHeader('Host',fb.Host_Header__c);
	        req.setEndpoint(endpoint);
	        system.debug('req: ' + req);
	        return req;
		}catch(exception e){
			system.debug(e);
			return null;
		}
		
     }
     
     //POST
     public HttpRequest buildPOSTWebServiceRequest(string body, string endpoint){
		
		try{
			
			FB_Graph_Settings__c fb = FB_Graph_Settings__c.getInstance();
			httpRequest req = new httpRequest();
	        req.setMethod('POST');
	        req.setHeader('content-type', 'application/x-www-form-urlencoded');
	        req.setTimeout(60000);
	        req.setHeader('Host',fb.Host_Header__c);
	        req.setBody(body);
	        req.setEndpoint(endpoint);
	        system.debug('req: ' + req);
	        return req;
		}catch(exception e){
			system.debug(e);
			return null;
		}
		
     }
	
	public HttpResponse invokeWebService(Http h, HttpRequest req){  
        try{
        	Http http = new Http();
		    HTTPResponse res = http.send(req);
		    system.debug('Value of request to API Response: ' + res.getBody());
		    return res;
        }catch(exception e){
        	system.debug(e);
        	return null;
        }
        
     }
     
     public string handleWebServiceResponse(HttpResponse res, boolean devMode){
     	try{
     		
     		if(devMode == true){
     			FB_JSON fbjson = new FB_JSON();
     			return fbjson.testJSON();
     		}else{
     			if(res.getBody() != null){
     				return res.getBody();
			    }
			}
     		
     		return null;
     	
     	}catch(exception e){
     		system.debug(e);
     		return null;
     	}
     } 
     
     
     
     			
	/***********************************************************
	* 						TEST METHODS
	***********************************************************/
	
	static testMethod void test_doCallout(){
		
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
		
		
		FB_Graph cls = new FB_Graph();
		FB_Me fbme = new FB_Me();
		string endpoint = fbme.doFBMe('170909779623787|add081be8cee79498deb83e2-1070072033|rbxxO_e6jLX2WPH2qxDAxG0BoP8');
		string testCallout = cls.doCallout(endpoint);
		test.stopTest();
		system.assert(endpoint != null);
	}
	
	static testMethod void test_doPOSTCallout(){
		//&#124;
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
        
		FB_Graph cls = new FB_Graph();
		FB_Me fbme = new FB_Me();
		string endpoint = fbme.doFBMe('170909779623787|add081be8cee79498deb83e2-1070072033|rbxxO_e6jLX2WPH2qxDAxG0BoP8');
		string body = ''; //TODO
		string testCallout = cls.doPOSTCallout(body, endpoint);
		test.stopTest();
		system.assert(endpoint != null);
	}
	
     
      
     
     
     
     
}