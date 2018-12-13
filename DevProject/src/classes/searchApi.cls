public with sharing class searchApi {
	public static String getContent(){
		Http h = new Http();
		
		HttpRequest req = new HttpRequest();
		req.setEndpoint('https://www.google.co.in/webhp');
    	req.setMethod('GET');
    	
    	req.setHeader('Charset', 'UTF-8');
		req.setHeader('Content-Length', '512');
		req.setHeader('Content-Type', 'text/plain');
    	String headerValue = 'Apple';
    	
    	Blob head = blob.valueOf(headerValue);
    	
    	String value = EncodingUtil.base64Encode(head);
		req.setHeader('q', value);
		// Send the request, and return a response		
		system.debug('req>>>>>'+req.toString());
		system.debug('rererer>>>>'+req.getEndpoint());
		system.debug('req.getHeader(q)>>>'+req.getHeader('q'));
    	HttpResponse res = h.send(req);
    	
    	//system.debug('response>>>>'+res.getBody());
    	return res.getBody();
	}
}