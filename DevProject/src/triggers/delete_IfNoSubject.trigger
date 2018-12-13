trigger delete_IfNoSubject on Teacher__c (after insert,before update) {
    Triggerhandler.createhandler(Teacher__c.sObjectType);
}