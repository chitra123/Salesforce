public with sharing class InputPageController {

    public String userName{get;set;}
    public String password{get;set;}
    public String responseBody;
    public String access_token{get;set;}
    public String instance_url{get;set;}
    public List<String> accountNames{get;set;}
    public Boolean flag{get;set;}
    public String lname{get;set;}
    public Boolean success{get;set;}
    public Map<String,String> credentials;
    public Boolean section{get;set;}
    
    public  InputPageController(){
        accountNames= new List<String>();
        credentials = new Map<String,String>();
        section = false;
    }
    
    public void getRecords(){
        
        flag = true;
        accountNames.clear();
        QueryAccount();
        /*PageReference authRedirect = new PageReference('https://login.salesforce.com/services/oauth2/authorize?response_type=code' +
                '&client_id='+RestConstants.clientId + '&redirect_uri='+EncodingUtil.urlEncode('https://login.salesforce.com/apex/callBack','UTF-8'));
        authRedirect.setRedirect(true);
        //EncodingUtil.urlDecode('https://www.google.com', 'UTF-8')
        return authRedirect;*/
    }
    
    public void parseJson(){
        
        JSONParser parser = JSON.createParser(responseBody);
        while(parser.nextToken()!=null){
            if(parser.getCurrentToken() == JSONToken.VALUE_STRING){
                if(parser.getCurrentName()=='access_token'){
                access_token = parser.getText();
                system.debug('accesstoken>>>'+parser.getText());
                }
                
                if(parser.getCurrentName() == 'instance_url'){
                    instance_url = parser.getText();
                    system.debug('instance_url>>'+instance_url);
                }
            }
        }
        
        credentials = new Map<String,String>{'access_token'=>access_token,'instance_url'=>instance_url};
        system.debug('credentials>>>'+credentials);
    }
    
    public void QueryAccount(){
        
        system.debug('accesstoken>>>'+access_token);
        system.debug('instance_url>>'+instance_url);
        String Endpoint = instance_url+'/services/data/v20.0/query/?q=select+Name+,+id+from+Account+limit+10';
        
        Http h = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(Endpoint);
        //request.setBody(Body);
        request.setHeader('Authorization', 'Bearer '+ access_token);
        request.setMethod('GET');
        
        HttpResponse response= h.send(request);
        system.debug('response>>>'+response.getBody());
        responseBody = response.getBody();
        
        JSONParser parser = JSON.createParser(responseBody);
        
        while(parser.nextToken()!=null){
            
            if(parser.getCurrentToken()==JSONToken.VALUE_STRING && parser.getCurrentName() =='Name'){
                accountNames.add(parser.getText());
            }
        }
        
        system.debug('accountNames>>>'+accountNames);
    }
    
    public void insertAccount(){
        
        system.debug('accesstoken>>>'+access_token);
        system.debug('instance_url>>'+instance_url);
        if(success){
            Contact account = new Contact(LastName = lname);
            String acc = JSON.serialize(account);
            system.debug('acc>>>>'+acc);
            
            String Endpoint = instance_url + '/services/data/v20.0/sobjects/Contact/';
            
            Http h = new Http();
            
            HttpRequest request = new HttpRequest();
            request.setEndpoint(Endpoint);
            request.setBody(acc);
            request.setHeader('Authorization', 'Bearer '+ access_token);
            request.setMethod('POST');
            request.setHeader('Content-Type','application/json');
            
            HttpResponse response= h.send(request);
            system.debug('response>>>'+response.getBody());
            responseBody = response.getBody();
            
            if(response.getStatusCode()==201){
                ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.Info,'Contact Successfully Inserted'));
            }
            
            else{
                JSONParser parser = JSON.createParser(responseBody);    
                while(parser.nextToken()!=null){
                    if(parser.getCurrentToken()==JSONToken.VALUE_STRING && parser.getCurrentName()=='errorCode'){
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.error,parser.getText()));
                    }
                }
            }
        }
        
    }
    
    public void authenticateUser(){
        
        success = false;
        String Endpoint = RestConstants.url+'/services/oauth2/token';
        Http h = new Http();
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint(Endpoint);
        
        String Body = 'grant_type=password'+'&client_id='+RestConstants.clientId+
                      '&client_secret='+RestConstants.clientSecret+ '&username='+userName+'&password='+password;
        request.setHeader('Content-Type','application/x-www-form-urlencoded');   
        request.setBody(Body);
        request.setMethod('POST');
        
        HttpResponse response= h.send(request);
        system.debug('response>>>'+response.getBody());
        responseBody = response.getBody();
        
        if(response.getStatusCode()==200 || response.getStatus() == 'OK') {
            success = true;
        }
        else{
            ApexPages.addMessage(new ApexPages.Message(apexPages.severity.Error,'Invalid user name or Password'));
        }
        
        if(success){
            parseJson();
        }
    }
    
    public void renderSection(){
        section = true;
    }
}