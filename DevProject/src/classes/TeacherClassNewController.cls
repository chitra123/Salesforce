public with sharing class TeacherClassNewController {
	
	ApexPages.Standardcontroller controller;
	public TeacherClassNewController(ApexPages.Standardcontroller controller){
		this.controller= controller;
	}
	
	public PageReference Redirect(){
		
		String ParentId;
		system.debug('parametres>>'+ApexPages.currentPage().getParameters());
		Map<String,String>params = ApexPages.currentPage().getParameters();
		for(String key:params.keyset()){
			if(key.startsWith('CF')&&key.endsWith('_lkid')){
				ParentId = params.get(key);
			}
		}		
		PageReference pageref = new PageReference('/apex/TeacherInput?retURL=%2Fa03%2Fo&save_new=1&sfdc.override=1&subjClass='+ParentId);
		return pageref;
	}
}