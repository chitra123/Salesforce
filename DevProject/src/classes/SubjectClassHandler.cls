public with sharing class SubjectClassHandler {
	
	public List<Id> subjIds ;
	public void bulkbefore(){
		Boolean updatesubjects = false;
		Map<Id,SubjectClass__c> classOldMap = (Map<Id,SubjectClass__c>)Trigger.oldMap;
		subjIds = new List<Id>();
		if(Trigger.new != null){
			system.debug('in before');
			for(SubjectClass__c lclass : (List<SubjectClass__c> )Trigger.new){
				if(Trigger.isInsert && lclass.subject__c != null){
					updatesubjects = true;
					subjIds.add(lclass.subject__c);
				}
				
				if(Trigger.isUpdate&& lclass.subject__c != classOldMap.get(lclass.id).subject__c){
					updatesubjects = true;
					subjIds.add(lclass.subject__c);
				}
			}
		}
		system.debug('updatesubjects>>'+updatesubjects);
		if(updatesubjects){
			getClassList();
		}
	}
	
	public void beforedelete(){
		
		/*Id subjclassId;
		if(Trigger.old!=null){
			for(SubjectClass__c subclass:(List<SubjectClass__c>)Trigger.old){
				subjclassId = subclass.id;
			}
		}
		List<Teacher__c> existingTeacher = [select id from Teacher__c where id in (select Teacher__c from TeacherClass__c where SubjectClass__c = :subjclassId)];
		if(existingTeacher.size()>0){
			
		}*/
	}
	
	public void getClassList(){
		
		system.debug('in method>>>');		
		Map<Id,SubjectClass__c> classnewMap = (Map<Id,SubjectClass__c>)Trigger.newMap;
		Map<Id,List<String>> subclassMap = new Map<Id,List<String>>();
		List<Subject__c> selclass = new List<Subject__c>();
		selclass = [select Name,Classes__c ,(select class__r.name from subjectsclasses__r) from subject__c where id IN :subjIds];
		
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
				if(!classlist.contains(str)){
					classlist = classlist + str + ',';
				}
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