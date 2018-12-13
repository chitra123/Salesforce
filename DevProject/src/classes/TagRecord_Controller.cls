public class TagRecord_Controller{
    
    //variable intialization
    List<String> lstTags = new List<String>();
    Map<String, Id> mapTagNameAndId = new Map<String, Id>();
    Set<String> setExstTagName = new Set<String>();
    public List<Client_Tag__c> lstExistingTags{set;get;}
    public String systemTags{set;get;}
    public Tag__c newTag{set;get;}
    public Boolean showError{set;get;}
    public String strErrorText{set;get;}
    public transient Map<String, String> mapCSSValues{get;set;}
    Id idAccount;
    
    /**
     * @author  Saurabh Sharma
     * @param Standard Controller
     * @return Null
     * @description This is a standard controller constructor
    */
    public TagRecord_Controller(ApexPages.StandardController controller) {
        idAccount = controller.getId();
        newTag = new Tag__c();
        showError = false;
        lstExistingTags = new List<Client_Tag__c>();
        mapCSSValues = new Map<String, String>();
        for(TagRecordCSSColors__mdt csscolor : [Select MasterLabel, Color__c from TagRecordCSSColors__mdt]){            
            mapCSSValues.put(csscolor.MasterLabel, csscolor.Color__c);
        }
        
        //get available Tags
        for(Tag__c tags : [Select Id, Tag_Name__c from Tag__c LIMIT 10000]){
            lstTags.add(tags.Tag_Name__c);
            mapTagNameAndId.put(tags.Tag_Name__c.toLowerCase(), tags.Id);
        }
        
        //convert List to JSON for sending Tags to autocomplete
        systemTags = JSON.serialize(lstTags);
        
        retrieveTagsInfo();
    }
    
    /**
     * @author  Saurabh Sharma
     * @param None
     * @return Null
     * @description This method will retrieve the Tags info from system
    */
    public void retrieveTagsInfo(){
        
        //clear existing values
        lstExistingTags.clear();
        setExstTagName.clear();
        
        //reset tag
        newTag = new Tag__c();
        
        for(Client_Tag__c taJunc : [Select Id, Account__c, Tag__r.Tag_Name__c from Client_Tag__c Where Account__c =: idAccount]){
            
            lstExistingTags.add(taJunc);
            setExstTagName.add(taJunc.Tag__r.Tag_Name__c.toLowerCase());
        }       
    }
    
    /**
     * @author  Saurabh Sharma
     * @param None
     * @return Null
     * @description Method to save the Tag record for Account
    */
    public void saveTag(){
    
        if(newTag.Tag_Name__c != null){
            
            //auto capitalize first letter of Tag
            newTag.Tag_Name__c = newTag.Tag_Name__c.substring(0,1).toUpperCase() + newTag.Tag_Name__c.substring(1, newTag.Tag_Name__c.length());
            
            //convert Tag name to lower case to validate with existing tag
            String strTagName = newTag.Tag_Name__c.toLowerCase();
            
            //check if Tag already exist in system. If not then insert a new Tag and jucntion record.
            if(!mapTagNameAndId.containsKey(strTagName) && !setExstTagName.contains(strTagName)){
                
                if(newTag != null){
                    showError = false;
                    
                    try{
                        insert newTag;                        
                    }catch(DMLException dex){
                        showError=true;
                        strErrorText=dex.getDmlMessage(0);
                        return;
                    }
                    
                    createClientTag(null, newTag.id, idAccount);                      
                }
            }
            
            //If Tag is present, then create a Junction record.
            else if(!setExstTagName.contains(strTagName) && !mapTagNameAndId.isEmpty()){
                
                showError = false;
                createClientTag(strTagName, null, idAccount);     
            }
            
            //throw an error if Tag is already present
            else{
                showError = true;
                strErrorText = Label.TagAlreadyAdded;
                return;
            }
            
            //refresh existing info
            retrieveTagsInfo();
            
        }else{
            
            //throw error if Tag name is empty
            strErrorText = Label.TagNameMissing;
            showError = true;
            return;
        }
    }
    
    /**
     * @author  Saurabh Sharma
     * @param None
     * @return Null
     * @description Method to delete the Tag record for Account
    */
    public void deleteTag(){
        
        Id deleteTagId = Apexpages.currentPage().getParameters().get('delId');
        
        if(deleteTagId != null){
            //TO DO: add logic to log error
            Database.delete(new Client_Tag__c(Id = deleteTagId),True);
        }
        
        //refresh existing info
        retrieveTagsInfo();
    }
    
    /**
     * @author  Saurabh Sharma
     * @param String Name, Id TagRecord, Id Account
     * @date Jan 7, 2016
     * @return Null
     * @description Method to insert junction record
    */
    private void createClientTag(String strTagName, id idTag, Id idAccount){
        
        Client_Tag__c taJunc = new Client_Tag__c();
        
        taJunc.Account__c = idAccount;        
        taJunc.Tag__c = idTag != null ? idTag : mapTagNameAndId.get(strTagName);
        
        if(taJunc != null){
            //TO DO: add logic to log error
            Database.insert(taJunc, True);
        }
    }
}