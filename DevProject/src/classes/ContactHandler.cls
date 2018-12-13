public with sharing class ContactHandler {
    
    public void BulkBefore(){
        
        if(Trigger.isInsert || Trigger.isUpdate){
            
            //calloutSoapAPi.login('chitra568@gmail.com', '@Barclays123');
            for(Contact c : (List<contact>)Trigger.new){
                
            }
        }
    }
}