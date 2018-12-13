public with sharing class SubjectInputController {
	
	ApexPages.standardController controller;
	public List<String> selectedClass{get;set;}
	public String subject{get;set;}
	Boolean isError;
	public List<SelectOption> classList{get;set;}
	public List<SelectOption> subjList{get;set;}
	Map<String,List<String>> classSubjMap = new Map<String,List<String>>();
	Id currentId;
	
	public SubjectInputController(ApexPages.standardController controller){
		
		this.controller = controller;
		subjList = new List<SelectOption>();
		subjList.add(new SelectOption('--None--','--None--'));
		//classList = new List<SelectOption>();
		//classList.add(new SelectOption('--None--','--None--'));
		List<String> classes;
		//List<Class__c> classSubj = [select id,Name,(select id,Name from Subjects__r) from Class__c];
		List<Subject__c> subList = [select id,Name,(select class__r.name from subjectsclasses__r) from subject__c];
		for(Subject__c subj:subList){
			classes = new List<String>();
			for(subjectclass__c sc: subj.subjectsclasses__r){
				classes.add(sc.class__r.name);
			}
			subjList.add(new SelectOption(subj.Name,subj.Name));
			classSubjMap.put(subj.Name,classes);
		}
		/*for(Class__c lclass: classSubj){
			classList.add(new SelectOption(lclass.Name,lclass.Name));
			subj = new List<String>();
			for(subject__c s: lclass.subjects__r){
				subj.add(s.name);
			}
			classSubjMap.put(lclass.Name,subj);
		}
		*/
		currentId = ApexPages.currentPage().getParameters().get('id');
		List<Teacher__c> currentRecord = [select Subject__c from teacher__c where id = :controller.getRecord().id];
	}
	
	public void getSubjects(){
		
		classList = new List<SelectOption>();
		if(!subject.contains('None')){
			for(String sub:classSubjMap.get(subject)){
				classList.add(new SelectOption(sub,sub)) ;
			}
		}
	}
	
	public pageReference save(){
		
		system.debug('In save');
		isError = false;
		List<Subjectclass__c> subjclassToInsert = new List<Subjectclass__c>();
		List<TeacherClass__c> teacherclassToInsert = new List<TeacherClass__c>();
		List<Class__c> classSel = [select id from class__c where name IN :selectedClass];
		List<Subject__c> SubjIDs = [select id from Subject__c where Name =:subject];
		if(classSel.isEmpty()||SubjIDs.isEmpty()){
			ApexPages.Message errorMsg= new ApexPages.Message(ApexPages.severity.Error,'Select Both Class and subject');
			ApexPages.addMessage(errorMsg);
			isError = true;
		}
		
		subjclassToInsert = [select id from Subjectclass__c where subject__c = :SubjIDs[0].id and class__c in :classSel];
		system.debug('subjclassToInsert>>>'+subjclassToInsert);
		//adding teacherclass records
		if(!isError){
			for(Subjectclass__c subclass : subjclassToInsert){
				teacherclassToInsert.add(new TeacherClass__c(SubjectClass__c = subclass.id,Teacher__c = currentId));
			}
			
			try{
				insert teacherclassToInsert;
			}
			catch(Exception e){
				ApexPages.Message errorMsg= new ApexPages.Message(ApexPages.severity.Error,e.getMessage());
				ApexPages.addMessage(errorMsg);
				isError = true;
			}
		}
		
		
		
		List<Teacher__c> currentRec = [select subject__c from Teacher__c where id = :currentId];
		if(!isError && currentRec.size()>0){
			
			String text = '';
			for(String str : selectedClass){
				text = text + str + ',';
			}
			currentRec[0].subject__c =SubjIDs[0].id;
			currentRec[0].classes__c  = text.substring(0, text.length()-1);
			try{
			update currentRec;
			}
			catch(Exception e){
				ApexPages.Message errorMsg= new ApexPages.Message(ApexPages.severity.Error,e.getMessage());
				ApexPages.addMessage(errorMsg);
				isError = true;
			}
			
		}
		
		if(!isError){
			PageReference pref = new PageReference('/'+currentId);
			return pref;
		}
		
		return null;
	}
	

}