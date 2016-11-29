@istest
private class TestmySchedular{
     public static string CRON_EXP = '0 0 0 15 3 ? 2022';
    static testMethod void test(){
         Test.startTest();
          String jobid = System.schedule('ScheduleApexClassTest',CRON_EXP, new mySchedular());
               CronTrigger ct=[SELECT Id,CronExpression,TimesTriggered,NextFireTime from CronTrigger Where Id =:jobid];
                System.assertEquals(CRON_EXP,ct.CronExpression);
                System.assertEquals(0,ct.TimesTriggered);
                System.assertEquals('2022-03-15 00:00:00',String.ValueOf(ct.NextFireTime));
        
           Merchandise__c[] m =[Select Id from Merchandise__c WHERE Name='Scheduled job Item'];
               System.assertEquals(m.size(),0); 
          Test.stopTest();
            m =[Select Id from Merchandise__c WHERE Name='Scheduled job Item'];
               System.assertEquals(m.size(),1); 
    }
}