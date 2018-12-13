({    
    //Controller method to set the rating on the UI when user clicks a particular star 
    rate : function(component,event) {
        var setRating = event.srcElement.dataset.value;
        var id = component.get("{!v.ratingID}");
        var compEvent = component.getEvent("passRating");
        compEvent.setParams({"setRating" : setRating,"ratingID" : id });
        compEvent.fire();
	},
	//Controller method to show tooltip message on hovering over the stars
    tooltip : function(component, event) {
        var tooltip = component.get("{!v.tooltipList}");
        var tooltipList = tooltip.split(',');
        if(tooltipList.length !== 0){
            var id = component.get("{!v.ratingID}");
            tooltip = document.querySelectorAll('#tooltip'+id);
            tooltip[0].style.opacity = '1';
            tooltip[0].style.top = '35px';
            tooltip[0].style.left = (event.srcElement.offsetLeft)+ 'px';
            var tooltip_text = tooltip[0].querySelector('.slds-popover__body');
            tooltip_text.textContent = event.srcElement.dataset.title;
        }        
    },
    //Controller method to hide the tooltip message being showed on hovering out
    hideTooltip : function(component){
        var tooltip = component.get("{!v.tooltipList}");
        var tooltipList = tooltip.split(',');
        
        if(tooltipList.length !== 0){
            var id = component.get("{!v.ratingID}");
            tooltip = document.querySelectorAll('#tooltip'+id);
            tooltip[0].style.opacity = '0';
        }
    },
    changeRating: function(component){
        var prerate = component.get("{!v.rating}");
        var id = component.get("{!v.ratingID}");
        var ratings = document.querySelectorAll('input[name=rating'+id+']');
        for(var i=0; i<ratings.length; i+=1){
            if(prerate === i+1){
                ratings[i].checked = true;
            }
        }
    }
})