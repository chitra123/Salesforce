public class LightningTrainingController {
	
    @AuraEnabled
    public static List<String> getAllVals(){
        
        List<String> lstStr = new List<String>();
        for(Integer i = 0; i <1000; i++){
            lstStr.add('test'+i);
        }
        return lstStr;
    }
}