trigger AutoCreateEvent on Lead (after insert,after update){
   List<Event>  myevent = new List<Event>();
    for (Lead ld: Trigger.New){

        if(ld.LeadSource == 'Working - Contacted'){
      myevent.add(new Event(Whoid=ld.id,Subject='Send Reference Mail',Location='madras',ActivityDateTime=Datetime.valueof('2009-09-16 12:00:00'),DurationInMinutes=60));     
                     
  }  
} 
insert myevent;
}