@isTest
public class UpdateContactsTest{
    static List<Account> accList = new List<Account>();
    static List<Contact>ContList;
    static void createData(){
        
        accList.add(new Account(Name = 'Test Account1', 
                                SLA__c='Gold',
                                SLAExpirationDate__c=system.today(),
                                SLASerialNumber__c='1234'));
        
        accList.add(new Account(Name = 'Test Account2', 
                                SLA__c='Gold',
                                SLAExpirationDate__c=system.today(),
                                SLASerialNumber__c='1234'));
        
        insert accList;    
        
        ContList = new List<Contact>();
        Contact cont1 = new Contact(LastName = 'Test Contact',AccountId =accList[0].id); 
        ContList.add(cont1);
        for(integer i = 0;i<5;i++){
            ContList.add(new Contact(LastName = 'Test Contact'+ i,AccountId= accList[1].id));
        }
        insert ContList;
                               
    }
    
    static testmethod void updateBulkAccounts(){
        createData();
        for(Account a:accList){
            a.phone = '1230';
        }
        update accList;
        List<Contact> cList = [select id,phone from Contact where accountId = :accList[1].id];
        system.assertEquals(cList[0].phone,'1230');
    }    
}