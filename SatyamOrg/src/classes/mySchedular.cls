global class mySchedular implements Schedulable{
    global void execute(SchedulableContext ctx){
        CronTrigger ct =[SELECT Id,CronExpression,TimesTriggered,NextFireTime from CronTrigger WHERE Id =: ctx.getTriggerId()];
        system.debug(ct.CronExpression); 
        system.debug(ct.TimesTriggered);
        
        Merchandise__c m = new Merchandise__c(
                     Name='Scheduled job Item',
                     Description__c ='Created by Schedular job',          
                     Price__c = 1,
                     Total_Inventory__c= 1000); 
        Insert m;
    }
}