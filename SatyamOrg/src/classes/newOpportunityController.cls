public class newOpportunityController {

Account account;
Contact contact;
Opportunity opportunity;
OpportunityContactRole role;

public Account getAccount() {
if(account == null) account = new Account();
return account;
}
public Contact getContact() {
if(contact == null) contact = new Contact();
return contact;
}
public Opportunity getOpportunity() {
if(opportunity == null) opportunity = new Opportunity();
return opportunity;
}
public OpportunityContactRole getRole() {
if(role == null) role = new OpportunityContactRole();
return role;
}

public PageReference step1() {
return Page.opptyStep1;
}
public PageReference step2() {
return Page.opptyStep2;
}
public PageReference step3() {
return Page.opptyStep3;
}
// This method cancels the wizard, and returns the user to the
// Opportunities tab
public PageReference cancel() {
PageReference opportunityPage = new ApexPages.StandardController(opportunity).view();
opportunityPage.setRedirect(false);
return opportunityPage;
}

public PageReference save() {
account.phone = contact.phone;
insert account;
contact.accountId = account.id;
insert contact;
opportunity.accountId = account.id;
insert opportunity;
role.opportunityId = opportunity.id;
role.contactId = contact.id;
insert role;
PageReference opptyPage = new ApexPages.StandardController(opportunity).view();
opptyPage.setRedirect(true);
return opptyPage;
}
}