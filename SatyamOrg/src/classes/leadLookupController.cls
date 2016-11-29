public class leadLookupController {
 private String emailString;
 
public void setSearchString(String val) {
 emailString = val;
}
 
public String getSearchString() {
    return emailString ;
 }
 
public Lead getLead() {
   Lead lead = getLeadInfo.getLeadAddressByEmail(emailString);
    return lead;
}
 
public PageReference step2() {
    return Page.leadLookup2;
}
}