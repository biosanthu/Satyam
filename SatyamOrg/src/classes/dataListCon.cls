public class dataListCon {
                        
        List<Lead> leads;

        public List<Lead> getLeads() {
                if(leads == null) leads = [select name from lead limit 10];
                return leads;
        }
 static testmethod void dlUnittest(){
 
 }

}