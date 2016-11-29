public class dataTableCon1 {
public List<Lead> getlead() {

//return [select subject from task where  status<>'Complete'];
return [select name,company,title,city,state,email from lead];
}
public List<Task> getMichaelHolley() {

//return [select subject from task where  status<>'Complete'];
return [select subject from task where whoid ='00Q90000000t3EFEAY'];
}

}