public class Test_HomeController {
    
    
    public Boolean bEditMode {get;set;}
    public Boolean showRedFont {get;set;}
    
    public string displayDate {get;set;}
    
    public User userRecord{get;set;}
    
    public Test_HomeController(){
        bEditmode = true;
        
        userRecord = [SELECT Training_Date__c FROM User where Id=:UserInfo.getUserId()];
        
        if(userRecord.Training_Date__c != null){
            displayDate = userRecord.Training_Date__c.format('MM/dd/yyyy');}
        
        checkPastDate();
        
        system.debug('showRedFont '+showRedFont);   
    }//DP_toggleModes
    
    
    public void checkPastDate(){
        
        if(userRecord.Training_Date__c != null && (userRecord.Training_Date__c < system.Now().AddYears(-3)))
        {
            showRedFont = true;
        }
        else
            showRedFont = false;	
    } 
    
    public PageReference toggleEditMode() {
        bEditMode = !bEditMode;
        return null;
    }//toggleEditMode
    
    public PageReference saveRecord() {
        try {
            
            userRecord.Training_Date__c = datetime.parse(displayDate+' 10:00 AM');        
            update userRecord;
            checkPastDate();
        }
        catch(Exception ex) {
            system.debug(ex.getMessage());
        }
        
        return null;
    }
    
}