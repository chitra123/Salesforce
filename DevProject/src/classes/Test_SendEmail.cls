public class Test_SendEmail {

    public String stringFromAPI{get;set;}
    public static String strMsg{get;set;}
    
    public Test_SendEmail(){
        stringFromAPI = '';
    }
    
    public void sendNotification(){
        stringFromAPI = 'Test Message';
        strMsg = stringFromAPI;
        
        PageReference pref = Page.Test_ContentPage;
        Blob blb = pref.getContentAsPDF();
        
        system.debug('blb>>'+blb);
        system.debug('stringFromAPI>>'+stringFromAPI);
        system.debug('strMsg>>'+strMsg);
    }
    /*
    public PageReference sendNotificationRecieved(String strObjectRecordId, String strTemplateName, String strTargetObjectId, String strEmailTemplateName)
    {
        
        //String inRecId = '02i3500000052oF';
        //String templateName = 'Generated_Asset';
        String templateName = strTemplateName;
        String inRecId = strObjectRecordId;
        
        
        somestring = strTemplateName;
        //PageReference nextPage = new PageReference('/apex/LACE_LicensePDFAsAttachment');
        
        stringFromAPI = DGEN_MergeManager.mergeAndReturnBody(inRecId, templateName);
        
        testmail test = new testmail();
        test.stringFromAPI = stringFromAPI;
        //System.debug('stringFromAPI------- '+stringFromAPI);
        
        //Blob blobValue = Blob.ValueOf(stringFromAPI);
        //Blob pdfValue = Blob.toPDF(stringFromAPI);
        PageReference nextPage = new PageReference('/apex/LACE_LicensePDFAsAttachment');
        
        Blob b = nextPage.getContent();
        System.debug('b------- '+b.size());
        
        sendEmailWithAttachment(b, inRecId, strTargetObjectId, strEmailTemplateName);
        nextPage.setRedirect(false);
        return nextPage;
        
    }
    
    public void sendEmailWithAttachment(Blob b, String inRecId, String strTargetObjectId, String strEmailTemplateName)
    {
        //Blob b = pdf.getContent();
        EmailTemplate templateId = [Select id from EmailTemplate where name =: strEmailTemplateName];
        System.debug('blob value is b------- '+b);
        //Id recId = '00535000000J74V';
        Id recId = strTargetObjectId;
        
        // Create the email attachment
        Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
        efa.setFileName('attachment.pdf');
        efa.setBody(b);
        
        list <Messaging.SingleEmailMessage> mails = new List < Messaging.SingleEmailMessage > ();
        Messaging.SingleEmailMessage email;
        //String sBody = '<html><body><p>Hi, this is a test mail</p></body></html>';
        email = new Messaging.SingleEmailMessage();
        email.setTargetObjectId(recId);
        email.setSaveAsActivity(false);
        email.setWhatId(inRecId);
        email.setTemplateID(templateId.Id); 
        email.setFileAttachments(new Messaging.EmailFileAttachment[] {efa});
        //email.setHtmlBody(sBody);
        //email.setSubject('Dealer has submitted protest application!');
        mails.add(email);
        
        Messaging.sendEmail(mails);
    }
    
    
    
    
    
    public static void sendEmailToContact(map <id, Application__c > mapNewApplication , map <id, Application__c>mapOldApplication, map<id,Application__c> mapIdAppData)
    {
        
        System.debug('inside sendEmailToContact');
        System.debug('mapNewApplication------- '+mapNewApplication);
        LIST<String> emailids = new LIST<String>();
        LIST<Deficiency__c>listDeficiency = new LIST<Deficiency__c>();
        List<Messaging.SingleEmailMessage> allmsg = new List<Messaging.SingleEmailMessage>();
        
        
        
        for(Application__c oAppId : mapNewApplication.Values())
        {
            if(mapIdAppData.containsKey(oAppId.id))
            {
                Application__c applRecord = mapIdAppData.get(oAppId.id);
                emailids.add(applRecord.License_Contact_Email_2__c);
            }
        }
        
        MAP<id, Contact> mapContact = new MAP<id, Contact>([select id, Email from Contact where Email in: emailids]);
        EmailTemplate templateId = [Select id from EmailTemplate where name = 'LACE Email Summary'];
        
        for(Application__c objAppId : mapNewApplication.Values())
        {
            System.debug('objAppId---- '+objAppId);
            Application__c oldApp = mapOldApplication.get(objAppId.id);
            
            if((oldApp.Application_Status__c != 'Received' && objAppId.Application_Status__c == 'Received') && (oldApp.Payment_Status__c != 'Payment Confirmed' && objAppId.Payment_Status__c == 'Payment Confirmed'))
            {
                if(mapIdAppData.containsKey(objAppId.id))
                {
                    System.debug('inside if---- ');
                    Application__c applicationRecord = mapIdAppData.get(objAppId.id);
                    listDeficiency = applicationRecord.Deficiencies__r;
                    
                    System.debug('listDeficiency---- '+listDeficiency);
                    
                    if(listDeficiency <> null && listDeficiency.size()>0)
                    {
                        for(Deficiency__c objDef : listDeficiency)
                        {
                            if(objDef.Status__c <> 'Resolved')
                            {
                                
                                for(Contact objContact : mapContact.values())
                                {
                                    if(objContact.Email == applicationRecord.License_Contact_Email_2__c)
                                    {
                                        System.debug('inside-------- '+objContact.Email);
                                        
                                        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                                        mail.setTemplateID(templateId.Id); 
                                        mail.setTargetObjectId(objContact.id);
                                        mail.setWhatId(applicationRecord.id);
                                        mail.setSaveAsActivity(false);
                                        allmsg.add(mail);
                                        
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        if(allmsg <> null && allmsg.size()>0)
            callSingleEmail(allmsg);
    }
    
    public static void callSingleEmail(List<Messaging.SingleEmailMessage> allmsg)
    {
        System.debug('inside future');
       
        Messaging.sendEmail(allmsg);
    }
    */
}