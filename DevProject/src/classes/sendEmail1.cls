public class sendEmail1 {

    public String to { get; set; }
    public String fr { get; set; }
    public boolean flag{get;set;}
   
    String[] address = new String[]{'preetidubey.6@gmail.com'};
   
    public pageReference sendEmailTo(){ 
        flag=false;  
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();  
        EmailTemplate emailTemplate = [select Id, Subject, HtmlValue, Body from EmailTemplate where Id ='00X90000001NAdR']; 
   
        String htmlBody = emailTemplate.HtmlValue;
        htmlBody = htmlBody.replace('{!Contact.Name}',to);
        htmlBody = htmlBody.replace('{!Contact.OwnerFullName}',fr);
        email.setHtmlBody(htmlBody);   
        email.setToAddresses(address); 
  
   LIST<Messaging.SendEmailResult> result = Messaging.sendEmail(new Messaging.SingleEmailmessage[] {email});
   /*SendEmailResult[] results = binding.sendEmail(email);
      if (results[0].success)
      {
         Console.WriteLine("The email was sent successfully.");
      }
      else
      {
         Console.WriteLine("The email failed to send: "
               + results[0].errors[0].message);
      }   */return null;   
     
}
}