public with sharing class InputPageControllerRest {
	
	public PageReference getRecords(){
    	
        PageReference authRedirect = new PageReference('https://login.salesforce.com/services/oauth2/authenticate?response_type=code' +
                '&client_id='+RestConstants.clientId + '&redirect_uri='+EncodingUtil.urlEncode('https://login.salesforce.com/apex/callBack','UTF-8'));
        authRedirect.setRedirect(true);
        //EncodingUtil.urlDecode('https://www.google.com', 'UTF-8')
        return authRedirect;
    }
}