global class contactController{
    
    @AuraEnabled
    global static List<Contact> getContactRecords(){
        List<Contact> contactList = [SELECT id, Name,Account.Name,Phone FROM Contact LIMIT 50000];
        return contactList;
    }
}