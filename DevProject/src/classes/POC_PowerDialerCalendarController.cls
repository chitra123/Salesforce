public class POC_PowerDialerCalendarController {
	
    public POC_PowerDialerCalendarController(){
        
    }
    
    @RemoteAction
    public static Result getAllGroups(){
        
        Result result = new Result();
        
        List<Group> groupList = [SELECT id, DeveloperName FROM Group LIMIT 50000];
        if(!groupList.isEmpty()){
            result.Data = groupList;
            result.Message = 'Success';
        }
        return result;
    }
     
    @RemoteAction
    public static Result getAdvisorsOfGroups(String jsonGroupName){
        
        Result result = new Result();
        Map<String,Object> groupMap = (Map<String,Object>)JSON.deserializeUntyped(jsonGroupName);
        List<User> groupMemberList = [SELECT Id, Name FROM User WHERE Id IN (SELECT UserOrGroupId 
                                                                         FROM GroupMember WHERE GroupId = :(String)groupMap.get('Id'))];
        if(!groupMemberList.isEmpty()){
            result.Data = groupMemberList;
            result.Message = 'Success';
        }
        return result;
    }
    
    @RemoteAction
    public static Result createEvent(Criteria criteriaFields){
        Result result = new Result();
        system.debug('criteriaFields>>'+criteriaFields);
        return result;
    }
        
    public class Result{
        public Object Data;
        public String Message;
        
        public Result(){
            
        }
    }
    
    public class Criteria{
        
        public String scheduleDate;
        public String fromTime;
        public String toTime;
        public String GroupName;
        public String AdvisorName;
        
        public Criteria(){
            
        }
    }
}