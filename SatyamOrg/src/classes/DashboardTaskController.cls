public class DashboardTaskController 
{ 
public String objectId {get; set;}
    //public Task currentObject {get; set;}    
    //public String updatedItemStatus{get; set;}    
    public Integer numLeft {get; set;}
    public Integer total {get; set;}    
    private Integer startNdx = 0;
    private static Integer PAGESIZE = 8;
    private List<Task> fullTaskList = new List<Task>();
    private List<Task> displayedTaskList = new List<Task>();
    
    
    public DashboardTaskController() {

    }
    
    public PageReference refreshPage() {
        return null;
    }
   
public List<Task> getTasks() {
    String ownerId = UserInfo.getUserId();
      if (fullTaskList.isEmpty()) {
            fullTaskList = [select id, WhatId, WhoId, ActivityDate, subject, status, priority, Description,  ReminderDateTime, IsReminderSet,isClosed from Task where isClosed = false and OwnerId = :ownerId];
            numLeft = fullTaskList.size();
            total = numLeft;
            this.objectId = ((Task) fullTaskList[0]).id;
            //this.currentObject = (Task) fullTaskList[0];
        }
        
        displayedTaskList.clear();
        Integer endNdx = startNdx + PAGESIZE;
        if (endNdx > total)
            endNdx = total;
            
        for (Integer i=startNdx; i<endNdx; i++)
            displayedTaskList.add(fullTaskList.get(i));
            
        return displayedTaskList;
    }
 
    private void updateTaskStatus() {
        System.debug('before : ' + fullTaskList);
        Integer i = 0;
        for (i=0; i<fullTaskList.size(); i++) {
            Task t = fullTaskList.get(i);
            if (this.objectId.equals(t.id)) {
                System.debug('updating status of ' + t);                                
                Task tmp = [select id, WhatId, WhoId, ActivityDate, subject, status, priority, Description, ReminderDateTime, IsReminderSet, isClosed from Task where id = :t.id];
                fullTaskList.set(i, tmp);
                System.debug('updated to ' + tmp);
                //this.updatedItemStatus = tmp.status;
                break;
            }
        }
        
        System.debug('after : ' + fullTaskList);               
    }
    
    private void nextTask() {
        for (Task t : fullTaskList) {
            if (!t.isClosed) {
                System.debug('found non-closed object with id ' + t.id);
                this.objectId = t.id;
                break;
            }
        }
    }
  
    
    public PageReference showDetail() {
        // since I can't get the assignTo to work in the VF page/component
        this.objectId = System.currentPageReference().getParameters().get('objectId');

        /*
        bizarre ... if I call setObjectId, the id returned from the detailPage method is null
        but if I directly set the id in this method, everything works correctly
        setObjectId(System.currentPageReference().getParameters().get('objectId'));
        */
        return null;
    } 

    public void previous() {
        startNdx -= PAGESIZE;
    }
    
    public void next() {
        startNdx += PAGESIZE;
    }    
    
    public void refreshNumbers() {
        // the only time this method should be called is when a submit is done
        // on a record -- we assume the submit closes the record (or at least
        // puts the record in a state where we are not interested in seeing
        // it in our todo list anymore
        updateTaskStatus();
        nextTask();
        this.numLeft = 0;
        for (Task t : fullTaskList) {
            if (!t.isClosed) {
                this.numLeft++;
            }
        }        
        //this.objectId = prefetchedNextObjectId;
    }
    
    public Boolean getHasNext() {
        return total > (startNdx + PAGESIZE);
    }
    
    public Boolean getHasPrevious() {
        return startNdx > 0;
    }    

    public Integer getNum() {
        return total;
    } 
    
    public PageReference save(){       
        for (Task t : fullTaskList) {
           update t;
        }
        return null;    
    }
    }