public class CustHeaderController {
	
    @AuraEnabled
    public static Account getAccount(String accountId){
        return [SELECT id, Name FROM Account WHERE Id = :accountId];
    }
}