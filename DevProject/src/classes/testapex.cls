public with sharing class testapex {
	
	/*public Set<Id> parentId ;
	public List<childobj__c> childInserted;
	public Map<Id,List<childobj__c>> parentTochildMapInserted ;
	 
	public void afterInsert(){
		
		parentId = new Set<Id>();
		parentTochildMapInserted = new Map<Id,List<childobj__c>>(); 
		childInserted = new List<childobj__c>();
		for(childobj__c obj : (List<childobj__c>)Trigger.new){
			parentId.add(obj.parent__r);
			
			if(parentTochildMapInserted.isEmpty() || !parentTochildMapInserted.containsKey(obj.parent__r)){
				List<childobj__c> childList = new List<childobj__c>();
				childList.add(obj);
				parentTochildMapInserted.put(obj.parent__r,childList);
			}
			else{
				List<childobj__c> childList = parentTochildMapInserted.get(obj.parent__r);
				childList.add(obj);
				parentTochildMapInserted.put(obj.parent__r,childList);
			}
		}
		
		if(!childInserted.isEmpty()){
			getrelatedRecords();
		}
	}
	
	public void getrelatedRecords(){
		
		List<Parentobj__c> parentList = [select id,broker1__c,broker2__c,broker3__c,(select id from childobj__r) from parentobj__c where id in : parentId];
		Map<Id,List<childobj__c>> mapParentTochild = new Map<Id,List<childobj__c>> ();
		for(Parentobj__c obj : parentList){
			List<childobj__c> childList = new List<childobj__c>();
			for(childobj__c child : obj.childobj__r){
				childList.add(child);
			}
			mapParentTochild.put(obj.id,child);
		}
		
		for(Id key : parentTochildMapInserted.keyset()){
			if(mapParentTochild.get(key).isEmpty()){
				sortandassignvalues();
			}
		}
	}
	
	public void sortandassignvalues(){
		
		List<Parentobj__c> parentListToUpdate = new List<Parentobj__c> ();
		for(List<childobj__c> childList: parentTochildMapInserted.values()){
			Map<String,Integer> splitvalue = new List<String,Integer>();
			for(childobj__c obj : childList){
				splitvalue.add(obj.brokerslpitvalue__c);
			}
			splitvalue.sort();
		}
	}*/
}