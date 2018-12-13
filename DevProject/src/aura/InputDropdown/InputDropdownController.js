({
	loadOptions : function(component, event, helper) {
        
        
        var params = event.getParam('arguments');
        if (params) {
            var lstOpts = [];
            var param1 = params.listOpts;
            for (var key in param1) {
                if (param1.hasOwnProperty(key)) {
                    var obj = {};
                    obj.label = param1[key];
                    obj.value = key;
                    lstOpts.push(obj);
                }
            }
            if(!component.get("v.defaultValue")){
                lstOpts.unshift({ value: "--None--", label: "--None--", selected : true });
            }else{
                lstOpts[0].selected = true;
            }
            component.set("v.optionsList", lstOpts);
        }
    },
    
    setDropdownVal : function(component, event, helper) {
    	
        console.log('v.selectedValue'+component.get("v.selectedValue"));
        
        //set Value of Date field using event
        var cmpEvent = component.getEvent("setValue");
        console.log('cmpEvent>',cmpEvent);
        cmpEvent.setParams({
            "fieldValue" : component.get("v.selectedValue"),
            "paramName":"dropdownVal"
        });
        cmpEvent.fire();

    }
})