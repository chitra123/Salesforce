({
    
    doInit : function(component, event, helper) {
        window.testValue="From the Window";
    },
    showFromWindow : function(component, event, helper) {
        alert('From window = ' + window.testValue);
    }
})