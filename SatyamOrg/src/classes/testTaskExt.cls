@isTest
public class testTaskExt {
    private static testMethod void unittest(){
                
        Task t = new Task();
        t.OwnerId = UserInfo.getUserId();
        t.Subject='Donni';
        t.Status='Not Started';
        t.Priority='Normal';
        
        insert t;       
        
        Task t1 = [SELECT Subject, OwnerID, Status, Type, ActivityDate, WhoId, WhatId, Priority 
                 FROM Task  WHERE Id = :t.Id];
        System.assert(t1!= null);        
    }
}