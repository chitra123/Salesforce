public with sharing class pickListUIcontroller {
	
	public List<SelectOption> accountSelectOptionList{get;set;}
	public static List<SelectOption> contactSelectOptionList{get;set;}
	public static List<SelectOption> casesSelectOptionList{get;set;}
	public String selectedAccounts{get;set;}
	public static String selectedContact{get;set;}
	
	public pickListUIcontroller(ApexPages.standardController controller){
		accountSelectOptionList = new List<SelectOption>();
		contactSelectOptionList = new List<SelectOption>();
		casesSelectOptionList = new List<SelectOption>();
	}
	
	public void getAllAccounts(){
		
		List<Account> accountsList = [select id,Name from Account];
		List<Contact> contactList = [select id,Name from Contact];
		List<Case> caseList = [select id,CaseNumber from Case];
		if(accountsList!=null && accountsList.size()>0){
			for(Account acct : accountsList){
				accountSelectOptionList.add(new SelectOption(acct.id,acct.Name));
			}
		}
		
		if(contactList!=null && contactList.size()>0){
			for(Contact contactRec : contactList){
				contactSelectOptionList.add(new SelectOption(contactRec.id,contactRec.Name));
			}
		}
		
		if(caseList!=null && caseList.size()>0){
			for(Case caseRec : caseList){
				casesSelectOptionList.add(new SelectOption(caseRec.id,caseRec.CaseNumber));
			}
		}
		
	}
	
	@RemoteAction
	public static List<SelectOption> getcontacts(String accountId){
		system.debug('contactSelectOptionList>>>'+contactSelectOptionList);
		//contactSelectOptionList.clear();
		system.debug('In method');
		contactSelectOptionList = new List<SelectOption>();
		if(accountId!= null){
			List<Contact> contactList  = [select id,Name from Contact where AccountId = :accountId];
			if(contactList != null && contactList.size()>0){
				for(Contact contact : contactList){
					contactSelectOptionList.add(new SelectOption(contact.Name,contact.Name));
				}
			}
		}
		system.debug('contactSelectOptionList>>>'+contactSelectOptionList);
		return contactSelectOptionList;
	}
	
	@RemoteAction
	public static List<selectOption> getCases(String contactName){
		
		system.debug('In method>>>>');
		casesSelectOptionList = new List<SelectOption>();
		if(contactName!= null){
			List<Case> caseList  = [select id,CaseNumber from Case where Contact.Name = :contactName];
			if(caseList != null && caseList.size()>0){
				for(Case caseRec : caseList){
					casesSelectOptionList.add(new SelectOption(caseRec.CaseNumber,caseRec.CaseNumber));
				}
			}
		}
		return casesSelectOptionList;
	}
	
	
}