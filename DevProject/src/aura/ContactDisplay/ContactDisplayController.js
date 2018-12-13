({
	doInit : function(component) {
		var action = component.get("c.getContactRecords");
        
        action.setCallback(this,function(response){
           	var state = response.getState();
            alert(state);
            if(state === "SUCCESS"){
               component.set("v.contactList",response.getReturnValue());
            } 
        });
        $A.enqueueAction(action);
	}
})