public class CreateRssFeed{
 public List<Case> caseList {get;set;}
public CreateRssFeed(){
caseList = [SELECT Id, CaseNumber, Subject,Priority,Status from Case];
}
}