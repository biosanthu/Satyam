public class TransientExController {
 datetime dt1;
 transient datetime dt2;
    public string getT1(){
        if(dt1== null) 
           dt1 = system.now();
        return ' ' + dt1;
    }
    public string getT2(){
        if(dt2== null) 
           dt2 = system.now();
        return ' ' + dt2;
    
    }    
}