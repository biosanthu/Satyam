public class dataTableCon {

    public String getMichaelHolley() {
        return null;
    }


    public PageReference save() {
        return null;
    }

                        
        List<Account> accounts;

        public List<Account> getAccounts() {
                if(accounts == null) accounts = [select name, owner.name from account limit 10];
                return accounts;
        }
}