public class DonationController {
	
    @auraEnabled
    public static void insertRecord(devTest123__Donation__c donationRec){
        
        if(donationRec != null){
            try{
                insert donationRec;
            }
            catch(Exception ex){
                
            }
        }
    }
    
    @AuraEnabled
    public static Decimal getTotalDonationAmt(){
        
        Decimal totalAmt = 0.0;
        try{
            AggregateResult[] aggrResults = [SELECT SUM(devTest123__Amount__c)total FROM devTest123__Donation__c];
            totalAmt = Integer.valueOf(aggrResults[0].get('total'));
        }catch(Exception ex){
            
        }
        return totalAmt;
    }
    
    @AuraEnabled
    public static List<devTest123__Donation__c> getTopDonorList(){
        
        List<devTest123__Donation__c> lstRecs = [SELECT id, devTest123__Amount__c, devTest123__Donation_Date__c, devTest123__Donor_Name__c, devTest123__Note__c 
                                                 FROM devTest123__Donation__c ORDER BY devTest123__Amount__c desc LIMIT 5];
        
        return lstRecs;
    }
}