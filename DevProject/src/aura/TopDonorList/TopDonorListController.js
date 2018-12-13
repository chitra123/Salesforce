({
	getInit : function(component, event, helper) {
		
        helper.getTopDonors(component);
	},
    
    updateList : function(component, event, helper) {
    	helper.getTopDonors(component);
    }
})