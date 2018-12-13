public with sharing class WS_FCACheck {
    String userName='cPooj01';
    String password='NKCQKD0041';
    /*public void getOrganization_WSDL(){
        Boolean authenticateResult; 
        sdmFsaRegisterWSStub.SdmFsaPlusWebServiceSoap fcaObj=new sdmFsaRegisterWSStub.SdmFsaPlusWebServiceSoap();
        authenticateResult=fcaObj.AuthenticateUser(userName,password);
        system.debug('Authentication result-----'+authenticateResult);
        //fcaObj.GetOrganisation(1000);
        //system.debug('Organizant Response-----'+fcaObj.GetOrganisation(integer.valueof('CREF09879')));
    }
    */
    public void getOrganization_Callout(){
         String FCA_Endpoint='https://www.sdm-fsa-register.co.uk';
        String TestResponse = '<Name>Chitra</Name>';         
         /*String TestResponse= '<GetOrganisationResponse >'+
         '<GetOrganisationResult>false</GetOrganisationResult></GetOrganisationResponse>';
        /*String Body = '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" '+
                       'xmlns:xsd="http://www.w3.org/2001/XMLSchema"'+
                       'xmlns:soap="http://www.w3.org/2003/05/soap-envelope">'+'<soap:Body>'+
                       '<AuthenticateUser xmlns="http://sdm-fsa-register.co.uk/">'+
                       '<userName>'+userName+'</userName>'+
                       '<password>'+password+'</password>'+
                       '</AuthenticateUser>'+'</soap:Body>'+
                       '</soap:Envelope>';
                       
        String Body = '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">'+
                      '<soap:Header>'+
                      '<AuthHeader xmlns="http://sdm-fsa-register.co.uk/">'+
                      '<UserName>'+userName+'</UserName>'+
                      '<Password>'+password+'</Password>'+
                      '</AuthHeader></soap:Header>'+
                      '<soap:Body><GetOrganisation xmlns="http://sdm-fsa-register.co.uk/">'+
                      '<reference>1000</reference></GetOrganisation></soap:Body></soap:Envelope>';
        HttpRequest Request=new HttpRequest();
        HttpResponse Response=new HttpResponse();
        Http http=new Http();
        SDM_EndPoint_Settings__c SDMSettings =SDM_EndPoint_Settings__c.getValues('EndPoint');
        Request.setEndpoint(SDMSettings.GetOrganizantEndPoint__c);
        Request.setMethod('POST'); 
        Request.setBody(Body);
        Response=http.send(Request);*/
        parseHttpResponseReceived(TestResponse);
        /*System.debug('Response Through Http Callout'+Response.getBody());*/
    }
    
    public void parseHttpResponseReceived(String TestResponse){
        Xmlstreamreader xmlReader=new Xmlstreamreader(TestResponse);
        While(xmlReader.hasNext()){
System.debug('-------'+xmlReader.getEventType());
            if(xmlReader.getEventType()==XmlTag.START_ELEMENT &&xmlreader.getLocalName()=='GetOrganisationResult'){
                                 xmlReader.next();
                     if(XmlReader.getEventType()==Xmltag.Characters){
                     String s=xmlreader.getText();
                     system.debug('Organizantion Value----'+s);
                     break;
                 }
           }
           
 xmlReader.next();        }
    }
}