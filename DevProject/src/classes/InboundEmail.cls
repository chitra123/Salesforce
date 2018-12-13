global class InboundEmail implements Messaging.InboundEmailHandler{
	
	global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, Messaging.InboundEnvelope env){
    	
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        
        List<Contact> existingContact = new List<Contact>();
        String fromName = email.fromName;
        String EmailId =  email.fromAddress;
        system.debug('fromName>>'+fromName);
        system.debug('EmailId>>>'+EmailId);
        try{
        	existingContact  = [Select id,Name from Contact where Email = :EmailId or Name = :fromName];
        	result.success = true;
        }
        
        catch(Exception e){
        	system.debug('No records found');
        	result.success = false;
        }
        
        if(existingContact.isEmpty()){
        	
        		Contact createNew = new Contact(LastName = fromName,Email=EmailId);
        		insert createNew;
        		result.success = true;
        	
        }                     
        
        return result;                           	
	}
}