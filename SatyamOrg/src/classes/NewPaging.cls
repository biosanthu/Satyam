public class NewPaging 
{

    List<Account> AccList = new List<Account>();
    List<Account> AccList_Next = new List<Account>(); 
    Integer next = 10, count = 10;
    boolean shownext, showprev;
    
    Public void Search()
    {
        try
        {
            AccList = [select Name, Type, owner.Name, Billingcity, BillingState, BillingPostalCode, CreatedDate, LastModifiedDate from Account limit 1000];
            if(AccList.size()>count)
            {
                for(Integer i=0; i<count; i++)
                AccList_Next.add(AccList[i]);
                shownext = true;
            }
            else
            AccList_Next = AccList;
        }catch(Exception e){system.debug('Exception :'+e);}
    }
    Public Integer GetAccList_Size()
    {
        return AccList.size();
    }
    
    Public List<Account> GetAccounts()
    {
        return AccList_Next;
    }
    
    Public void Next()
    {
        try
        {
            showprev = true;
            AccList_Next.clear();
            Integer limit1 = 0;
    
            if(next+count < AccList.size())
                limit1 = next+count;
            else
            {
                limit1 = AccList.size();
                shownext = false;
            }
                
            for(Integer i=next; i<limit1; i++)
            AccList_Next.add(AccList[i]);
    
            Next+=count;
        }catch(Exception e){system.debug('Exception :'+e);}
    }
    
    Public void Prev()
    {
        try
        {
            shownext = true;
            AccList_Next.clear();
            Integer limit1 = 0;        
            if(next-(count+count) > 0)
                limit1 = next-count;
            else
            {
                limit1 = next-count; 
                showprev = false;
            }
    
            for(Integer i=next-(count+count); i<limit1; i++)    
            AccList_Next.add(AccList[i]);
            Next-=count; 
        }catch(Exception e){system.debug('Exception :'+e);}               
    }
    
    Public boolean getshownext(){return shownext;}
    
    Public boolean getshowprev(){return showprev;}    
}