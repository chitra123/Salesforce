({
    doInit: function(component, event, helper){
        
        component.set("v.meetingDate",new Date());
        var action = component.get("c.getPicklistValues");
        action.setCallback(this, function(a) {
            if(a.getState() === 'SUCCESS'){
                var options = a.getReturnValue();
                var child = component.find("picklist");
                child.addPicklistVal(options);
            }else{
                console.log('errors');
            }
        });
        $A.enqueueAction(action);
    },
 	
    handleComponentEvent : function(component, event, helper){
        
        var param = event.getParam("paramName");
        var selectedVal = event.getParam("fieldValue");
        if(param == 'dateVal'){
            component.set("v.meetingDate", event.getParam("dateVal"));
            component.set("v.dateFormat", event.getParam("fieldValue"));
        }
        else if(param == 'dropdownVal'){
            component.set("v.location", selectedVal);
        }
        else if(param == 'Profile'){
            component.set("v.profileId", selectedVal);
        }
        else if(param == 'User'){
            component.set("v.userId", selectedVal);
        }
    },
    
    getCalendar : function(component, event, helper){
    	
        
        console.log("date",component.get("v.meetingDate"));
        console.log("location",component.get("v.location"));
        console.log("profileId",component.get("v.profileId"));
        console.log("userId",component.get("v.userId"));
    },
    
    clearAll : function(component, event, helper){
		
        component.set("v.meetingDate", new Date());
        component.set("v.location", '');
        component.set("v.profileId", '');
        component.set("v.userId", '');
        
        document.getElementsByClassName('datepicker')[0].value = moment().format(component.get("v.dateFormat"));
        document.getElementsByName('search')[0].value = '';
        document.getElementsByName('search')[1].value = '';
        document.getElementsByName('select')[0].selectedIndex = 0;
      
    }
})