public class mycontroller {

   public Task getTask() {
        return [select Subject,Status from task
                 where whoid = :ApexPages.currentPage().getParameters().get('id')]; 
    } 


}