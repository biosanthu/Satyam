public class accountsWithOpptysCon {
        
    public List<AccountTotal> getaccounttotals() {
        List<AccountTotal> accounttotals = new List<AccountTotal>();
        for(Opportunity a:[select name,probability,contract_value__c,TCV_Probs__c from opportunity where contract_value__c != null]) {

            accounttotals.add(new AccountTotal(a));
        }
        return sortAccountTotals(accounttotals);
    }
    
    public class accountTotal {
      //  public Account account { get; private set; }
        public Opportunity account { get; private set; }
        public Opportunity total { get; private set; }
        
        public accountTotal(Opportunity a) {
            account = a;
            total = new Opportunity(contract_value__c = 0);
            for(Opportunity o:[select id from opportunity]) {
                if(o.contract_value__c != null) total.contract_value__c += o.contract_value__c;
            }
        }
    }  
    
    private List<AccountTotal> sortAccountTotals(List<AccountTotal> totals) {
        List<AccountTotal> returnList = new List<AccountTotal>();
    
        Map<Decimal, List<AccountTotal>> totalMap = new Map<Decimal, List<AccountTotal>>();
        
        for(AccountTotal t:totals) {
            if(totalMap.get(t.total.contract_value__c) == null) {
                totalMap.put(t.total.contract_value__c, new List<AccountTotal>());            
            }
            totalMap.get(t.total.contract_value__c).add(t);
        }

        List<Decimal> keys = new List<Decimal>(totalMap.keySet());
        keys.sort();

        /* Sort puts things in ascending order so for descending iterate over
           the keys backwards. */
        for(Integer i = (keys.size()-1);i >= 0; i--) {
            returnList.addAll(totalMap.get(keys.get(i)));
        }

        return returnList;
    }
}