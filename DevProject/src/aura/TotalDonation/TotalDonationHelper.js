({
	getDonationAmt : function(component) {
		
        var action = component.get("c.getTotalDonationAmt");
        
        action.setCallback(this,function(response){
            if(response.getState()=="SUCCESS"){
                component.set("v.totalAmt",response.getReturnValue());
            }
        });
        
        $A.enqueueAction(action);
	}
})