public with sharing class VFC_Sampling {
    
    public List<Registration__c> allRegistrationList{get;set;}
    public List<Registration__c> sampledRegList{get;set;}
    public Map<Id,List<Registration__c>> ownerRegMap;
    public Set<Id> ownerId;
    Map<Id,Integer> ownercountMap;
    public Integer countRec;
    
    public VFC_Sampling(){
        
        ownerRegMap = new Map<Id,List<Registration__c>>();
        ownercountMap = new Map<Id,Integer>();
        allRegistrationList = [select Id,Name,Owner.Name,OwnerId from Registration__c order by Owner.Name];
        ownerId = new Set<Id>();
        
    }
    
    public Integer getRandomNumbers(Integer Num){
        
        Integer rand = Math.round(Math.random()*(Num));
        Integer numbers =Math.mod(rand,Num);
        return numbers;
        
    }
    public void createSamples(){
        
        sampledRegList = new List<Registration__c>();
        List<AggregateResult> ownerCount = [SELECT count(id) total,ownerid owner FROM Registration__c group by ownerid];
        for(AggregateResult RegRec : ownerCount){
            for (Integer i =0; i< 2; i++){
                
                Integer data1 = Integer.valueOf(String.valueOf(RegRec.get('total')));   
                countRec = data1;
                Integer numbers = getRandomNumbers(data1);
                //getRandomRecord(String.valueOf(RegRec.get('owner')), numbers);
                getRandomRec(String.valueOf(RegRec.get('owner')), numbers);
            }
        
        }
        
        List<Team_Leader_Sample__c> teamLeaderList = new List<Team_Leader_Sample__c>();     
        if(!sampledRegList.isEmpty() && sampledRegList!= null){
            for(Registration__c lreg : sampledRegList){
                teamLeaderList.add(new Team_Leader_Sample__c(Name = lreg.Owner.Name +' : '+ lreg.Name,Registration__c = lreg.id));
            }
        }
        
        try{
            Database.insert(teamLeaderList);
        }
        catch(Exception e){
            system.debug(e.getMessage());
        }
    }
    
    /*
    public void getRandomRecord(Id owner, Integer randomNum){
        
        Registration__c registrationRec = [select id,owner.Name, OwnerId, Name from Registration__c where OwnerId = :owner limit 1 offset :randomNum];
        system.debug('registrationRec>>>'+registrationRec);
        sampledRegList.add(registrationRec);
    }
    */
    
    public void createOwnerRegMap(){
        
        for(Registration__c lreg : allRegistrationList){
            if(ownerRegMap.containsKey(lreg.OwnerId)){
                List<Registration__c> regList = ownerRegMap.get(lreg.OwnerId);
                regList.add(lreg);
            }
            else{
                List<Registration__c> regList = new List<Registration__c>(); 
                regList.add(lreg);
                ownerRegMap.put(lreg.OwnerId,regList);              
            }
        }
        
    }
    public void getRandomRec(Id owner, Integer randomNum){
        
        createOwnerRegMap();
        List<Registration__c> RegList = ownerRegMap.get(owner);
        checkDuplicateAndAdd(randomNum,RegList);
        
    }
    
    public void checkDuplicateAndAdd(Integer randNum, List<Registration__c> regList){
        
        Boolean isEqual = false;
        system.debug('In methodduplicate>>');
        for(Registration__c lreg : sampledRegList){
            if(lreg == RegList[randNum]){
                isEqual = true;
                break;
            }
        }
        system.debug('countRec>>>'+countRec);
        if(isEqual){
            system.debug('equalrecmethod>');
            checkDuplicateAndAdd(getRandomNumbers(countRec),regList);
        }
        else{
            sampledRegList.add(regList[randNum]);
        }
        
    }
    

}