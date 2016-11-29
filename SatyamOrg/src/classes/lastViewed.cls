public class lastViewed {

    public Datetime cDT;
    public String LongDate;
    public String firstname;
    public String lastname;
    public String userid;
    
    private final Account acct;
    
    public lastViewed(ApexPages.StandardController stdController) {
        this.acct = (Account)stdController.getRecord();
    }

    public String getLongDate() {
        cDT = System.now();
        //Format the datetime value to your locale
        LongDate = cDT.format('dd/MM/yyyy HH:mm');
    return LongDate;
    }
    
    public void updateField() {
        
        //Get the user info from the current user
        firstname = System.Userinfo.getFirstName();
        lastname = System.Userinfo.getLastName();
        userid = System.Userinfo.getUserId();
        
        //Get the account record to be updated
        Account a = [select Last_Viewed_By__c from account where id = :acct.id limit 1];
        //Assign values to Last Viewed By field & update the record
        a.Last_Viewed_By__c = (firstname + ' ' + lastname + ', ' + getLongDate());
        update a;
    }
}