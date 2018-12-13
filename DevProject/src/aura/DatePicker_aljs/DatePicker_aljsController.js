({
	scriptsLoaded : function(component, event, helper) {
		
        var j$ = jQuery.noConflict();
        
        //Assigning SLDS Static Resource Path To A Variable To Use It With ALJS Initialization
        var assetsLoc = '{!URLFOR($Resource.SLDS100)}';
        
        //ALJS Initialization   
        j$.aljsInit({
            assetsLocation: assetsLoc, //SLDS Static Resource Path
            scoped: true
        });
        
        //get Date format
        var dtFormat = component.get("v.dateFormat");
        
        j$('#date').datepicker({
            initDate: moment(), //Today Date
            defaultDate : null,
            format: dtFormat, //Date Format Of Datepicker Input Field
            onSelect: function(datepicker, selectedDate) {
                console.log('selected',selectedDate);
                var selDate = selectedDate;
                component.set("v.selectedDate", new Date(selectedDate._i));
                
                //set Value of Date field using event
                var cmpEvent = component.getEvent("setValue");
                cmpEvent.setParams({
                    "dateVal" : component.get("v.selectedDate"),
                    "paramName":"dateVal",
                    "fieldValue" : dtFormat
                });
                cmpEvent.fire();
            }
        });
    },
    
    doInit : function(component,event,helper){
        console.log(component.get("v.dateLabel"));
		
    }
})