public class CustomReportControl{
 
public Double total;
public Double TCVtotal =0;

public ApexPages.StandardSetController setCon
 {
  get 
  {
  if(setCon == null) 
  {
  setCon = new ApexPages.StandardSetController(Database.getQueryLocator([select Name,Probability,Contract_Value__c,TCV_Probs__c,amount  from Opportunity]));
  }
 return setCon;
}
 set;
}

public List<Opportunity> getOpportunities()
{
return (List<Opportunity>) setCon.getRecords();
}

public List<Opportunity> opp = new List<Opportunity>();

public CustomReportControl()
{
   total=0;
   Integer i;
   opp =  [Select name,probability,contract_value__c,TCV_Probs__c From Opportunity];
   for(i=0; i <= 41; i++) 
   {
        if(opp[i].contract_value__c!=null)
        total = total + opp[i].contract_value__c;
        if(opp[i].TCV_Probs__c!=null)
        TCVtotal = TCVtotal + opp[i].TCV_Probs__c;
   }   
}
   
  
   
   public String getTotal()
     {
//    system.debug('AAAAAAA');
    
     string tot = String.valueOf(total);
     tot = '$ ' + doFormatting(total,',','.');
     return tot;
    }
  public String getTCVtotal()
  {
   string tcvtot = String.valueOf(TCVtotal);
   tcvtot ='$' + doFormatting(TCVtotal,',','.');
   return tcvtot;
  }

     public static String doFormatting(Decimal val, String osep, String nsep) { 
      String s, tmp; 
      Integer i = 6; 
      s = val.setScale(2).toPlainString().replace(osep, nsep); 
      while(s.length() > i)
       {
        tmp = s.substring(0, s.length() - i) + osep + s.substring(s.length() - i);
        s = tmp; 
        i += 4;
        }
        return s;
        }
}