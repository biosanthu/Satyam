public class rssFeedController{

    public rssFeedController(ApexPages.StandardController controller) {
       getFeed();
    }

  String FeedTitle='';
  
  List<FeedDataWrapper> FdList_Next = new List<FeedDataWrapper>(); 
       Integer next = 5, prev = 5;
       boolean shownext, showprev;
        public String getFeedTitle() {return this.FeedTitle;}
        
        public List<FeedDataWrapper> Feed {get;set;} 
        
        List<FeedDataWrapper> Feed1 = new List<FeedDataWrapper>();
    
        public void getFeed(){
         Feed = new List<FeedDataWrapper>();
           for(FeedsEndpoint__c endpt:FeedsEndpoint__c.getall().values())
          {  
            string endpoint1 = endpt.Endpoint__c;
            system.debug('chk'+ endpoint1);
            Http h = new Http();
            HttpRequest req = new HttpRequest();       
            req.setHeader('Content-Type', 'text/xml; charset=utf-8');                                           
            req.setEndpoint(endpoint1);
            req.setMethod('GET');
        
            string title1;
            HttpResponse res = h.send(req);
            Dom.Document doc = res.getBodyDocument();
            XMLDom d = new XMLDom(doc.toXmlString());
            Feed1 = new List<FeedDataWrapper>(); 
           
           List<XMLdom.Element> e1=d.getElementsByTagName('channel');
            for(XMLdom.Element x:e1){
               title1 = x.getElementByTagName('title').nodeValue;
            } 
            FeedTitle = FeedTitle.replace('Reuters:', '') + ' and ' + title1.replace('Reuters:', '');
            
            List<XMLdom.Element> e2=d.getElementsByTagName('item');  
             List<String> templist= new List<String>();    
            for(XMLdom.Element ee:e2){
                    system.debug('items'+ e2.size());   
                     templist=ee.getElementByTagName('description').nodeValue.split('<',0);  
         /*   if(checkrelevancein(ee.getElementByTagName('title').nodeValue,ee.getElementByTagName('description').nodeValue))
            { */
            Feed1.add(new FeedDataWrapper(
              ee.getElementByTagName('title').nodeValue==null?'':ee.getElementByTagName('title').nodeValue,
              ee.getElementByTagName('link').nodeValue==null?'':ee.getElementByTagName('link').nodeValue,
              ee.getElementByTagName('description')==null?'':templist[0] 
               )); 
           // }
           } 
          Feed.addall(Feed1); 
        } 
            FeedTitle = FeedTitle.replaceFirst('and', '');
            if(Feed.size()>prev)
            {
                for(Integer i=0; i<prev; i++)
                FdList_Next.add(Feed[i]);
                shownext = true;
            }
            else
            {
                FdList_Next = Feed;
            }       
       
    }
    public Integer getFeedsize(){
         return Feed.size();
       }      
       
       public List<FeedDataWrapper> GetFeeds(){
         return FdList_Next;
       }
       public PageReference GetFeedRefresh(){
              GetFeeds();           
        return null;
       }
       
       public void Next()
       {
        try
        {
            showprev = true;
            FdList_Next.clear();
            Integer limit1 = 0;
    
            if(next+prev < Feed.size())
                limit1 = next+prev;
            else
            {
                limit1 = Feed.size();
                shownext = false;
            }
                
            for(Integer i=next; i<limit1; i++)
            FdList_Next.add(Feed[i]);
    
            Next+=prev;
        }
        catch(Exception e){system.debug('Exception :'+e);}
    }
    
    public void Prev()
    {
        try
        {
            shownext = true;
            FdList_Next.clear();
            Integer limit1 = 0;        
            if(next-(prev+prev) > 0)
                limit1 = next-prev;
            else
            {
                limit1 = next-prev; 
                showprev = false;
            }
    
            for(Integer i=next-(prev+prev); i<limit1; i++)    
            FdList_Next.add(Feed[i]);
            Next-=prev; 
        }catch(Exception e){system.debug('Exception :'+e);}               
    }
    public boolean getshownext(){return shownext;}
    
    public boolean getshowprev(){return showprev;}
        
        public boolean checkrelevancein(String title,String descr)
    {
        List<String> SearchString= new List<String>();
        // Removing all nonword characters(everything except numbers and letters)
        Pattern nonWordChar = Pattern.compile('[^\\w]'); 
        descr = nonWordChar.matcher(descr).replaceAll('');
        title = nonWordChar.matcher(title).replaceAll('');
       
       // system.debug('accountn'+ selectedAccount.Name);
       //SearchString=nonWordChar.matcher(selectedAccount.Name).replaceAll('~').split('~',0);
         String accname = nonWordChar.matcher('Lead').replaceAll(''); 
       SearchString.add(accname.toLowerCase());
       
          title = title.toLowerCase();
          descr = descr.toLowerCase();
          system.debug('chksans'+ accname.toLowerCase()+ '=' + title);  
         //looking into title
       for (String temp: SearchString)
        if (title.contains(temp)==true) return true;
        // if not found looking into desc
      for (String temp: SearchString)
        if (descr.contains(temp)==true) return true;

       return false;
    }
        
       public class FeedDataWrapper{
        public string title {get;set;}
        public string link {get;set;}
        public string description {get;set;}

        public FeedDataWrapper(string Title,string Link,string Description){
        this.title = Title;
        this.link = Link;
        this.description = Description;
        }
    } 
}