({
	getSuggestions: function(component) {
		console.log('in');	        
        var queryStr = component.get("v.searchStr");
        var fieldName = component.get("v.fieldName");
        var str = component.get("v.checkStr");
        console.log('str>>',str, 'query>>>',queryStr);
        if(str !== queryStr){
            var action = component.get("c.getSearchResults");
            action.setParams({
                "likeQuery": queryStr,
                "objectName": component.get("v.objectName"),
                "fieldName": fieldName,
                "limitResults": component.get("v.limitSize")
            });
            
            action.setCallback(this, function(a) {
                var state =  a.getState();
                if(state === "SUCCESS"){
                    var suggestions = a.getReturnValue();
                    component.set("v.resultList",suggestions);
                    
                    var spinner = component.find("spinner");
                    $A.util.addClass(spinner, "slds-hide");
                    
                    console.log('results',suggestions.length);
                    if(suggestions.length == 0){
                        component.set("v.message", 'No Results found');
                    }else{
                        component.set("v.message", 'Search Results...');
                    }
                }else{
                    console.log('error',a.getError()[0].message);
                }
            });
            
            $A.enqueueAction(action);
            
            component.set("v.checkStr",queryStr);
        }
    },
    
    showMenu : function(component){
        var menu = component.find("searchMenu");
        $A.util.addClass(menu, "showResults");
    },
    
    hideMenu : function(component){
        var menu = component.find("searchMenu");
        $A.util.removeClass(menu, "showResults");
    },
    
    
})