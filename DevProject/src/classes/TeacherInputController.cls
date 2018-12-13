public with sharing class TeacherInputController {
	
	public List<SelectOption> classList{get;set;}
	public List<SelectOption> subjList{get;set;}
	public String selectedClass{get;set;}
	public String subject{get;set;}
	public static boolean flag{get;set;}
	public String SubjectRecord{get;set;}
	public String ClassName{get;set;}
	Boolean isError;
	Map<String,List<String>> classSubjMap = new Map<String,List<String>>();
	Boolean hasParent;
	ApexPages.Standardcontroller controller;
	String ParentId;
	
	public TeacherInputController(ApexPages.Standardcontroller controller){
		hasParent = false;
		flag= false;
		this.controller = controller;
		/*classList = new List<SelectOption>();
		classList.add(new SelectOption('--None--','--None--'));
		List<String> subj;
		List<Class__c> classSubj = [select id,Name,(select id,Name from Subjects__r) from Class__c];
		for(Class__c lclass: classSubj){
			classList.add(new SelectOption(lclass.Name,lclass.Name));
			subj = new List<String>();
			for(subject__c s: lclass.subjects__r){
				subj.add(s.name);
			}
			classSubjMap.put(lclass.Name,subj);
		}*/
		Map<String,String> parameterMap = ApexPages.currentPage().getParameters();
		if(parameterMap.containsKey('subjClass')){
			hasParent = true;
			ParentId = parameterMap.get('subjClass');
			system.debug('ParentId>>'+ParentId) ;
		}
		
		if(hasParent){
			flag = true;
			loadExistingRecord();
		}
	}
	
	
	public void loadExistingRecord(){
		
		List<SubjectClass__c> parentRecord = [select Class__r.Name,Name from SubjectClass__c where id = :ParentId];
		if(!parentRecord.isEmpty()){
			SubjectRecord = parentRecord[0].Name;
			ClassName = parentRecord[0].Class__r.Name;
		}
	}
	
	public pageReference save(){
		
		system.debug('In save');
		isError = false;
		
		if(hasParent){
			flag = true;
			controller.save();
			TeacherClass__c newTeacherClass = new TeacherClass__c();
			newTeacherClass.Name = 'Teacher';
			newTeacherClass.SubjectClass__c = ParentId;
			newTeacherClass.Teacher__c = controller.getRecord().id;
			try{
				insert newTeacherClass;
			}
			catch(Exception e){
				ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error,e.getMessage()));
				isError = true;
			}
		}
		
		if(!isError && hasParent){
			PageReference pref = new PageReference('/'+ParentId);
			return pref;
		}
		
		if(!hasParent && !isError){
			controller.save();
			PageReference pref = new PageReference('/apex/SubjectInput?id='+controller.getRecord().id);
			return pref;
		}
		
		return null;
	}
}