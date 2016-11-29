public class dataListTask {
                        
        List<Task> tasks;

        public List<Task> getTasks() {
                if(tasks == null) tasks = [select subject,status,whoid from task limit 10];
                return tasks;
        }
}