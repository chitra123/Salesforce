public with sharing class classHandler {

	public boolean updatesubjects;
	
	public void bulkbefore(){
		
		 Map<Id,Class__c> classOldMap = (Map<Id,Class__c>)Trigger.oldMap;
		
		if(Trigger.new != null && Trigger.isUpdate){
			system.debug('in before');
			for(Class__c lclass : (List<Class__c> )Trigger.new){
				if(lclass.Subjects__c != classOldMap.get(lclass.id).Subjects__c){
					updatesubjects = true;
				}
			}
		}
		system.debug('updatesubjects>>'+updatesubjects);
		if(updatesubjects){
			getClassList();
		}
	}
	
	public void getClassList(){
		
		Map<Id,Class__c> classnewMap = (Map<Id,Class__c>)Trigger.newMap;
		Map<Id,List<String>> subclassMap = new Map<Id,List<String>>();
		List<subject__c> selclass =[select Name,Classes__c ,(select class__r.name from subjectsclasses__r where class__c IN:classnewMap.keyset()) from subject__c];
		
		for(subject__c lsubject:selclass){
			List<String> lid = new List<String>();
			for(subjectclass__c subclass:lsubject.subjectsclasses__r){
				lid.add(subclass.class__r.name);
			}
			
			subclassMap.put(lsubject.id,lid);
		}
		system.debug('subclassMap>>>'+subclassMap);
		
		for(subject__c subjects: selclass){
			String classlist = '';
			for(String str : subclassMap.get(subjects.id)){
				classlist = classlist + str + ',';
			}
			system.debug('classlist>>>'+classlist);
			subjects.classes__c = classlist.substring(0,classlist.length()-1);
		}
		
		try{
			update selclass;
		}
		catch(Exception e){
			system.debug(e.getMessage());
		}
		
		
		//List<List<Subject__c>> subjList = [select Classes__c from Subject__c where id IN : subclassMap.values()];
	}
}