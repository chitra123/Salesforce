global class BA_updateAddress implements Database.Batchable<sObject>{
    
    global String query = 'SELECT ShippingStreet from Account';
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(Query);
    }
    
    global void execute(Database.BatchableContext BC, List<Account> scope){
    }
    
    global void finish(Database.BatchableContext BC){
    
    }
    
}