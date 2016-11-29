public class CustomEvent {

    public CustomEvent(ApexPages.StandardController controller) {

    }

   
//Event event;
Opportunity opportunity; 


public PageReference step1(){
 return Page.CusTrial1;
}

public PageReference step2(){
 return Page.eventStep2;
}

public PageReference step3(){
 return Page.eventStep3;
}

public PageReference cancel() {
PageReference opportunityPage = new ApexPages.StandardController(opportunity).view();
opportunityPage.setRedirect(true);
return opportunityPage;
}


}