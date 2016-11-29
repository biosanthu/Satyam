public class taskExt {

    public Task t {get;set;}

    public taskExt (ApexPages.StandardController c) {
        t = (Task) c.getRecord();
        if(t.Id == null){
            t.whoId = null;
        }
        else{
            t = [SELECT Subject, OwnerID, Status, Type, ActivityDate, WhoId, WhatId, Priority 
                 FROM Task
                 WHERE Id = :t.Id];
        }
    }
}