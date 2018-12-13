trigger updateclass on SubjectClass__c (after insert, after update, before insert, before update, before delete) {
	Triggerhandler.createhandler(SubjectClass__c.sObjectType);
}