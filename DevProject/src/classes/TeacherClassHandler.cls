public with sharing class TeacherClassHandler {
	
	public List<Id> newIds;
	public Map<Id,Id> oldIds;
	public List<Id> SubjectClass;
	
	public void afterInsert(){

		newIds = new List<Id> ();
		
		if(Trigger.New !=null){
			if(Trigger.isInsert){
				for(TeacherClass__c tch : (List<TeacherClass__c>)Trigger.New){
					newIds.add(tch.Teacher__c);
				}				
			}
		}
		
		if(!newIds.isEmpty()){
			updateTeacher();
		}
	}
	
	public void bulkBefore(){
		oldIds = new Map<Id,Id> ();
		
		if(Trigger.isDelete && Trigger.old != null){
			for(TeacherClass__c teachClass: (List<TeacherClass__c>)Trigger.old){
				oldIds.put(teachClass.SubjectClass__c,teachClass.Teacher__c);
			}
		}
		
		if(!oldIds.isEmpty()){
			deleteClass();
		}
	}
	
	public void updateTeacher(){
		
		Map<Id,String> subjclassMap = new Map<Id,String>();
		List<Teacher__c> currentTeachr = [Select Classes__c,id from Teacher__c where id IN :newIds];
		
		List<String> names = new List<String>();
		List<TeacherClass__c> currentTeacherClass = [select Subjectclass__r.Class__r.Name from TeacherClass__c where Teacher__c IN:newIds];
		
		for(TeacherClass__c tchclass:currentTeacherClass){
			names.add(tchclass.Subjectclass__r.Class__r.Name);
		}
		
		system.debug('names>>'+names);
		
		for(Teacher__c teach :currentTeachr){
			String classes = '';
			for(String str :names){
				classes = classes + str +',';
			}
			teach.Classes__c = classes.substring(0,classes.length()-1);
		}
		
		try{
			update currentTeachr;
		}
		catch(Exception e){
			system.debug('e>>'+e.getMessage());
		}
	}
	
	public void deleteClass(){
		
		List<Id> teacherIds = new List<Id>();
		List<String> classNames = new List<String>();
		List<TeacherClass__c> tchClass = [select Subjectclass__r.Class__r.Name,Teacher__c from TeacherClass__c where SubjectClass__c NOT IN  :oldIds.keyset() and Teacher__c IN :oldIds.values()];
		for(TeacherClass__c tt :tchClass){
			classNames.add(tt.Subjectclass__r.Class__r.Name);
			teacherIds.add(tt.Teacher__c);
		}
		
		List<Teacher__c> toUpdateList = [select Classes__c from Teacher__c where id IN :teacherIds];
		for(Teacher__c teach :toUpdateList){
			String className = '';
			for(String cl :classNames){
				className = className + cl + ',';
			}
			
			teach.Classes__c = className.substring(0,className.length()-1);
		}
		
		try{
			update toUpdateList;
		}
		catch(Exception e){
			system.debug('err>>'+ e.getMessage());
		}
	}
}