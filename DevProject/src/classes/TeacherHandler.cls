public with sharing class TeacherHandler {
	
	public static List<Teacher__c> TeacherDel  = new List<Teacher__c>();
	Map<Id,Id> teacherSubjMap ;
	public void afterInsert(){
		
		List<Teacher__c> newTeacher = [select subject__c from Teacher__c where id in: Trigger.new];
		
		for(Teacher__c tch : newTeacher){
			if(tch.Subject__c == null){
				TeacherDel.add(tch);
			}
		}
		postProcessing();
	}
	
	public void bulkbefore(){
		
		Map<Id,Teacher__c> teacherOldMap = (Map<Id,Teacher__c>)Trigger.oldMap;
		teacherSubjMap = new Map<Id,Id>(); 
		boolean updateteacherclasses = false;
		if(Trigger.new != null && Trigger.isBefore){
			for(Teacher__c tch: (List<Teacher__c>)Trigger.new){
				if(Trigger.isUpdate && tch.subject__c != teacherOldMap.get(tch.id).Subject__c){
					updateteacherclasses = true;
					teacherSubjMap.put(tch.id,tch.subject__c);
				}
				
				
			}
		}
		
		if(updateteacherclasses){
			updateSubjects();
		}
	}
	
	public void updateSubjects(){
		
		List<TeacherClass__c> teacherClass = [select SubjectClass__r.subject__c,Teacher__c from TeacherClass__c where Teacher__c IN :teacherSubjMap.keyset() ];
		for(TeacherClass__c teacher : teacherClass){
			teacher.SubjectClass__r.subject__c = teacherSubjMap.get(teacher.Teacher__c);
		}
		
		try{
			update teacherClass;
		}
		catch(Exception e){
			system.debug('error>>>'+e.getMessage());
		}
	}
	
	@future
	public static void postProcessing(){
		
		if(!TeacherDel.isEmpty())
			delete TeacherDel;
	}
}