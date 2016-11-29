public class TaskControl {
public Task getTask() {
return [select subject from Task
where whoid = :ApexPages.currentPage().getParameters().get('id')];
}
}