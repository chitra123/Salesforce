trigger TR_SendEmail on devTest123__Session_Speaker__c (before insert, after insert) {
    if(Trigger.isAfter && Trigger.isInsert){
        TH_sendConfirmationEmail.sendEmail(Trigger.newMap);
    }
    if(Trigger.isBefore && Trigger.isInsert){
        TH_sendConfirmationEmail.verifyDoubleBooking(Trigger.new);
    }
	
}