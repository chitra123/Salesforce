public class patient{

    public List<case> cs{get;set;}
    public List<Payment__c> pay{get;set;}
    public id cid{get;set;}
    public Patient(ApexPages.StandardController controller){
            cid = ApexPages.currentPage().getParameters().get('id');
            cs = [SELECT account.name,owner.name,casenumber,status,createddate from case where 
                       contactid=:cid order by createddate desc];
            pay = [SELECT name,Payment_Amount__c,Payment_Date__c,Status__c 
                        FROM payment__c where patient__c=:cid];
    }
    
}