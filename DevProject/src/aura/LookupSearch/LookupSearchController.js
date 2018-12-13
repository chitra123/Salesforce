({
    
    doInit: function(component, event, helper) {       
       var icon = component.find('icon');
        $A.util.addClass(icon, "myClass");
    },
    
    autocomplete : function(component,event,helper){
       helper.getSuggestions(component);
    },
    

})