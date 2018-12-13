public with sharing class EmailManager {
    public static void sendEmail(String address, String subject, String body){
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        List<String> toAdresses = new List<String>{address};
        email.setToAddresses(toAdresses);
        email.setSubject(subject);
        email.setPlainTextBody(body);
        Messaging.sendEmail(new List<Messaging.SingleEmailMessage> {email});
    }
		
}