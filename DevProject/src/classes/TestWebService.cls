@RestResource(urlmapping = '/RestExample/*')

global with sharing class TestWebService {
	
	@HttpGet
	global static Account doGet(){
		
		RestRequest req = RestContext.request;
		RestResponse res= RestContext.response;
		String acccountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
		system.debug('acccountId>>'+acccountId);
		Account a = [select id from Account where id = :acccountId];
		return a;
	}
	
	@HttpPost
	global static String insertNew(String Name, String sla, Date expdate, String num){
		
		Account accountTest = new Account();
		accountTest.Name = Name;
		accountTest.SLAExpirationDate__c = expdate;
		accountTest.SLASerialNumber__c = num;
		accountTest.SLA__c = sla;
		insert accountTest;
		
		return accountTest.id;
	}
	
	@HttpDelete
	global static Boolean deleteAcc(){
		
		RestRequest req = RestContext.request;
		RestResponse res= RestContext.response;
		String acccountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
		Account a = [select id from Account where Name = : acccountId];
		
		delete a;
		
		return true;
	}
	
	@HttpPatch
	global static String updateAcc(String Name){
		
		RestRequest req = RestContext.request;
		RestResponse res= RestContext.response;
		String acccountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
		
		Account a = [select Name from Account where id = :acccountId];
		a.Name = Name;
		
		update a;
		
		return a.id;
	}
}