public class CustomerWizard { 

Customer_Service__c Customer;  

public Customer_Service__c getCustomer(){   
  if(Customer==null) Customer = new Customer_Service__c();    
  return Customer; }    
  
public PageReference step1() {    
  return Page.Customer2;  }   

public PageReference step2() {     
  return Page.Customer3;  } 
     
public PageReference step3() {    
 insert Customer; 
  PageReference CustomerPage = new ApexPages.StandardController(Customer).view(); 
  return CustomerPage; 
       }    

public PageReference cancel() {
  PageReference CustomerPage = new PageReference('https://ap1.salesforce.com/a0L/o');
  return CustomerPage; 
}    

public string comment {
    get{
        comment = '<html> '+
                   ' <head>'+ 
   '<script type="text/javascript" src="/js/functions.js"></script>'+
  ' <script src="/soap/ajax/8.0/connection.js"></script>' +
  '<script> '+
  ' function setupPage() {'+
    
   '   return "Summary:" + "%0D%0A" + "%0D%0A" + "%0D%0A" + "Next Steps:" + "%0D%0A" + "%0D%0A" + "%0D%0A" + "Next Steps Date:";'+ 
 
  '   } ' + 
'} ' +
'</script> '+
'</head> ' +
' <body onload=setupPage()> '+
'<div id=userNameArea> '+
'</div> '+
'</body> '+
'</html>';
       return comment; 
       
    }
    set; 
    } 
  
 public PageReference save() {   
// insert Customer;    
// PageReference opptyPage = new ApexPages.StandardController(opportunity).view();    
// opptyPage.setRedirect(true);  
  return null; 
 }   
}