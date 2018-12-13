public with sharing class TH_sendConfirmationEmail {
    public static void sendEmail(Map<Id,devTest123__Session_Speaker__c> triggerMap){
        
        List<devTest123__Session_Speaker__c> speakerList = [SELECT id, devTest123__Speaker__r.devTest123__First_Name__c, devTest123__Speaker__r.devTest123__Last_Name__c, 
                                                       devTest123__Session__r.devTest123__Session_Date__c, devTest123__Speaker__r.devTest123__Email__c  FROM devTest123__Session_Speaker__c WHERE ID IN : triggerMap.keySet()];
        for(devTest123__Session_Speaker__c spkr : speakerList){
            if(spkr.devTest123__Speaker__r.devTest123__Email__c != null && spkr.devTest123__Speaker__r.devTest123__Email__c!= ''){
                String address = spkr.devTest123__Speaker__r.devTest123__Email__c;
                String subject = 'Speaker Confirmation';
                String body = 'Dear ' + spkr.devTest123__Speaker__r.devTest123__First_Name__c + ' ' + spkr.devTest123__Speaker__r.devTest123__Last_Name__c + 
                    			'Your Session is confirmed on '+ spkr.devTest123__Session__r.devTest123__Session_Date__c;
                EmailManager.sendEmail(address, subject, body);
            }
		
        }
    }
    
    public static void verifyDoubleBooking(List<devTest123__Session_Speaker__c> newTriggerList){
    	
        List<Id> sessionID = new List<ID>();
        List<Id> speakerID = new List<Id>();
        Map<Id,DateTime> sessionIDByDateTimeMap = new Map<Id,DateTime>();
        Map<ID,List<ID>> speakerIDBySessionIdMap = new Map<ID,List<ID>>();
        
        for(devTest123__Session_Speaker__c speaker : newTriggerList){
            List<ID> sessionIdList = new List<Id>();
            sessionID.add(speaker.devTest123__Session__c);
            speakerID.add(speaker.devTest123__Speaker__c);
            if(speakerIDBySessionIdMap.containsKey(speaker.devTest123__Speaker__c)){
                sessionIdList = speakerIDBySessionIdMap.get(speaker.devTest123__Speaker__c);
            }
            sessionIdList.add(speaker.devTest123__Session__c);
            speakerIDBySessionIdMap.put(speaker.devTest123__Speaker__c, sessionIdList);
        }
        
        List<devTest123__Session__c> sessionList = [SELECT id,devTest123__Session_Date__c FROM devTest123__Session__c WHERE ID IN : sessionID];
        for(devTest123__Session__c session : sessionList){
            sessionIDByDateTimeMap.put(session.id, session.devTest123__Session_Date__c);
        }
        List<devTest123__Session_Speaker__c> sessionSpeakerList = [SELECT id, devTest123__Speaker__r.devTest123__First_Name__c, devTest123__Speaker__r.devTest123__Last_Name__c, 
                                                       devTest123__Session__r.devTest123__Session_Date__c, devTest123__Speaker__r.devTest123__Email__c  FROM devTest123__Session_Speaker__c WHERE devTest123__Speaker__c IN :speakerID];
        
        for(devTest123__Session_Speaker__c speaker: sessionSpeakerList){
            if(speakerIDBySessionIdMap.containsKey(speaker.devTest123__Speaker__c)){
            }
        }
    }
	 
}