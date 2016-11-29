public class RegistrationControl
{
    public RegistrationControl(ApexPages.StandardController controller) {

    }


    
Registration__c registration;
CampaignMember campaignmember;
Event event;

public Registration__c getRegistration() 
{
if(registration == null) registration = new Registration__c();
return registration;
}

public Campaignmember getcampaignmember() 
{
if(campaignmember== null) campaignmember= new Campaignmember();
return campaignmember;
}

public Event getevent()
{
 if(event == null) event= new Event();
 return event;
}

public PageReference Save() 
{
    insert registration;
 //   PageReference RegPage = new ApexPages.StandardController(Registration__c).view();
  //  RegPage.setRedirect(true);
    return null;    
}

public PageReference cancel() 
{
        //PageReference opportunityPage = new ApexPages.StandardController(opportunity).view();
        //opportunityPage.setRedirect(true);
        //return opportunityPage;    
        return null;
}



}