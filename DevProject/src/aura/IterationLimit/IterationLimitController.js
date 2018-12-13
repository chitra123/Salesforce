({
    doInit : function(component, event, helper) {
        
        //helper.getAllValues(component);
        var cmpTarget = component.find('btn');
        $A.util.addClass(cmpTarget, 'disp');
        
    },
    
    onRender  :  function(component, event, helper) {
        var cmpTarget = component.find('btn');
        $A.util.addClass(cmpTarget, 'disp');
    },
    
    handleActive :  function(component, event, helper) {
        
    },
    
    getValues : function(component, event, helper) {

       helper.getAllValues(component);
    }
})