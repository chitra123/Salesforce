({
    showItems : function(component) {
        var options = component.get('v.options');
        var listSize = component.get('v.listSize');
        component.set('v.visibleOptions', options);
        if(listSize < options.length){
            component.get('v.visibleOptions').length = listSize;
        }
        component.set('v.showItems', true);
    },
    hideItems : function(component) {
        component.set('v.showItems', false);
    },
    selectItem : function(component,event) {
        component.set('v.selectedItem', event.target.innerHTML);
        component.set('v.showItems', false);
        var id = component.get('v.lookupId');
        document.querySelector('#lookupModal'+id+' .slds-modal').classList.remove('slds-fade-in-open');
        document.querySelector('#lookupModal'+id+' .slds-backdrop').classList.remove('slds-backdrop_open');
    },
    filterItems : function(component, event) {
        var current = event.target.value;
        var options = component.get('v.options');
        var listSize = component.get('v.listSize');
        var visibleOptions = [];
        for(var items in options){
            if(options[items].label.indexOf(current) > -1){
                visibleOptions.push(options[items]);
            }
        }
        if(listSize < visibleOptions.length){
            visibleOptions.length = listSize;
        }
        component.set('v.visibleOptions', visibleOptions);
    },
    filterListItems : function(component, event){
        var current = event.target.value;
        var options = component.get('v.options');
        var visibleOptions = [];
        for(var items in options){
            if(options[items].label.indexOf(current) > -1){
                visibleOptions.push(options[items]);
            }
        }
        component.set('v.visibleOptions', visibleOptions);
    },
    showList : function(component) {
        var id = component.get('v.lookupId');
        document.querySelector('#lookupModal'+id+' .slds-modal').classList.add('slds-fade-in-open');
        document.querySelector('#lookupModal'+id+' .slds-backdrop').classList.add('slds-backdrop_open');
        var options = component.get('v.options');
        component.set('v.visibleOptions', options);
    },
    hideList : function(component) {
        var id = component.get('v.lookupId');
        document.querySelector('#lookupModal'+id+' .slds-modal').classList.remove('slds-fade-in-open');
        document.querySelector('#lookupModal'+id+' .slds-backdrop').classList.remove('slds-backdrop_open');
        document.querySelector('.modalLookup .slds-input').value = "";
    }
})