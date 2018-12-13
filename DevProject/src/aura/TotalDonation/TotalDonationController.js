({
	doInit : function(component, event, helper) {
		helper.getDonationAmt(component);
	},
    
    addTotal : function(component, event, helper) {
    	
        var amt = component.get("v.totalAmt");
        var newAmt = event.getParam("Amount");
        
        component.set("v.totalAmt",amt + newAmt);
        console.log('asda',component.get("v.totalAmt"));
        
    }
})