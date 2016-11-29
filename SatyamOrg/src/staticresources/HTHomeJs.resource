var sm = Ext.state.Manager;
var c;
var checkStateTime = null;
Ext.onReady(function(){
      
        // NOTE: This is an example showing simple state management. During development,
        // it is generally best to disable state management as dynamically-generated ids
        // can change across page loads, leading to unpredictable results.  The developer
        // should ensure that stable state ids are set for stateful components in real apps.
        
        document.getElementById('bodydiv').style.display='block';
        Ext.state.Manager.setProvider(new Ext.state.CookieProvider());

        // create some portlet tools using built in Ext tool ids
        var tools = [{
            id:'gear',
            handler: function(){
                Ext.Msg.alert('Message', 'The Settings tool was clicked.');
            }
        },{
            id:'close',
            handler: function(e, target, panel){
                panel.ownerCt.remove(panel, true);
            }
        }];
    
    
      
    c = new Ext.Container({
           cp: new Ext.state.CookieProvider({ expires: null }),
           stateId : 'Container',
           autoEl: {},
           renderTo: 'HTContent',
           autoHeight:true,
           autoWidth:true,           
           layout: 'border',                      
           items:[{
               xtype:'portal',
               region:'center',
               renderTo: 'HTContent',
               id: 'portalid',
               bodyStyle:'overflow:hidden',
               autoWidth:true,
               items:[{
                   columnWidth:.5,
                   defaults: {
                                stateEvents: ["collapse","expand"]
                                ,getState:function() {                                                                
                                return {collapsed:this.collapsed};
                                } 
                   },
                   style:'padding-left:10px;padding-right:5px;padding-top:0px',
                   items:[{
                       id:'item13',
                       name: 'ht_account',
                       title: ht_account_header,
                       currentState:'Open',
                       autoWidth:true,
                       contentEl : 'CollapsiblePanelGroup3d'
                   },{
                       id:'item14',
                       name: 'ht_contacts',
                       title: ht_contacts_header,
                       currentState:'Open',
                       autoWidth:true,
                       contentEl : 'CollapsiblePanelGroup3e'
                   },{
                       id:'item17',
                       name: 'ht_product_recommendations',
                       title: ht_product_recommendations_header,
                       currentState:'Open',
                       autoWidth:true,
                       contentEl : 'product_recommendations_div'
 				   },{
                   	   id:'item15',
                       name: 'ht_search_account',
                       title: ht_search_account,
                       currentState:'Open',
                       autoWidth:true,
                       contentEl : 'account_search_div'
                   },{
                       id:'item20',
                       name: 'ht_tasks',
                       title: ht_tasks_header,
                       currentState:'Open',
                       autoWidth:true,
                       contentEl : 'tasks_div'
                   },{
                       id:'item33',
                       name: 'ht_CampaignOpportunity',
                       title: ht_CampaignOpportunity,
                       currentState:'Open',
                       autoWidth:true,
                       contentEl : 'Campaign_Opportunity_div'
                   },{
                       id:'item36',
                       name: 'ht_ReuterNews',
                       title: ht_ReuterNews,
                       currentState:'Open',
                       autoWidth:true,
                       contentEl :'ReuterNews_div'
                   },{
                       id:'item37',
                       name: 'ht_ServiceRequests',
                       title: ht_ServiceRequests,
                       currentState:'Open',
                       autoWidth:true,
                       contentEl :'ht_ServiceRequests_div'
                   }]
               },{
                   columnWidth:.5,
                   defaults: {
                                stateEvents: ["collapse","expand"]
                                ,getState:function() {                                
                                return {collapsed:this.collapsed};
                                }
                   },
                   style:'float:none;padding-left:10px;padding-right:5px;padding-top:0px',
                   items:[{
                       id:'item19',
                       name: 'ht_leads',
                       title: ht_leads_header,
                       currentState:'Open',
                       autoWidth:true,
                       contentEl : 'leads_div'
                   },{
                       id:'item12',
                       name: 'ht_opportunities',
                       title: ht_opportunities_header,
                       currentState:'Open',
                       autoWidth:true,
                       contentEl : 'CollapsiblePanelGroup3c'                   
                   },{
                       id:'item21',
                       name: 'ht_important_links',
                       title: ht_important_links_header,
                       currentState:'Open',
                       autoWidth:true,
                       contentEl : 'important_links_div'
                   },{
                       id:'item31',
                       name: 'ht_AccountTeam',
                       title: ht_AccountTeam,
                       currentState:'Open',
                       autoWidth:true,
                       contentEl : 'AccounTeam_div'
                   },{
                       id:'item32',
                       name: 'ht_AccountPlan',
                       title: ht_AccountPlan,
                       currentState:'Open',
                       autoWidth:true,
                       contentEl : 'AccounPlan_div'
                   },{
                       id:'item34',
                       name: 'ht_HotAlert',
                       title: ht_HotAlert,
                       currentState:'Open',
                       autoWidth:true,
                       contentEl : 'hot_alert_div'
                   },{
                       id:'item35',
                       name: 'ht_Price_Increase_Portal_Label',
                       title: ht_Price_Increase_Portal_Label,
                       currentState:'Open',
                       autoWidth:true,
                       contentEl : 'PriceIncreasePortal_div'
                   }]
                   
               }]
           }]
       });

  
 
  
  
       Ext.EventManager.onDocumentReady(function(){
         portal = Ext.ComponentMgr.get('portalid');
         var totalItems = 0;
         for(var j=0;j<portal.items.length;j++){
             totalItems += portal.items.itemAt(j).items.length;
         }
         
         // for state management of the movement of portlets
         // First Remove All the Items
         portal.removeAllItems();
                 
         /********************NEW CODE FOR STATE PERSISTENCE*********/         
         var recordsExist = restoreRecordsArray.length > 0 ? true : false;
         if(recordsExist == false){           
           portal.insertAllItemsDB();
         }else{
           if(totalItems != restoreRecordsArray.length){           
             portal.insertAllItemsDB();
           }else{                        
             portal.restoreStateOnDB();             
           }         
         }
         
         /***** END OF NEW CODE ***************/
         
         // AT LAST DO LAYOUT OF CONTAINER AGAIN
         c.doLayout();
         
         for(var colIndex=0;colIndex<portal.items.length;colIndex++){
                var htColumn = portal.items.itemAt(colIndex);
                for(var rowIndex=0;rowIndex<htColumn.items.length;rowIndex++){
                   var htRow = htColumn.items.itemAt(rowIndex);  
                        if(htRow.currentState == 'Open'){
                          showObj(Ext.getDom(htRow.id));
                          htRow.expand();
                        }else if(htRow.currentState == 'Closed'){
                          showObj(Ext.getDom(htRow.id));
                          htRow.collapse();
                        }else if(htRow.currentState == 'Hidden'){
                          hideObj(Ext.getDom(htRow.id));
                        }                                          
                }
         }

       })

       Ext.EventManager.onWindowResize(function(){                      
     //c.doLayout();
       })

       Ext.ComponentMgr.get('portalid').on("drop", function(dd, e, data, pos) {
                     portal = Ext.ComponentMgr.get('portalid');
                     // To save the values in HTUserPortletState                     
                     window.setTimeout(checkState,500);
                     //checkState();
       });
       if (getCookie("lastSelectedLink") != null && getCookie("lastSelectedLink") !="")
       opener(getCookie("lastSelectedLink"));
       else
       opener('Customer_Information');
  });

var checkState = function(){
             var portal = Ext.ComponentMgr.get('portalid');
             var colNum = portal.items.length;
             
			 var stateval = new String();
			 var commaSeparatedList = '';
			 while (true) {
					var bFound = false;                              
					for (var columnIndex = 0;columnIndex < colNum; columnIndex++) {
                        var a = portal.items.itemAt(columnIndex);
					    for(rowIndex=0;rowIndex<a.items.length;rowIndex++){
					      var Portlet = a.items.itemAt(rowIndex);
					      Name = Portlet.name;
					      State__c = (Portlet.collapsed==false?'Open':'Closed');
					      Row__c = (rowIndex+1);
					      Column__c = (columnIndex+1);				      
					     // if(Ext.getDom(Portlet.id).style.display == 'none'){
					     //   State__c = 'Hidden';  
					     // }
					     
					     if (searchitemtohide(Portlet.id)==true)State__c = 'Hidden';
					      commaSeparatedList = commaSeparatedList + Name + ':' + State__c + ':' + Row__c + ':' + Column__c + ','; 					      
					    }
					}					
					if (!bFound) {
						break;
					}					
				}
				// call to apex function 				
				addToPortletStateUpdateList(commaSeparatedList);

}//END OF FUNCTION CHECKSTATE

function displayDefaultPortlet(){

  portal = Ext.ComponentMgr.get('portalid');
  for(var j=0;j<portal.items.length;j++){
            for(var i=0;i<portal.items.itemAt(j).items.length;i++){
                 showObj(Ext.getDom(portal.items.itemAt(j).items.itemAt(i).id));//.setAttribute('style','display:block');
            }
  }
}  

function displayPortlet(id){  
  portal = Ext.ComponentMgr.get('portalid');
  for(var j=0;j<portal.items.length;j++){
            for(var i=0;i<portal.items.itemAt(j).items.length;i++){
               if(portal.items.itemAt(j).items.itemAt(i).id == id){
                 showObj(Ext.getDom(portal.items.itemAt(j).items.itemAt(i).id));
               }
               else{
                 hideObj(Ext.getDom(portal.items.itemAt(j).items.itemAt(i).id));//.setAttribute('style','display:none');
               }
            }
  }
  
  if(id=='item5'){
    //reports
    showObj(Ext.getDom('item7'));
  }
}

Ext.override(Ext.Panel, {    
    onCollapse : function(doAnim, animArg){     
                                
        if(doAnim){
            this[this.collapseEl].slideOut(this.slideAnchor,
                    Ext.apply(this.createEffect(animArg||true, this.afterCollapse, this),
                        this.collapseDefaults));
            window.setTimeout(checkState,500);         
        }else{
            this[this.collapseEl].hide();
            this.afterCollapse();
            
        }
        if(this.el.id.indexOf('item')!=-1){
         this.el.dom.appendChild(this.bwrap.dom.lastChild);         
        }
        
    },
    onExpand : function(doAnim, animArg){       
       
        if(doAnim){
            this[this.collapseEl].slideIn(this.slideAnchor,
                    Ext.apply(this.createEffect(animArg||true, this.afterExpand, this),
                        this.expandDefaults));
                        
            window.setTimeout(checkState,500);           
        }else{
            this[this.collapseEl].show();
            this.afterExpand();
            
        }
        
        if(this.el.id.indexOf('item') != -1){
         this.bwrap.dom.appendChild(this.el.dom.lastChild);              
        }
        
    },
    setSize : function(w, h){       
        // support for standard size objects
        w = '100%';
        if(typeof w == 'object'){
            h = w.height;
            w = w.width;             
        }
        // not rendered
        if(!this.boxReady){             
            this.width = w;
            this.height = h;
            return this;
        }
          
        // prevent recalcs when not needed
        if(this.cacheSizes !== false && this.lastSize && this.lastSize.width == w && this.lastSize.height == h){
            return this;
        }
        this.lastSize = {width: w, height: h};
        var adj = this.adjustSize(w, h);
        var aw = adj.width, ah = adj.height;
        if(aw !== undefined || ah !== undefined){ // this code is nasty but performs better with floaters
            var rz = this.getResizeEl();
            if(!this.deferHeight && aw !== undefined && ah !== undefined){
                rz.setSize(aw, ah);
            }else if(!this.deferHeight && ah !== undefined){
                rz.setHeight(ah);
            }else if(aw !== undefined){
                rz.setWidth(aw);
            }
            this.onResize(aw, ah, w, h);
            this.fireEvent('resize', this, aw, ah, w, h);
        }
        return this;
    }
    
});

function getSelectString(){
  var returnString = new String();
  if(document.getElementById('selectString')){
    returnString = document.getElementById('selectString').innerHTML;
    document.getElementById('selectString').innerHTML = '';
  }  
  return returnString;
}

function findVisualForceElement(cssSelector, visualForceID) {
    var elementArray = Ext.query(cssSelector);
    var IDSuffix = ':' + visualForceID;
    var i;
    for (i = 0; i < elementArray.length; i++) {
        if (elementArray[i].id.match(IDSuffix + '$') == IDSuffix) {
            return elementArray[i];
        }
    }
    return null;
}
    
Ext.layout.ColumnLayout = Ext.extend(Ext.layout.ContainerLayout, {
    // private
    monitorResize:true,
    
    extraCls: 'x-column',

    scrollOffset : 0,

    // private
    isValidParent : function(c, target){
        return (c.getPositionEl ? c.getPositionEl() : c.getEl()).dom.parentNode == this.innerCt.dom;
    },

    // private
    onLayout : function(ct, target){
        var cs = ct.items.items, len = cs.length, c, i;

        if(!this.innerCt){
            target.addClass('x-column-layout-ct');

            // the innerCt prevents wrapping and shuffling while
            // the container is resizing
            this.innerCt = target.createChild({cls:'x-column-inner'});
            this.innerCt.createChild({cls:'x-clear'});
        }
        this.renderAll(ct, this.innerCt);

        var size = Ext.isIE && target.dom != Ext.getBody().dom ? target.getStyleSize() : target.getViewSize();

        if(size.width < 1 && size.height < 1){ // display none?
            return;
        }

        var w = size.width - target.getPadding('lr') - this.scrollOffset,
            h = size.height - target.getPadding('tb'),
            pw = w;

        //alert(w); 
        this.innerCt.setWidth(w);
        //this.innerCt.setWidth('100%');// Commented out this line and set width to w - 22 Jun 2011
        // some columns can be percentages while others are fixed
        // so we need to make 2 passes

        for(i = 0; i < len; i++){
            c = cs[i];
            if(!c.columnWidth){
                pw -= (c.getSize().width + c.getEl().getMargins('lr'));
            }
        }

        pw = pw < 0 ? 0 : pw;

        for(i = 0; i < len; i++){
            
            c = cs[i];
            if(c.columnWidth){
                //alert(c.columnWidth*100);
                //alert(c.getEl().getMargins('lr'));
                //c.setSize('31%');               
                c.setSize(((c.columnWidth*100) - 2) + '%');
                if(i == (len - 1)){
                  c.setSize('auto');
                  c.addClass('lastcolumn');                   
                }
                //c.setSize(Math.floor(c.columnWidth*pw) - c.getEl().getMargins('lr'));
            }
        }
    }
    
/**
     * @property activeItem
     * @hide
     */
});

Ext.Container.LAYOUTS['column'] = Ext.layout.ColumnLayout;




