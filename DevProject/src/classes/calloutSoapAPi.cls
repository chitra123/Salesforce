public with sharing class calloutSoapAPi {
    /*
    public static String sessionId;
    
    @future(callout = true)
    public static void login(String userName, String password){
        
        Boolean isError = false;
        String responseBody;
        HttpRequest request = new HttpRequest();
        Http http = new Http();
        HttpResponse response = new HttpResponse();

        String Body = '<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/"><Header/>'+
        '<Body><login xmlns="urn:partner.soap.sforce.com"><username>' +userName + '</username><password>' + password+'</password></login></Body></Envelope>';
        /*String Body = '<?xml version="1.0" encoding="utf-8"?>'+
        '<soapenv:Envelope xmlns:soapenv="<a href="http://schemas.xmlsoap.org/soap/envelope/" class="external free" title="http://schemas.xmlsoap.org/soap/envelope/" rel="nofollow">http://schemas.xmlsoap.org/soap/envelope/</a>"'+
            'xmlns:urn="urn:enterprise.soap.sforce.com">'+
              '<soapenv:Body>'+
                '<urn:login>'+
                  '<urn:username>'+userName+'</urn:username>'+
                  '<urn:password>'+password+'</urn:password>'+
                '</urn:login>'+
              '</soapenv:Body>'+
            '</soapenv:Envelope>';*//*
        
        request.setEndpoint('https://www.salesforce.com/services/Soap/u/27.0');
        request.setBody(Body);
        request.setMethod('POST');
        request.setHeader('SOAPAction', '""');
        request.setHeader('Content-Type', 'text/xml;charset=UTF-8');
        
        try{
            response = http.send(request);
            responseBody = response.getBody();
            system.debug('response>>>>'+response.getBody());
        }       
        catch(Exception e){
            isError = true;
            system.debug('CalloutError>>>'+e);
            system.debug('response>>'+response.toString());
        }
        if(!isError){
            parseXML(responseBody);
        }
    }
    
    public static void parseXML(String xml){
        
        Xmlstreamreader reader = new Xmlstreamreader(xml);
        
        while(reader.hasNext()){
            
            if(reader.getEventType()==XmlTag.START_ELEMENT && reader.getLocalName()=='sessionId'){
                reader.next();
                if(reader.getEventType()==XmlTag.CHARACTERS){
                    sessionId = reader.getText();
                }
            }
        } 
        system.debug('sessionId>>>'+sessionId);
    }
    */
}