trigger RestrictMerchandiseDeletion on Merchandise__c (before Delete) {
    For(Merchandise__c mer:[Select Id from Merchandise__c where Id IN (Select Merchandise__c from Line_Item__c) AND Id IN :Trigger.old]){
           Trigger.oldMap.get(mer.id).addError('Cannot delete Merchandise by sans rule');       
    } 

}