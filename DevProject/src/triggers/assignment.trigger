trigger assignment on Payment__c (before update,before insert){
    List<Contact> ct = [SELECT id,ownerid from contact];
        for(Payment__c p:trigger.new){             
                for(Contact c:ct){
                    if(c.id==p.patient__c)
                        p.ownerid=c.ownerid;
                 }          
        }   
}
    /*id oid;
    for(Payment__c p:trigger.new){
        oid = p.id;
    }
    Payment__c pay = [SELECT p.patient__r.ownerid from payment__c p where id=:oid];

    for(Payment__c p :trigger.new){
        if(oid!=null){
            p.ownerid=pay.patient__r.ownerid;}
    }
    }*/