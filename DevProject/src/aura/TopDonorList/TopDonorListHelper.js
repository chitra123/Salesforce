({
	getTopDonors : function(component) {
		var action = component.get("c.getTopDonorList");
        
        action.setCallback(this,function(response){
            if(response.getState()=="SUCCESS"){
                component.set("v.donorList",response.getReturnValue());
            }
        });
        
        $A.enqueueAction(action);
	}
})