trigger Create_CampaignMember_For_New_Leads  on Lead (after insert,after update) {
   /*
    * Loop through all leads and collect the necessary lists
    */
    list<Lead> theLeads = new list<Lead>(); // List containing each Lead being processed
    list<String> cNames = new list<String>(); // List of Campaign Names
    map<String, String> map_lSource_to_cName = new map<String, String>(); // Mapping Lead Sources to Campaign Names. We have this because we are cleaning up                 
                                                                                                                  // Lead Sources in some cases.
  String wrkText = ''; // Temporary, working variable
  String replaceText = 'Other'; // Text to replace. This is included for ISV partners who want to remove the "-dup" string that is included for duplicate AppExchange Lead          
                                                       //Submissions 
  for(Lead l:trigger.new) {
           theLeads.add(l); // add lead to the main lead list
            if (l.leadsource != null) {
                wrkText = l.leadsource;
                wrkText = wrkText.replace(replaceText,'');
                cNames.add(wrkText); // add to list of Campaign Names
                map_lSource_to_cName.put(l.leadsource,wrkText); // add to map of Lead Sources to Campaign Names
            }
        }
 
    /*
    * Create a map containing an association of Campaign Names to Campaign IDs
    */
    list<Campaign> theCampaigns = [SELECT Id, Name FROM Campaign WHERE Name IN :cNames]; // Campaign sObjects we are dealing with
    map<String, ID> map_cName_to_cID = new map<String, ID>(); // Mapping Campaign Names to Campaign IDs
 
        for (Campaign c:theCampaigns) {
            map_cName_to_cID.put(c.Name,c.Id);
        }
 
    /*
    * Loop through the main list of Leads
    */
    list <CampaignMember> theCampaignMembers = new list<CampaignMember>(); // List containing Campaign Member records to be inserted
 
    for (Lead l:theLeads) {
        if(map_cName_to_cID.get(map_lSource_to_cName.get(l.leadsource)) != null) {
            CampaignMember cml = new CampaignMember();
            cml.leadid = l.id;
            cml.campaignid = map_cName_to_cID.get(map_lSource_to_cName.get(l.leadsource));
            theCampaignMembers.add(cml);
        }
 
    }
 
    /*
    * Insert the list of Campaign Members
    */
    if(!theCampaignMembers.isEmpty()){
        insert theCampaignMembers;
    }
 
}