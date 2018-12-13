public with sharing class SubjectClassInputController {

	Id ParentId;
	public String className{get;set;}
	public List<SelectOption> subjList{get;set;}
	public List<String> selectedSubjs{get;set;}
	public List<SelectOption> selectedList{get;set;}
	public Map<String,Id> classSubjMap;
	public List<String> removeList{get;set;}
	List<Id> presentSubj;
	public List<Subject__c> subjObj{get;set;}
	public List<String> getSelected;
	
	public SubjectClassInputController(ApexPages.standardController controller){
		
		subjList = new List<selectOption>();
		classSubjMap = new Map<String,Id>();
		selectedList = new List<SelectOption> ();
		presentSubj = new List<Id>();
		getSelected = new List<String>();
		subjObj = new List<Subject__c>();
		
		Map<String,String>params = ApexPages.currentPage().getParameters();
		for(String key:params.keyset()){
			if(key.startsWith('CF')&&key.endsWith('_lkid')){
				ParentId = params.get(key);
			}
		}
		List<Class__c> currentclass = [select id,Name,(select id,subject__r.Name,subject__r.id from SubjectsClasses__r) from class__c  where id = :ParentId];
		className = currentclass[0].Name;
		
		for(Class__c lclass:currentclass){
			for(SubjectClass__c subj:lclass.SubjectsClasses__r){
				presentSubj.add(subj.subject__r.id);
			}
		}
		
		subjObj = [select name from Subject__c where id in :presentSubj ];
		List<Subject__c> allSubjects = [select id,Name from Subject__c where id NOT IN :presentSubj];
		system.debug('allSubjects>>'+allSubjects);
		for(Subject__c lsubj: allSubjects){
			//subId = new List<Id>();
			//subId.add(sb.subject__r.id );
			classSubjMap.put(lsubj.Name,lsubj.id);
			subjList.add(new Selectoption(lsubj.Name,lsubj.Name));
		}
		
		system.debug('selectedSubjs>>'+selectedSubjs);
		system.debug('selectedSubjs>>'+subjList);
	}
	
	public PageReference save(){
		
		Boolean isError= false;
		system.debug('classSubjMap>>>'+classSubjMap);
		List<SubjectClass__c> insertSubjClassList = new List<SubjectClass__c>();
		for(String sel : getSelected){
			Id subjId = classSubjMap.get(sel);
			insertSubjClassList.add(new SubjectClass__c(Subject__c = subjId, Class__c =  ParentId));
		}
		if(insertSubjClassList.size()>0){
			try{
				insert insertSubjClassList;
			}
			catch(Exception e){
				isError = true;
			}
		}
		
		if(!isError){
			PageReference pref = new PageReference('/'+ParentId);
			return pref;
		}
		return null;
	}
	
	public void addItems(){
		
		for(Integer i = 0;i<subjList.size();i++){
			for(String s : selectedSubjs){
				if(subjList[i].getValue().equalsIgnoreCase(s)){
					subjList.remove(i);
				}
			}
		}
		
		for(String sel:selectedSubjs){
			selectedList.add(new SelectOption(sel,sel));
			getSelected.add(sel);
		}
		
	}
	public void removeItems(){
		
		for(Integer i = 0;i<selectedList.size();i++){
			for(String s : removeList){
				if(selectedList[i].getValue().equalsIgnoreCase(s)){
					selectedList.remove(i);
				}
				
				if(getSelected[i].equalsIgnoreCase(s)){
					getSelected.remove(i);						
				}
			}
		}
		
		for(String sel:removeList){
			subjList.add(new SelectOption(sel,sel));
		}
		
	}
	
}