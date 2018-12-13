trigger doctor on Contact (before update) {
    id did;
   /*for(Contact c:trigger.new){
        did=c.ownerid;        
    }*/
    List<Doctor__c> dlist = [SELECT id FROM Doctor__c];
    
    for(Contact c:trigger.new){
        //if(d!=null){
        for(Doctor__c d:dlist){
            if(d.ownerid==c.ownerid)
                c.doctor__c= d.id;
        }
        //}
    }
    
}