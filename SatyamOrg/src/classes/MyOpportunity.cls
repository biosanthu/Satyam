public class MyOpportunity {
   List<Account> LdList = new List<Account>();
    List<Account> LdList_Next = new List<Account>(); 
    Integer next = 10, count = 10;
    boolean shownext, showprev;
    
    Public void Search()
    {
        try
        {
            LdList = [Select Name,(Select Name,Phone,Email From Contacts), 
(Select Name,StageName,Type From Opportunities limit 1) from Account WHERE Id IN (SELECT AccountId FROM Opportunity)];
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
     Public List<Account> getaccounts()
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