public class accountSearch{
    
    public List<Account> accountList{get;set;}
    public id selectId{get;set;}
    public String selId{get;set;}
    public String word{get;set;}
    public boolean flag{get;set;}
    public Integer isSelected{get;set;}
    public List<id> selectedAccounts{get;set;}
    public id accName{get;set;}
    public List<selectAccountWrapper> selAccount{get;set;}
    
    public accountSearch(ApexPages.StandardController controller){
        accountList = new List<Account>();
        selAccount = new List<selectAccountWrapper>();
    }
    public void searchAccount(){
        system.debug('In method'); 
        
        if(word!=null && word!=''){  
	        String query = word + '%';    
	        accountList = [SELECT id,name from Account where name LIKE :query];  
	        flag=false;
	        
	        if(accountList.isEmpty()){
	            flag=true;
	        }
        }               
        system.debug('flag>>'+flag);
        system.debug('selectId>>>>>'+selectId);

    }
    public void DeleteAcc(){
        system.debug('selectId>>>>>'+selId);
        Account a = [SELECT id,name FROM Account where id=:selId];
        delete a;  
        searchAccount();
        /*pagereference pref = new pagereference('/apex/AccountSearch');  
        pref.setRedirect(true);
        return pref;*/
        }
        
	public void getSelectedAccounts(){
		system.debug('In getSelectedAccounts method');
		system.debug('accName>>>'+accName);
		if(isSelected==1){
			selAccount.add(new selectAccountWrapper(true,accName));
		}
		system.debug('selAccount>>>'+selAccount);
		selectedAccounts.add(accName);
		system.debug('selectedAccounts>>>'+selectedAccounts);
	}
	
	public class selectAccountWrapper{
		public boolean isSelected;
		public Id AccountId;
		
		public selectAccountWrapper(boolean isSelected,Id AccountId){
			this.isSelected = isSelected;
			this.AccountId  = AccountId;
		}
		
	}

}