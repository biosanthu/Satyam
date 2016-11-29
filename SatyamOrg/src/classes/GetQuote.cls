public class GetQuote {

public String searchBy {get; set;}

public List<SelectOption> searchBySymbol {get;private set;}
    public GetQuote() {
    	
      searchBy = ApexPages.currentPage().getParameters().get('searchBy');	
      getStock();     
      searchBySymbol = new List<SelectOption>();
      searchBySymbol.add(new SelectOption('Symbol1','MSFT'));
      searchBySymbol.add(new SelectOption('Symbol2','AAPL'));
      system.debug('chk'+ searchBy);
    }

    String result = '';
    public String getResult() {return this.result;}
    public void setResult(String result){this.result = result;}
       
    //List<stockdetail> std = new list<stockdetail>();
    public List<stockdetail> std {get;set;}
     
public void getStock(){
       
       
       string endpoint='http://www.webservicex.net/stockquote.asmx/GetQuote?Symbol=MSFT';
      
        Http h = new Http();
        HttpRequest req = new HttpRequest();
                                                
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        string stockdetail='';      
        
        try{
        HttpResponse res = h.send(req);
        Dom.Document doc = res.getBodyDocument();
        Dom.Xmlnode root = doc.getRootElement();
        if(root.getText().trim()!=''){
          //setResult(root.getText().trim());
        XMLDom d = new XMLDom(root.getText().trim());
        List<XMLdom.Element> e1=d.getElementsByTagName('StockQuotes');
         std = new list<stockdetail>();
       for(XMLdom.Element e:e1){
        	     std.add(new stockdetail(
        	        e.getElementByTagName('Symbol').nodeValue,
        	        e.getElementByTagName('Last').nodeValue,
        	        e.getElementByTagName('Date').nodeValue,
        	        e.getElementByTagName('Time').nodeValue,
        	        e.getElementByTagName('Change').nodeValue,
        	        e.getElementByTagName('Volume').nodeValue,
        	        e.getElementByTagName('MktCap').nodeValue,
        	        e.getElementByTagName('PreviousClose').nodeValue,
        	        e.getElementByTagName('PercentageChange').nodeValue,
        	        e.getElementByTagName('AnnRange').nodeValue,
        	        e.getElementByTagName('Earns').nodeValue,
        	        e.getElementByTagName('P-E').nodeValue,
        	        e.getElementByTagName('Name').nodeValue)); 
           } 
        }
         
        //XmlStreamReader reader = res.getXmlStreamReader();
        // system.debug(doc.toXmlString());
        //setResult(doc.toXmlString());
                  
        // setResult(res.getBody().trim());
        // XMLDom d = new XMLDom(doc.toXmlString());
       
       
                 
        }
        catch(System.CalloutException e)
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.ERROR,e.getMessage()));
            system.debug('Error is===='+ e.getMessage());               
           
        }
}   
 public class stockdetail{
 	public string Symbol {get;set;}
 	public string LastPrice {get;set;}
 	public string sDate {get;set;}
    public string sTime {get;set;}
    public string Change {get;set;}
    public string Volume {get;set;}
    public string MktCap {get;set;}
    public string PreviousClose {get;set;}
    public string PercentageChange {get;set;}
    public string AnnualRange {get;set;}
    public string Earns {get;set;}
    public string PE {get;set;}
    public string StockName {get;set;}  
    public stockdetail(string ssyb, string lprice,string sdate,string stime,string schange,string svolume,string smktcap,string spclose,string PChange,string AnnRange,string sEarns,string sPe,string sname){
     this.LastPrice = lprice;
     this.sDate = sdate;
     this.sTime = stime;
     this.Change = schange;
     this.Volume = svolume;
     this.MktCap = smktcap;
     this.PreviousClose = spclose;
     this.PercentageChange =PChange; 
     this.AnnualRange = AnnRange;
     this.Earns = sEarns;
     this.PE = sPe;
     this.StockName = sname;
     this.Symbol = ssyb;
    }     
 }

}