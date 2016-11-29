public class LeadCusControl {
   
    List<Lead> LdList = new List<Lead>();
    List<Lead> LdList_Next = new List<Lead>(); 
   // Integer next = 15, count = 15;
    
    boolean shownext, showprev;
    Integer pages=20;
    
    public LeadCusControl(){
       pages =5;
    }
    
    
     public Integer getPages() {
            return pages;
        }
               
        public void setPages(Integer pages) {
            this.pages = pages;
        }
        
     
        
    Integer next = pages, count = pages;


    public List<SelectOption> getPageno() {
            List<SelectOption> options = new List<SelectOption>();
            options.add(new SelectOption('5','5'));
            options.add(new SelectOption('10','10'));
            options.add(new SelectOption('15','15'));
            return options;
        }
    
   

    
    Public void Search()
    {
        try
        {
            LdList = [SELECT name,company,title,city,state,email,id, (SELECT subject FROM tasks order by lastmodifieddate desc limit 1) FROM lead];
            if(LdList.size()>count)
            {
                for(Integer i=0; i<count; i++)
                LdList_Next.add(LdList[i]);
                shownext = true;
            }
            else
            LdList_Next = LdList;
        }catch(Exception e){system.debug('Exception :'+e);}
    }
    Public Integer GetLdList_Size()
    {
        return LdList.size();
    }
     Public List<Lead> GetLeads()
    {
        return LdList_Next;
    }
    Public void Next()
    {
        try
        {
            showprev = true;
            LdList_Next.clear();
            Integer limit1 = 0;
    
            if(next+count < LdList.size())
                limit1 = next+count;
            else
            {
                limit1 = LdList.size();
                shownext = false;
            }
                
            for(Integer i=next; i<limit1; i++)
            LdList_Next.add(LdList[i]);
    
            Next+=count;
        }catch(Exception e){system.debug('Exception :'+e);}
    }
    Public void Prev()
    {
        try
        {
            shownext = true;
            LdList_Next.clear();
            Integer limit1 = 0;        
            if(next-(count+count) > 0)
                limit1 = next-count;
            else
            {
                limit1 = next-count; 
                showprev = false;
            }
    
            for(Integer i=next-(count+count); i<limit1; i++)    
            LdList_Next.add(LdList[i]);
            Next-=count; 
        }catch(Exception e){system.debug('Exception :'+e);}               
    }
    
    Public boolean getshownext(){return shownext;}
    
    Public boolean getshowprev(){return showprev;}  
}