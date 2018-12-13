trigger updateContact on Account (before update) {
    List<Id> Ids = new List<Id>();
    Map<Id,String> mapAccPh = new Map<Id,String>();
    for(Account a:trigger.new){
        mapAccPh.put(a.id,a.phone);
    }
    List<List<Contact>> updateCont = new List<List<Contact>>();
    List<Account>AccList  = new List<Account>();
    List<Contact> cList = new List<Contact>();
    AccList = [select id,(select id,phone,Name,accountId from contacts),phone from account where id in :mapAccPh.keyset()];
    
    for(Account a : AccList){  
        for(Contact c:a.contacts){
            c.phone= a.phone;
            cList.add(c);
        }   
    }
    
    system.debug('updateCont.size()>>>'+cList);
    for(Contact c: cList){
        c.phone  = mapAccPh.get(c.AccountId);
    }
    update cList;
    system.debug('cList>>>'+cList);
}