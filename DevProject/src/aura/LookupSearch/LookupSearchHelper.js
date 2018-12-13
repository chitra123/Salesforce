({  
    getSuggestions: function(component) {
        var j$ = jQuery.noConflict();
        j$('.searchInp').autocomplete({
            //minLength: 3,
            delay:0,
            source: function(request, response) {
                //debugger;
                var queryTerm = request.term; 
                console.dir('REQUEST'+request);
                var action = component.get("c.getSearchResults");
                console.log('request.term',request.term);
                var fieldName = component.get("v.fieldName");
                action.setParams({
                    "likeQuery": request.term,
                    "objectName": component.get("v.objectName"),
                    "fieldName": fieldName,
                    "limitResults": component.get("v.limitSize")
                });
                
                action.setCallback(this, function(a) {
                    console.log('callback...');
                    var state =  a.getState();
                    if(state === "SUCCESS"){
                        var suggestions = a.getReturnValue();
                        console.log('tt',suggestions);
                        var objList = [];
                        suggestions.forEach(function(s) {
                            var obj = new Object();
                            
                            obj.value = s[fieldName];
                            obj.AccId = s.Id;
                            objList.push(obj);
                        });
                        response(objList);
                    }else{
                        console.log('error',a.getError()[0].message);
                    }
                });
              	
				$A.enqueueAction(action); 
                console.log('end2');
                
            },
            
            select: function( event, ui ) {
                
                j$(this).val(ui.item.value);
                element.parentNode.children[1].value = ui.item.AccId;
                element.parentNode.children[2].value = ui.item.value;
                return false;
            },
        }).data( "ui-autocomplete" )._renderItem = function( ul, item ) {
            return j$( "<li class=slds-lookup__item>" )
            .append( "<span class=slds-icon>" + " &nbsp;" + item.label + "</span>" )
            .appendTo( ul );
        };
        
        //setting width of result list to input text box width
        jQuery.ui.autocomplete.prototype._resizeMenu = function () {
            var ul = this.menu.element;
            ul.outerWidth(this.element.outerWidth());
        }
        
        //Adding css to result list
        j$(".ui-autocomplete").css({ "background": "rgb(255, 255, 255)", "border": "1px solid rgb(216, 221, 230)", "border-radius": ".25rem" });
       
		//j$( ".ui-autocomplete" ).css( "width",'445.518518px');
        //j$( ".ui-autocomplete" ).css( "width",j$(".searchInp").innerWidth());
        //if(j$(".wrap").length == 0){
          //  j$( ".ui-autocomplete" ).wrap('<span class = "wrap" style = "background: rgb(255, 255, 255);border: 1px solid rgb(216, 221, 230);border-radius: .25rem;z-index: 7000;position: absolute;"></span>');
        //}
        //j$( ".ui-autocomplete" ).innerWidth(j$(".searchInp").innerWidth());
    }
})