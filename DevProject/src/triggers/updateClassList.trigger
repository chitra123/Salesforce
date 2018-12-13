trigger updateClassList on TeacherClass__c (after insert, before delete, before insert, before update) {
	TriggerHandler.createHandler(TeacherClass__c.sObjectType);
}