({
	getValues : function(component) {
		var action = component.get("c.getAllVals");
        action.setCallback(this, function(a){
            if(a.getState()=="SUCCESS"){
                console.log(a.getReturnValue());
                component.set("v.listRec",a.getReturnValue());
            }
            
        });
        $A.enqueueAction(action);
	}
})