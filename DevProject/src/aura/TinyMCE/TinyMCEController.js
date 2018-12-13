({
    afterScriptsLoadedUpdated: function(component, event, helper) {
        //console.log('Inside afterScriptsLoadedUpdated');
        tinymce.init({
            //console.log('adsfda');
            selector: "textarea[name=" + component.get("v.name") + "]",
            menubar: false,
            plugins: component.get("v.plugins"),
            toolbar: component.get("v.toolbar"),
            height: "480",
            plugins: "noneditable",
            noneditable_editable_class: "mceEditable",
            noneditable_noneditable_class: "mceNonEditable",
            
            
            
            // checks on load
            
            init_instance_callback: function(editor) {
                var delimiter = component.get("v.delimiter");
                var body = component.get("v.editorBody");
                
                if ((component.get("v.personalization")) != null && (component.get("v.editorBody")) != null && (component.get("v.delimiter")) !=null) {
                    JSON.parse(component.get("v.personalization"), function(k, v) {
                        if (body.search(delimiter + k + delimiter) > -1) {
                            body = body.replace(new RegExp((delimiter + k + delimiter), 'g'),v);
                        }
                        
                    });
                }
                
            }
            
        });
        
    },
    itemsChange: function(component, event, helper){
        //console.log("Inside TinyMCE Editor");
        
        var delimiter = component.get("v.delimiter");
        var body = component.get("v.editorBody");
        //console.log("Body is "+body);
        //console.log("Personalization is "+component.get("v.personalization"));
        
        if((component.get("v.editorBody")) != null && (component.get("v.delimiter")) !=null) {
            JSON.parse(component.get("v.personalization"), function(k, v) {
                if (body.search(delimiter + k + delimiter) > -1) {
                    body = body.replace(new RegExp((delimiter + k + delimiter), 'g'),v);
                }
                
            });
        
            //if still any other personalization parameters found mark as blank
            while ((body.search(delimiter)) > -1) {
                var fstdelimiterindex = body.indexOf(delimiter);
                var scnddelimiterindex = (body.indexOf(delimiter, fstdelimiterindex + 1)) + 2;
                var strOriginal = body.substring(fstdelimiterindex, scnddelimiterindex);
                var body = body.replace(strOriginal, " ");
            }
        
        
            //first time sending email editor body for saving on SEND button 
            $A.get("e.c:aexp_mc_setUpdatedMarkup").setParams({
                setUpdatedMarkup: body
            }).fire();
        
            tinymce.activeEditor.setContent(body);
            tinymce.activeEditor.on('blur',  function(e) {
                var editedtinyMCEContent = tinymce.activeEditor.getContent();
                //console.log('onblur***************onblur' + editedtinyMCEContent);
                
                $A.get("e.c:aexp_mc_setUpdatedMarkup").setParams({
                    setUpdatedMarkup: editedtinyMCEContent
                }).fire();
                
            });
       }     
    },
    reloadTinyMCE: function(component, event, helper) {
        tinymce.EditorManager.editors = [];
    }
})