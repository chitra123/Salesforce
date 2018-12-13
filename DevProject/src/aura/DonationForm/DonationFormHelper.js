({
    saveDonor : function(component) {
        
        var record = component.get("v.donation");
        var action = component.get("c.insertRecord");
        
        action.setParams({ donationRec : record });
        
        action.setCallback(this,function(response){
            if(response.getState()=="SUCCESS"){
                component.set("v.donation",{'sobjectType': 'devTest123__Donation__c',
                                            'devTest123__Donor_Name__c':''});
                
                var event = $A.get("e.c:UpdateAmt");
                event.setParams({'Amount' : record.devTest123__Amount__c});
                event.fire();
                
                var event = $A.get("e.c:UpdateDonorList");
                event.setParams({'donorAdded' : true});
                event.fire();
            }
        });
        
        $A.enqueueAction(action);
    }
})