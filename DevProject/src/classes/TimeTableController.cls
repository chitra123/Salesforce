public with sharing class TimeTableController {
	
	
	public Map<String,classDetailsWrapper> wrapperMap{get;set;}
	Map<String,List<String>> classSubjectTeacherMap;
	Map<String,Set<String>> classSubjectMap;
	ApexPages.Standardcontroller controller;
	public List<String> classes{get;set;}
	public String className{get;set;}
	public Id teacherId{get;set;}
	
	public TimeTableController(){
		
		className = ApexPages.currentPage().getParameters().get('class');
		teacherId = ApexPages.currentPage().getParameters().get('id');
		
		classSubjectTeacherMap = new Map<String,List<String>>();
		classSubjectMap = new Map<String,Set<String>>();
		wrapperMap = new Map<String,classDetailsWrapper>();
		getDetails();
	}
	
	public void getDetails(){
		List<SubjectClass__c> subjectClassList = [select id,Name,Class__r.Name,(select id,Name,SubjectClass__r.Name from TeacherSubjects__r) from SubjectClass__c];
		for(SubjectClass__c subj : subjectClassList){
			List<String> subjList = new List<String>();
			for(TeacherClass__c teachr : subj.TeacherSubjects__r){
				if(classSubjectTeacherMap.containsKey(subj.Class__r.Name)){
					subjList = classSubjectTeacherMap.get(subj.Class__r.Name);
					subjList.add(teachr.SubjectClass__r.Name + '-' + teachr.Name );
					classSubjectTeacherMap.put(subj.Class__r.Name,subjList);
				}
				else{
					subjList.add(teachr.SubjectClass__r.Name + '-' + teachr.Name);
					classSubjectTeacherMap.put(subj.Class__r.Name,subjList);			
				}
			}
			
		}
		
		boolean isEqual = false;
		for(String className : classSubjectTeacherMap.keyset()){
			List<String> subjList = new List<String>();
			List<String> subClassDup = new List<String>();
			for(String sub: classSubjectTeacherMap.get(className)){
				if(!subjList.isEmpty()){
					isEqual = false;
					for(String str : subjList){
						if(str.substring(0,3).equalsIgnoreCase(sub.substring(0,3))){
							isEqual = true;
							subClassDup.add(sub);
						}
					}
					if(!isEqual){
						subjList.add(sub);		
					}
				}
				else{
					subjList.add(sub);					
				}
			}
			//if(wrapperMap.isEmpty()){
				wrapperMap.put(className,new classDetailsWrapper(subjList));
			/*}
			else{
				system.debug('subClassDup>>>'+subClassDup);
				List<String> subjects ;
				for(Integer i = 0;i<subjList.size();i++){
					subjects = new List<String>();
					List<classDetailsWrapper> detailWrapperList = wrapperMap.values();
					for(Integer j = 0;j< detailWrapperList.size();j++){
							if(subjList[i].equalsIgnoreCase(detailWrapperList[j].teacherSubj[i])){
								
								//if(j>0){
									//for(Integer k = 0;k<j;k++){
										//if(detailWrapperList[k].teacherSubj[i]!=subjList[i])
									//}
								//}
								//subjects.add(subjList[i]);
							
							}
							else{
								subjects.add(subjList[i]);
							}
					}
				
					system.debug('subjList>>'+subjList);
				}
				wrapperMap.put(className,new classDetailsWrapper(subjects));
			}*/
		}
		system.debug('classSubjectTeacherMap>>'+classSubjectTeacherMap);
	
	}
	
	public class classDetailsWrapper{
		
		public List<String> teacherSubj{get;set;}
		public String timedif{get;set;}
		
		public classDetailsWrapper(List<String>teacherSubj){
			this.teacherSubj = teacherSubj;
		}
		 
	}
}