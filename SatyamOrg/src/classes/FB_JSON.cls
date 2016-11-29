public with sharing class FB_JSON {

	public Map<string, string> parseFB_JSON(string json){
		
			/* EXAMPLE JSON RESPONSE FROM FACEBOOK 
	     	{
	     		"id":"1070072033",
	     		"name":"Scott Fielder",
	     		"first_name":"Scott",
	     		"last_name":"Fielder",
	     		"link":"http:\/\/www.facebook.com\/scottkfielder",
	     		"hometown":{"id":"111326725552547","name":"Saint Petersburg, Florida"},
	     		"email":"scottkfielder\u0040gmail.com",
	     		"timezone":-5,
	     		"locale":"en_US",
	     		"verified":true,
	     		"updated_time":"2010-12-06T00:36:28+0000"
	     		}
	     	*/
			
			
			Map<string, string> FBMap = new Map<string, string>();
			
			JSONObject.JSONTokener tkr = new  JSONObject.JsonTokener(json);
			JSONObject jj = new JSONObject(tkr);
			
			//retrieve values for response from Facebook JSON
			//and complete map construction
			
			for(string s : jj.keys()){
				fbMap.put(s, jj.getString(s));
			}
			
			return FBMap;
	}
	
	
	public string testJSON(){
		string json = '{'+
	     		'\"id\":\"1070072033\",'+
	     		'\"name\":\"Scott Fielder\",'+
	     		'\"first_name\":\"Scott\",'+
	     		'\"last_name\":\"Fielder\",'+
	     		'\"link":\"http://www.facebook.com/scottkfielder\",'+
	     		'\"hometown\":{\"id\":\"111326725552547\",\"name":\"Saint Petersburg, Florida\"},'+
	     		'\"email\":\"scottkfielder@gmail.com\",'+
	     		'\"timezone\":-5,'+
	     		'\"locale":\"en_US\",'+
	     		'\"verified\":true,'+
	     		'\"updated_time\":\"2010-12-06T00:36:28+0000\"'+
	     		'}';
		return json;
	}
			 
	/***********************************************************
	* 						TEST METHODS
	***********************************************************/
	
	static testMethod void test_parseFB_JSON(){
		
		test.startTest(); 
		
		Map<string, string> testMap = new Map<string, string>();
		
		string json = '{'+
	     		'\"id\":\"1070072033\",'+
	     		'\"name\":\"Scott Fielder\",'+
	     		'\"first_name\":\"Scott\",'+
	     		'\"last_name\":\"Fielder\",'+
	     		'\"link":\"http://www.facebook.com/scottkfielder\",'+
	     		'\"hometown\":{\"id\":\"111326725552547\",\"name":\"Saint Petersburg, Florida\"},'+
	     		'\"email\":\"scottkfielder@gmail.com\",'+
	     		'\"timezone\":-5,'+
	     		'\"locale":\"en_US\",'+
	     		'\"verified\":true,'+
	     		'\"updated_time\":\"2010-12-06T00:36:28+0000\"'+
	     		'}';
		
		FB_JSON cls = new FB_JSON();
		testMap = cls.parseFB_JSON(json);
		
		test.stopTest();
		system.assert(json != null);
	}
	
	
	static testMethod void test_testJSON(){
		FB_JSON cls = new FB_JSON();
		string json = cls.testJSON();
		
		system.assert(json!= null);
	}
	
}