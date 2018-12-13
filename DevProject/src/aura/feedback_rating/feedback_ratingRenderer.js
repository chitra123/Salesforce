({
	// Your renderer method overrides go here
    render : function() {
        var ret = this.superRender();
        // do custom rendering here
        return ret;
    },
    afterRender: function (component) {
        this.superAfterRender();
        // interact with the DOM here
        // Prerate as per data in backend
        var prerate = component.get("{!v.rating}");
        var id = component.get("{!v.triggerID}");
        var ratings = document.querySelectorAll('input[name=rating'+id+']');
        for(var i=0; i<ratings.length; i+=1){
            if(prerate === i+1){
                ratings[i].checked = true;
            }
        }
        //Add tooltip messages as per messages received during initialization
        var tooltip = component.get("{!v.tooltipList}");
        var tooltipList = tooltip.split(',');
        if(tooltipList.length !== 0){            
            for (var i = 0,j = 0; i < ratings.length; i+=1){
                ratings[i].dataset.title = tooltipList[j];
                if(tooltipList.length === 3 ){
                    if(i === 0){
                        j+=1;
                    }
                    if(i === 3){
                        j+=1;
                    }
                }
                if(tooltipList.length > 3 ) {
                    if(i >= 0 && i < tooltipList.length){
                        j+=1;
                    }
                }
            } 
        }
    }
})