public with sharing class callBack {
	
	public String code{get;set;}
	public String responseBody;
	public String access_token;
	public String instance_url;
	
	public callBack(){
		code = ApexPages.currentPage().getParameters().get('code');
		
		String Endpoint = 'https://login.salesforce.com/services/oauth2/token';
		Http h = new Http();
		
		HttpRequest request = new HttpRequest();
		request.setEndpoint(Endpoint);
		
		String Body = 'code='+code+'&grant_type=authorization_code'+'&client_id='+RestConstants.clientId+
					  '&client_secret='+RestConstants.clientSecret+'&redirect_uri='+EncodingUtil.urlEncode('https://login.salesforce.com/apex/callBack','UTF-8');
	 	request.setHeader('Content-Type','application/x-www-form-urlencoded');   
	 	request.setBody(Body);
		request.setMethod('POST');
		
	    HttpResponse response= h.send(request);
    	system.debug('response>>>'+response.getBody());
    	responseBody = response.getBody();
    	parseJson();
    	QueryAccount();
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
	}
	
	public void QueryAccount(){
		
		String Endpoint = instance_url+'/services/data/v20.0/query/?q=select+Name+from+Account+limit+10';
		
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
    		system.debug('currenttoken'+parser.getCurrentToken());
    		system.debug('currentname'+parser.getCurrentName());
    		system.debug('text'+parser.getText());
    		
    	}
	}
}