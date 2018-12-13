public with sharing class pickListUISupportcontroller {
	/*
	public List<SelectOption> accountSelectOptionList{get;set;}
	public List<SelectOption> contactSelectOptionList{get;set;}
	public List<SelectOption> casesSelectOptionList{get;set;}*/
	public String selectedAccounts{get;set;}
	public  String selectedContact{get;set;}
	
	public pickListUISupportcontroller(ApexPages.standardController controller){
		//accountSelectOptionList = new List<SelectOption>();
		//contactSelectOptionList = new List<SelectOption>();
		//casesSelectOptionList = new List<SelectOption>();
	}
	
	public List<SelectOption> getaccountSelectOptionList(){
		
		List<SelectOption> accountSelectOptionList = new List<SelectOption>();
		List<Account> accountsList = [select id,Name from Account];
		if(accountsList!=null && accountsList.size()>0){
			for(Account acct : accountsList){
				accountSelectOptionList.add(new SelectOption(acct.id,acct.Name));
			}
		}
		return accountSelectOptionList;
		 
	}
	
	
	public List<SelectOption> getcontactSelectOptionList(){
		
		 List<SelectOption> contactSelectOptionList = new List<SelectOption>();
		system.debug('contactSelectOptionList>>>'+contactSelectOptionList);
		//contactSelectOptionList.clear();
		system.debug('In method');
		contactSelectOptionList.add(new SelectOption('--None--','--None--'));
		if(selectedAccounts!= null){
			List<Contact> contactList  = [select id,Name from Contact where AccountId = :selectedAccounts];
			if(contactList != null && contactList.size()>0){
				for(Contact contact : contactList){
					contactSelectOptionList.add(new SelectOption(contact.Name,contact.Name));
				}
			}
		}
		system.debug('contactSelectOptionList>>>'+contactSelectOptionList);
		
		return contactSelectOptionList;
	}
	
	public List<SelectOption> getcasesSelectOptionList(){
		
		system.debug('In method>>>>');
		 List<SelectOption> casesSelectOptionList = new List<SelectOption>();
		casesSelectOptionList.add(new SelectOption('--None--','--None--'));
		if(selectedContact!= null){
			List<Case> caseList  = [select id,CaseNumber from Case where Contact.Name = :selectedContact];
			if(caseList != null && caseList.size()>0){
				for(Case caseRec : caseList){
					casesSelectOptionList.add(new SelectOption(caseRec.CaseNumber,caseRec.CaseNumber));
				}
			}
		}
		return casesSelectOptionList;
	}
	
	
}