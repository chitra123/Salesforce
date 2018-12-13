public class deleteContact{
    public void getRecords(){
        List<Contact> contactList = new List<Contact>();
        List<Contact> delContList = new List<Contact>();
                
        contactList = [select id,name from contact where name Like 'Patient%'];
        delContList = [select (select status,ownerId,whoId from OpenActivities) from contact where name Like 'Patient%']; 
        
        List<Id> whoIdList = new List<Id>();
        
        /*if(!delContList.isEmpty()){
            for(contact c:delContList){
                for(OpenActivities a : c)
                    whoIdList.add(a.whoId);
                
            }
        }*/
    }
}