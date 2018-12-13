public class availableAccounts{
    public List<Account>AccList{get;set;}
    public List<String> AccountName{get;set;} 
   
    public availableAccounts(ApexPages.StandardController controller){
        AccList = new List<Account>();
        AccountName = new List<String>();        
        AccList = [SELECT name FROM Account limit 3]; 
                
        for(Account a:AccList){
            AccountName.add(a.name);
        }
        system.debug('AccountName>>>'+AccountName);        
        system.debug('AccList>>'+AccList );     
     }     
}