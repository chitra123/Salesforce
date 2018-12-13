public class TestPage_Controller {
    
    public Account accountRec{get;set;}
    public Boolean flag{get;set;}
    
    public List<Contact> lstContact{get;set;}
    
    //public Account acc;
    public ApexPages.StandardController controller;
    
    public TestPage_Controller(){
        accountRec = new Account();
        flag = false;
        ApexPages.currentPage().getParameters().put('name','demo1');
    }
    
    public TestPage_Controller(ApexPages.StandardController controller){
        this.controller = controller;
        accountRec = (Account)controller.getRecord();
        
        String accId = ApexPages.currentPage().getParameters().get('Id');
        
        lstContact = [SELECT Id, Name, Account.Name FROM Contact WHERE accountId = :accId] ;      
    }
    
    
    public PageReference Save(){
        if(accountRec.Name == 'Steve'){
            accountRec.AccountNumber = '1232423';
        }else if(accountRec.Name == 'Test'){
            accountRec.AccountNumber = '3333';
        }else{
            accountRec.AccountNumber = '22223';
        }
        
        flag = true;
        if(flag == true){
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error'));
        }else{
            controller.save();
            PageReference pref = new PageReference((ApexPages.currentPage().getParameters().put('name','demo1')));
            //insert accountRec;
            //PageReference pref = new PageReference('/'+ accountRec.Id);
            // PageReference pref = controller.save();
            //pref = new PageReference('/'+controller.getId());
            pref.setRedirect(true);
            return pref;
        }  
        return null;
    }
}