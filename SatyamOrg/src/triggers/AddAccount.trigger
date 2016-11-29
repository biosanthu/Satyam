trigger AddAccount on Account (after insert, after update) {
	
	List<Account> accts = [select id, name, (select id, salutation, description,firstname, lastname, email from Contacts)from Account where Id IN :Trigger.newMap.KeySet()];
    List<Contact> cntforupdate = new List<Contact>();
    
    for(Account a:accts)
    {
    	for(Contact c:a.Contacts){
    	c.Description = 'i am Contact person for '+ a.Name;
    	cntforupdate.add(c);  
    	}
    	
    } 
    update cntforupdate;
}