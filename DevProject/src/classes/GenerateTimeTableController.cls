public with sharing class GenerateTimeTableController {
	
	public Map<String,classDetailsWrapper> wrapperMap{get;set;}
	Map<String,List<String>> classSubjectTeacherMap;
	Map<String,Set<String>> classSubjectMap;
	ApexPages.Standardcontroller controller;
	public List<String> classes{get;set;}
	public String className{get;set;}
	public Boolean flag{get;set;}
	
	public GenerateTimeTableController(ApexPages.StandardController controller){
		classSubjectTeacherMap = new Map<String,List<String>>();
		classSubjectMap = new Map<String,Set<String>>();
		wrapperMap = new Map<String,classDetailsWrapper>();
		classes = new List<String>();
		this.controller = controller;
		getDetails();
	}
	
	public GenerateTimeTableController(){
		flag = false;
	}
	
	public void getDetails(){
		
		String classParam = ApexPages.currentPage().getParameters().get('className');
		system.debug('classParam>>'+className);
		List<Class__c> allClasses = [select id,Name,(select id,Name from SubjectsClasses__r) from Class__c];
		for(Class__c cl :allClasses){
			classes.add(cl.Name);
			Set<String> subjList = new Set<String>();
			for(SubjectClass__c sb:cl.SubjectsClasses__r){
				subjList.add(sb.Name.substring(0,3));
			}
			classSubjectMap.put(cl.Name,subjList);
		}
		system.debug('classSubjectMap>>'+classSubjectMap);
		
			system.debug('wrapperMap>>'+wrapperMap);
	}
	
	public class classDetailsWrapper{
		
		public List<String> teacherSubj{get;set;}
		public String timedif{get;set;}
		
		public classDetailsWrapper(List<String>teacherSubj){
			this.teacherSubj = teacherSubj;
		}
		 
	}
	
	public PageReference generate(){
		flag = true;
		String classParam = ApexPages.currentPage().getParameters().get('className');
		system.debug('classParam>>'+className);
		
		PageReference page = new PageReference('/apex/TimeTable?class=' + className+'&id='+ApexPages.currentPage().getParameters().get('id'));
		page.setRedirect(true);
		return page;
	}
}