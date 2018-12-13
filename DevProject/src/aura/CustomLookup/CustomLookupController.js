({
	scriptsLoaded : function(component,event,helper){
    	var j$ = jQuery.noConflict();
        j$(".inputSearch > button").click(function(){
           console.log('clicked'); 
        });
    },
    
    getResults : function(component,event,helper){
        
        var queryStr = component.get("v.searchStr");
        if(queryStr.length >= 3 ){
            var spinner = component.find("spinner");
            $A.util.removeClass(spinner, "slds-hide");
            
            component.set("v.message", 'Search Results...');
            
            //show search results
            helper.showMenu(component);
            
            var timer = setTimeout(function(){
                helper.getSuggestions(component); 
                clearTimeout(timer);
            }, 1000);
        }else{
            if(queryStr.length == 0){
                helper.hideMenu(component);
            }else{
                var spinner = component.find("spinner");
                $A.util.addClass(spinner, "slds-hide");
                helper.showMenu(component);
                component.set("v.message", 'Enter atleast 3 chars');
                var list = [];
                component.set("v.resultList",list);
            }
        }
    },
    
    getSelected  : function(component,event,helper){
        
        //get selected value
        var selectedItem = event.currentTarget;
        var item = selectedItem.dataset.selected;
        component.set("v.searchStr",item);
        
        //set Value of lookup field using event
        var cmpEvent = component.getEvent("setValue");
        cmpEvent.setParams({
            "fieldValue" : selectedItem.dataset.id,
            "paramName":component.get("v.objectName")
        });
        cmpEvent.fire();
        
        //hide selection menu on click
        helper.hideMenu(component);
    },
  	
    closeSearchResults : function(component,event,helper){
	
        console.log('out');
        //hide search results
      	helper.hideMenu(component);
    },
    
 
})