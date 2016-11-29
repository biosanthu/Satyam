trigger RestrictInvoiceDeletion on Invoice_Statement__c (before delete) {
    for(Invoice_Statement__c invoice:[Select id from Invoice_Statement__c where id IN (Select Invoice_Statement__c from Line_Item__c) AND Id IN :Trigger.old]){
     Trigger.oldMap.get(invoice.id).addError('Cannot delete invoice statement with line items');   
    }
}