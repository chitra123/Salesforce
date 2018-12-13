({
    getAllValues : function(component) {
        //if(component.get("v.listRec").length == 1){
        var action = component.get("c.getAllVals");
        action.setStorable();
        action.setCallback(this, function(a){
            if(a.getState()=="SUCCESS"){
                console.log(a.getReturnValue());
                component.set("v.listRec",a.getReturnValue());
                console.log("Page %d loaded in %fms",
                            performance.now() - startTime);
            }
            
        });
        var startTime = performance.now();

        $A.enqueueAction(action);
        //}
    }
})