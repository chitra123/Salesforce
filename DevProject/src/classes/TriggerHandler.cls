public with sharing class TriggerHandler {

    public static void createHandler(Schema.sObjectType so){
        
        if(so==Teacher__c.sObjectType){
            TeacherHandler handler = new TeacherHandler();
            if(Trigger.isAfter){
                handler.afterInsert();
            }
            if(Trigger.isUpdate){
                handler.bulkbefore();
            }
        }
        
        if(so==SubjectClass__c.sObjectType){
            
            SubjectClassHandler handler = new SubjectClassHandler();
            handler.bulkbefore();
            
            if(Trigger.isBefore && Trigger.isDelete){
                handler.beforedelete();
            }
        }
        
        if(so==TeacherClass__c.sObjectType){
            
            TeacherClassHandler handler = new TeacherClassHandler();
            if(Trigger.isBefore){
                handler.bulkbefore();
            }
            
            if(Trigger.isAfter){
                handler.afterInsert();
            }
        }
        
        if(so==Contact.sObjectType){
            
            ContactHandler handler = new ContactHandler();
            if(Trigger.isBefore){
                handler.bulkBefore();
            }
        }
    }   
    

}