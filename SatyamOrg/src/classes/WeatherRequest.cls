public class WeatherRequest{
 String result = '';
 DateTime st; 
 transient DateTime et=null;
 public String getResult() {return this.result;}
 public void setResult(String result){this.result = result;}
 
  public String getST() {      
         //return this.st.format('h:mm:ss z');
         return this.st.format('h:mm:ss');
   }

    public String getET() {
     
        //return '' + this.et.format('h:mm:ss z');
        return '' + this.et.format('h:mm:ss');
    }
 
 
 public WeatherRequest(ApexPages.StandardController controller) {
          
        GetWeather();
        result='';       
    }
 
 public PageReference GetWeather(){
        string endpoint='';
        string City='Dallas';
       // string endpoint='http://www.deeptraining.com/webservices/weather.asmx';
      
        string requestBody = '<?xml version="1.0" encoding="utf-8"?>';
        requestBody +=       '<soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">';
        requestBody +=         '<soap12:Body>';
        requestBody +=           '<GetWeather xmlns="http://litwinconsulting.com/webservices/">';
        requestBody +=             '<City>'+City+'</City>';
        requestBody +=           '</GetWeather>';
        requestBody +=         '</soap12:Body>';
        requestBody +=       '</soap12:Envelope>';
        
        Http h = new Http();
        HttpRequest req = new HttpRequest();

        req.setHeader('Content-Type', 'text/xml; charset=utf-8');                                                 
        req.setEndpoint(endpoint);
        req.setMethod('POST');
        req.setBody(requestBody);
        st = system.now();
        try{
        HttpResponse res = h.send(req);
        Dom.Document doc = res.getBodyDocument();
        et = system.now();
        setResult(doc.toXmlString());
        return null;
        }
        catch(System.CalloutException e)
        {
        	ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.ERROR,e.getMessage()));
        	System.debug('Error is===='+ e.getMessage());  
        	return null;     	
        }
       }
       
       private String parse(String toParse) {
        DOM.Document doc = new DOM.Document();      
      try {
         doc.load(toParse);    
         DOM.XMLNode root = doc.getRootElement();
         return walkThrough(root);
    
          } catch (System.XMLException e) {  // invalid XML
             return e.getMessage();
          }
         }

 private String walkThrough(DOM.XMLNode node) {
      String result = '\n';
  if (node.getNodeType() == DOM.XMLNodeType.COMMENT) {
    return 'Comment (' +  node.getText() + ')';
  }
  if (node.getNodeType() == DOM.XMLNodeType.TEXT) {
    return 'Text (' + node.getText() + ')';
  }
  if (node.getNodeType() == DOM.XMLNodeType.ELEMENT) {
    result += 'Element: ' + node.getName();
    if (node.getText().trim() != '') {
      result += ', text=' + node.getText().trim();
    }
    if (node.getAttributeCount() > 0) { 
      for (Integer i = 0; i< node.getAttributeCount(); i++ ) {
        result += ', attribute #' + i + ':' + node.getAttributeKeyAt(i) + '=' + node.getAttributeValue(node.getAttributeKeyAt(i), node.getAttributeKeyNsAt(i));
      }  
    }
    for (Dom.XMLNode child: node.getChildElements()) {
      result += walkThrough(child);
    }
    return result;
  }
  return '';  //should never reach here 
}

}