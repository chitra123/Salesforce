public with sharing class DynamicApexController {
	
	public List<selectOption> customObjects{get;set;}
	public String isSelectedsObject{get;set;}
	public Map<String, Schema.SObjectField> sObjectFields{get;set;}
	public boolean flag{get;set;}
	public boolean check{get;set;}
	public List<WrapperClass> wrapList{get;set;}
	public List<String> selectedFields{get;set;}
	
	public  DynamicApexController(){
		
		flag = false;
		wrapList = new List<WrapperClass>();
		selectedFields = new List<String>();
		Map<String, Schema.SObjectType> sObjectMap	= Schema.getGlobalDescribe();
		List<Schema.SObjectType> sObjectList = sObjectMap.values();
		customObjects = new List<selectOption>();
		for(Schema.sObjectType s : sObjectList){
				customObjects.add(new selectOption(s.getDescribe().getName(),s.getDescribe().getName()));		
		}	
		
	}
	
	public class WrapperClass{
		
		public String sObjectFieldName{get;set;}
		public Boolean isSelected{get;set;}
		
		public WrapperClass(String sObjectFieldName){
			
			this.sObjectFieldName = sObjectFieldName;
			this.isSelected= false;
		}
		
	}
	public void getFieldNames(){
		flag = true;
		check=false;
		selectedFields.clear();
		wrapList.clear();
		Schema.SObjectType t  = Schema.getGlobalDescribe().get(isSelectedsObject);
		Schema.DescribeFieldResult F = Schema.SObjectType.Account.fields.Name;
		sObjectFields = t.getDescribe().fields.getMap();
		for(String name : sObjectFields.keyset()){
			wrapList.add(new WrapperClass(name));
		}
		sObjectFields.clear();
		
	}
	
	public void getSelectedAccounts(){
		
		selectedFields.clear();
		check=true;
		for(WrapperClass obj : wrapList){
			if(obj.isSelected){
				selectedFields.add(obj.sObjectFieldName);
			}
		}
		
		if(selectedFields.isEmpty()){
			check=false;
			ApexPages.Message mymsg = new ApexPages.Message(ApexPages.severity.INFO,'No Records Selected');
			ApexPages.addMessage(mymsg);
		}
	}
	
}