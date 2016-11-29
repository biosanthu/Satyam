public class TestAddMA {
    
    private static testmethod void Unittest(){
        List<Lead> lds = New List<Lead>{new Lead(Lastname='TestLName',Company='testCompany')};
        List<MarketingObject__c> Mos = new List<MarketingObject__c>{new MarketingObject__c(Name='TestMo',Last_Activity_Date__c = lds[0].LastActivityDate)};
        Test.StartTest();
        insert lds;
        insert Mos;
        Test.StopTest();
            Map<Id,Lead> leadsmap = new Map<Id,Lead>(lds); 
            List<Lead> l = [Select Id,Lastname from Lead where Id IN:leadsmap.keySet()]; 
            System.assertEquals('TestLName',l[0].Lastname);
        
    }

}