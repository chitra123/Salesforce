@isTest
public class TagRecord_Controller_Test{
    
    @testSetup
    public static void createTestData(){
                
        //Insert account
        Account account = new Account(Name = 'Test Account');
        if(account != null){
            insert account;
        }
    }
    
    public testmethod static void testAddTag(){
        
        Account accRecord = [Select Id from Account LIMIT 1];
        
        Test.startTest();
        Test.setCurrentPage(Page.TagRecord);
        
        ApexPages.StandardController stdAccount = new ApexPages.StandardController(accRecord);
        TagRecord_Controller tagRecCtrl = new TagRecord_Controller(stdAccount);
        
        //test if Tag is new
        tagRecCtrl.retrieveTagsInfo();
        tagRecCtrl.newTag = new Tag__c(Tag_Name__c='Cycling');
        tagRecCtrl.saveTag();
        
        Test.stopTest();
    }
    
    public testmethod static void testAddExistingTag(){
        
        Account accRecord = [Select Id from Account LIMIT 1];
        
        Tag__c tgRec = new Tag__c(Tag_Name__c = 'Cycling');
        insert tgRec;
        
        Client_Tag__c clientTgRec = new Client_Tag__c(Account__c = accRecord.Id, Tag__c = tgRec.Id);
        insert clientTgRec;
        
        Test.startTest();
        Test.setCurrentPage(Page.TagRecord);
        
        ApexPages.StandardController stdAccount = new ApexPages.StandardController(accRecord);
        TagRecord_Controller tagRecCtrl = new TagRecord_Controller(stdAccount);
        
        //test if Tag is new
        tagRecCtrl.retrieveTagsInfo();
        tagRecCtrl.newTag = new Tag__c(Tag_Name__c='Cycling');
        tagRecCtrl.saveTag();
        
        Test.stopTest();
    }
    
    public testmethod static void testdeleteTag(){
        
        Account accRecord = [Select Id from Account LIMIT 1];
        
        Tag__c tgRec = new Tag__c(Tag_Name__c = 'Cycling');
        insert tgRec;
        
        Client_Tag__c clientTgRec = new Client_Tag__c(Account__c = accRecord.Id, Tag__c = tgRec.Id);
        insert clientTgRec;
        
        Test.startTest();
        Test.setCurrentPage(Page.TagRecord);
        
        ApexPages.StandardController stdAccount = new ApexPages.StandardController(accRecord);
        TagRecord_Controller tagRecCtrl = new TagRecord_Controller(stdAccount);
        
        //test if Tag is new
        Apexpages.currentPage().getParameters().put('delId', clientTgRec.Id);
        
        tagRecCtrl.deleteTag();
        
        Test.stopTest();
    }
}