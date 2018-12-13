public class VF_ReportingController{
    
    public Set<String> accOwnerList{get;set;}
    public Map<String,Integer> accountCount{get;set;}
    public Map<String,Integer> contactCount{get;set;} 
    public List<String> listSt{get;set;}
    
    public VF_ReportingController(){
        accOwnerList = new Set<String>();
        accountCount = new Map<String,Integer>();
        contactCount= new Map<String,Integer>();
        listSt = new List<String>();
    }
    
    public void getAccountOwner(){
        
        listSt.add('November');
        listSt.add('QTD');
        //get all account owners
        List<Account> accList = [SELECT id, owner.Name from Account];
        for(Account acc : accList){
            accOwnerList.add(acc.owner.Name);
        }
        
        //get list of accounts for each account owner
        List<AggregateResult> activeAcc = [SELECT count(id) total, owner.Name owner FROM Account where owner.Name IN : accOwnerList group by owner.Name];
        for(AggregateResult aggrRec : activeAcc){
            accountCount.put(String.valueOf(aggrRec.get('owner')), Integer.valueOf(aggrRec.get('total')));
        }
                
        //get list of contacts against each account owner                
        List<AggregateResult> activeContact = [SELECT count(id) total, account.owner.Name owner FROM Contact
                                                 where Account.owner.Name IN : accOwnerList group by account.owner.Name];
                                                 
        for(AggregateResult aggrRec : activeContact ){
            
            contactCount.put(String.valueOf(aggrRec.get('owner')), Integer.valueOf(aggrRec.get('total')));
        }
        
        for(String ownerName : accOwnerList){
            if(!contactCount.containsKey(ownerName)){
                contactCount.put(ownerName,0);
            }
        }
        
        
                                                             
    }
}