public with sharing class TeacherEditController {
	
	Integer i = 0;
	public 	Id currentId;
	public Map<String,Id> classNames{get;set;}
	public List<SubjectClass__c> subjects{get;set;}
	public boolean ifSubjectNotChanged{get;set;}
	public String Subject{get;set;}
	public String classId{get;set;}
	public List<classDetailsWrapper> classDetailsList{get;set;}
	public boolean newRow{get;set;}
	public boolean old{get;set;}
	public List<classDetailsWrapper> newClassesList{get;set;}
	public String className{get;set;}
	ApexPages.Standardcontroller controller;
	
	public TeacherEditController(ApexPages.Standardcontroller controller){
		
		this.controller = controller;
		classNames = new Map<String,Id>();
		currentId = Apexpages.currentPage().getParameters().get('id');
		
		loadClassRecords();
	}
	
	public class classDetailsWrapper{
		
		public String name{get;set;}
		public SubjectClass__c subjectClass{get;set;}
		public Boolean ifNewRow{get;set;}
		
		public classDetailsWrapper(String name){
			
			this.name = name;
			this.subjectClass = subjectClass;
			this.ifNewRow = false;
		}
		
		public classDetailsWrapper(SubjectClass__c subjectClass,Boolean ifNewRow){
			
			this.subjectClass = subjectClass;
			this.ifNewRow = ifNewRow;
		}
		
	}
	
	public void loadClassRecords(){
		
		ifSubjectNotChanged = true;
		newRow = false;
		old = true;
		classDetailsList = new List<classDetailsWrapper>();
		List<TeacherClass__c> classList= [select id,SubjectClass__r.Class__r.Name, SubjectClass__r.Class__c,SubjectClass__r.Subject__c from TeacherClass__c where Teacher__c = :currentId];
		system.debug('classList>>'+classList);
		subjects = [select id,Subject__c,Subject__r.Name,Class__c from SubjectClass__c where id IN (select SubjectClass__c from TeacherClass__c where Teacher__c = :currentId)];
		for(TeacherClass__c teach : classList){
			classNames.put(teach.SubjectClass__r.Class__r.Name,teach.SubjectClass__r.Class__c);
			classDetailsList.add(new classDetailsWrapper(teach.SubjectClass__r.Class__r.Name));
		}
		
		
		system.debug('subjects>>>'+subjects);
	}
	
	public void addClasses(){
		
		ifSubjectNotChanged = false;
		newClassesList =  new List<classDetailsWrapper>();
		//Subject = ApexPages.currentPage().getParameters().get('subject');
		if(!subjects.isEmpty() && subjects[0].Subject__r.Name.equals(Subject)){
			ifSubjectNotChanged = true;
		}
		
		newClassesList.add(new classDetailsWrapper(new SubjectClass__c(),true));
	}
	
	public void addNewClasses(){
		
		Id classSelected;
		newRow = true;
		if(classId!=null){
			classSelected = classNames.get(classId);
		}
		
		if(ifSubjectNotChanged){
			classDetailsList.add(new classDetailsWrapper(new SubjectClass__c(),true));	
		}
		else{
			newClassesList.add(new classDetailsWrapper(new SubjectClass__c(),true));
		}
		
		
		system.debug('classId>>>'+classSelected);
	}
	
	public void deleteClasses(){
		
		Id classSelected; 
		
		if(classId!=null){
			classSelected = classNames.get(classId);
		}
		
		String rowNum = ApexPages.currentPage().getParameters().get('index');
		//classDetailsList[rowNum].name;
		
		List<TeacherClass__c> delTeacher = [SELECT id FROM TeacherClass__c where SubjectClass__r.Class__c = :classSelected and Teacher__c = :currentId and  SubjectClass__r.Subject__c = :subjects[0].Subject__c];
		
		if(!delTeacher.isEmpty()){
			try{
				delete delTeacher;
			}
			catch(Exception e){
				ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.Error,e.getMessage()));
			} 
		}
		
		
		system.debug('rowNum>>>'+rowNum);
		
		if(ifSubjectNotChanged){
			classDetailsList.remove(Integer.valueOf(rowNum));
		}
		else{
			newClassesList.remove(Integer.valueOf(rowNum));
		}
		
	}
	
	public PageReference save(){
		
		i++;
		system.debug('i>>>'+i);
		system.debug('In method');
		system.debug('Subject>>>'+Subject);
		Teacher__c currentRec = (Teacher__c)controller.getRecord();
		system.debug('currentRec>>>'+currentRec);
		
		Id SubjectId = currentRec.Subject__c;
		String currentSubject = [select subject__r.Name from Teacher__c where id = :currentRec.id].subject__r.Name; 
		
		//String classAdded = ApexPages.currentPage().getParameters().get('classAdded');
		Boolean isError = false;
		List<SubjectClass__c> subjectClassRec  = new List<SubjectClass__c>();
		
		String query  = 'select id from SubjectClass__c where class__r.Name = :className  ';
		if(ifSubjectNotChanged){
			query = query + 'AND Subject__c = :SubjectId';
		}
		else{
			query = query + 'AND Subject__r.Name =:Subject';
		}
		
		try{
			subjectClassRec = Database.query(query);
		}
		catch(Exception e){
				isError = true;
				ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.Error,e.getMessage()));
		}
		
		if(subjectClassRec.isEmpty()&& className!=null){
			isError = true;
			ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.Error,'select correct class'));
		}		
		
		if(!isError && !ifSubjectNotChanged && i<=1){
			
			ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.Error,'Teacher is associated with classes for Subject: '+ currentSubject));
			ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.Error,'Teacher Class Association will be deleted..Click Save To continue'));
			isError = true;
		}
		
		if(!isError && !ifSubjectNotChanged){
			
			List<TeacherClass__c> todeleteList = [select id from TeacherClass__c where Teacher__c = :currentId];
			if(todeleteList.size()>0){
				delete todeleteList;
			}
		}
		
		if(!subjectClassRec.isEmpty() && !isError){
			TeacherClass__c newTeacher = new TeacherClass__c();
			newTeacher.SubjectClass__c = subjectClassRec[0].id;
			newTeacher.Teacher__c = currentId;
			
			try{
				insert newTeacher;
			}
			catch(Exception e){
				isError = true;
				ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.Error,e.getMessage()));
			}
		}
		
		if(!isError){
			controller.save();
			PageReference pageRef = new PageReference('/'+currentId);
			return pageRef;
		}
		
		return null;			
	}
}