trigger owner on Case (before insert,before update) {
    for(case c:trigger.new){
       if(c.contactId!=null){           
               List<User> uList = [SELECT id from user where id=:c.ownerId];
               if(!uList.isEmpty()){
                   contact c1 = [SELECT id from contact where id=:c.contactId];
                   c1.ownerid = c.ownerid;
                   update c1;
               }
        }
    }
}