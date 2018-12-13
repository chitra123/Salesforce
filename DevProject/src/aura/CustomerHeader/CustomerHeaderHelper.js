({
	loadAccount : function(component) {
        var action = component.get("c.getAccount");
        action.setParams({accountId : component.get("v.accountId") });
        action.setCallback(this,function(response){
           	var state = response.getState();
            if(state === "SUCCESS"){
               component.set("v.accountRec",response.getReturnValue());
            } 
        });
        $A.enqueueAction(action);
		//var action = component.get("c.getAccount");
        
        //action.setParams({
        //    accountId : component.get("v.accountId")
        //});
        
        //action.setCallback(this, function(a) {
        //    if (a.getState() === "SUCCESS") {
        //        component.set("v.account", a.getReturnValue());
		//		sforce.console.setTabTitle(component.get("v.account.Name"));
        //    } else if (a.getState() === "ERROR") {
        //        $A.log("Errors", a.getError());
        //    }
        //});
        
        //$A.enqueueAction(action);

		//sforce.console.setTabTitle(component.get("v.account.Name"));
	},

	openAccount : function(component) {
		//sforce.console.openPrimaryTab(undefined, '/' + component.get("v.accountId"), true, 'Account');
	},

	openOutlook : function(component) {
		//The callback function that openSubtab will call once it's got the ID for its primary tab
        //var callOpenSubtab = function callOpenSubtab(result) {
        //    sforce.console.openSubtab(result.id,
        //       'https://www.transamerica.com', true, 'Transamerica');
        //};

        //sforce.console.getEnclosingPrimaryTabId(callOpenSubtab);

		//sforce.console.openPrimaryTab(undefined, 'https://www.nextcapital.com', true, 'NextCapital');
	},

	openFinancialWellness : function(component) {
		//sforce.console.openPrimaryTab(undefined, 'https://www.myquestis.com', true, 'MyQuestis');
	}
})