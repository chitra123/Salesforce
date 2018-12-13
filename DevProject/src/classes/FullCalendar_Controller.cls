public with sharing class FullCalendar_Controller {

    public Boolean includeMyEvents {get;set;}

    public list<calEvent> events {get;set;}
    public static list<calEvent> eventList {get;set;}
    public static List<groupResource> groupList {get; set;}
    
    Map<Id,String> lstAvailableGroup = new Map<Id,String>();
    public String Groups {get;set;}

    //The calendar plugin is expecting dates is a certain format. We can use this string to get it formated correctly
    String dtFormat = 'EEE, d MMM yyyy HH:mm:ss z';

    //constructor
    public FullCalendar_Controller() {

        //Default showing my events to on
        includeMyEvents = true;

    }

    public PageReference pageLoad() {

        //Get my Events if we have selected the correct option
        List<Id> lstGroupId = new List<Id>();
    	for(GroupMember member : [Select id , GroupId, Group.Name, UserOrGroupId from GroupMember where UserOrGroupId = :UserInfo.getUserId()]){
    		lstGroupId.add(member.GroupID);
    		lstAvailableGroup.put(member.GroupID,member.Group.Name);
    	}
    	if(lstGroupId != null && !lstGroupId.isEmpty()){
			createEvents(new List<Id>{lstGroupId[0]});
    	}
    	return null;
    }
	   
    public List<SelectOption> getItems(){
        List<SelectOption> options = new List<SelectOption>();
        for (ID grpId : lstAvailableGroup.keyset()){
            
            options.add(new SelectOption(grpId,lstAvailableGroup.get(grpId)));
        }
        return options;
    }

        
       /*  public String[] getGroups() {
        return Groups;
         }
        public void setGroups(String[] countries) {

        this.Groups = Groups;
    }*/
      

    public PageReference toggleMyEvents() {

        if(includeMyEvents){

            includeMyEvents = false;

        }

        else{

            includeMyEvents = true;

        }

        pageload();

        return null;

    }

    public void usersOfGroup(){
    
        createEvents(new List<Id>{groups});
    }
	
	
	public void createEvents(List<ID> lstGroupID){
		
		groupList = new List<groupResource>();
		events = new list<calEvent>(); 
		Map<Id,List<String>> mapUserByGroupLst = new Map<Id,List<String>>();
    	
		List<Id> lstUserId = new List<Id>();
		List<GroupMember> lstGroupMember = [Select id , Group.Name, UserOrGroupId from GroupMember where groupId IN :lstGroupID];
		for(GroupMember member : lstGroupMember){
			lstUserId.add(member.UserOrGroupId);
		}
		Map<Id,User> mapIDByUser = new Map<Id,User>([SELECT id, Name FROM User WHERE Id IN :lstUserId]);
    	for(GroupMember member : lstGroupMember){
    		List<String> lstGroup = new List<String>();
    		if(mapUserByGroupLst.containsKey(member.UserOrGroupId)){
    			lstGroup = mapUserByGroupLst.get(member.UserOrGroupId);
    		}
    		lstGroup.add(member.UserOrGroupId +':' + member.GroupID);
    		mapUserByGroupLst.put(member.UserOrGroupId,lstGroup);
    		groupList.add(new groupResource(member.UserOrGroupId + ':' + member.GroupID, 
    										mapIDByUser.containsKey(member.UserOrGroupId)? mapIDByUser.get(member.UserOrGroupId).Name : member.UserOrGroupId, 
    										member.Group.Name, 'green'));
    	}
        for(Event evnt: [select Id, Owner.Name, Subject, isAllDayEvent, StartDateTime, EndDateTime from Event where OwnerID IN :lstUserId]){
			
			if(mapUserByGroupLst.containsKey(evnt.OwnerID)){
				
				for(String idKey : mapUserByGroupLst.get(evnt.OwnerID)){
					
	                DateTime startDT = evnt.StartDateTime;
	
	                DateTime endDT = evnt.EndDateTime;
	
	                calEvent myEvent = new calEvent();
	
	                myEvent.title = evnt.Subject;
	
	                myEvent.allDay = evnt.isAllDayEvent;
	
	                myEvent.startString = startDT.format(dtFormat);
	
	                myEvent.endString = endDT.format(dtFormat);
	
	                myEvent.url = '/' + evnt.Id;
	
	                myEvent.className = 'event-personal';
	                
	                myEvent.advisor = evnt.Owner.Name;
	                
	                myEvent.resourceId = idKey;
	
	                events.add(myEvent);
				}
			}
        }
		
	}

    //Class to hold calendar event data

    public class calEvent{

        public String title {get;set;}

        public Boolean allDay {get;set;}

        public String startString {get;private set;}

        public String endString {get;private set;}

        public String url {get;set;}

        public String className {get;set;}
        
        public String advisor {get;set;}
        
        public String resourceId {get; set;}

    }
    
    //Class to hold group data

    public class groupResource{

        public String Id {get;set;}
		public String groupMemberName {get; set;}
		public String groupName {get;set;}
		public String eventColor {get; set;}
		
		
		public groupResource(String Id, String groupMemberName, String groupName, String eventColor){
			this.Id = Id;
			this.groupMemberName = groupMemberName;
			this.groupName = groupName;
			this.eventColor = eventColor;
		}
       
    }

}