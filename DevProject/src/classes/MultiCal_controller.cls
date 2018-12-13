public with sharing class MultiCal_controller {
	
    @auraEnabled 
    public static Map<String,String> getPicklistValues(){
        
        Map<String,String> mapLoc = new Map<String,String>();
        for(User usr : [SELECT id, Name, City FROM User WHERE City != null] ){
            mapLoc.put(usr.City, usr.City);
        }
        system.debug('mapLoc>>'+mapLoc);
        return mapLoc;
    }
    
     @auraEnabled 
    public static List<sObject> getSearchResults(String likeQuery, String objectName, String fieldName, Integer limitResults){
        
        system.debug('likeQuery>>>'+likeQuery);
        system.debug('objectName>>>'+objectName);
        system.debug('fieldName>>>'+fieldName);
        system.debug('limitResults>>>'+limitResults);
        List<sObject> lstResults = new List<sObject>();
        
        //create a SOQL Query
        String query = 'SELECT Id, ' + fieldName +' FROM ' + objectName + ' WHERE ' + fieldName + ' LIKE \'%' + likeQuery + '%\' LIMIT ' + limitResults;
        system.debug('query>>>'+query);
        lstResults = Database.query(query);
        return lstResults;
    }
   /* 
    public Set<String> setTimeSpan {get; set;} //time interval displayed as header
    public Integer startHour = 7;
    public Event eventRec {get;set;}	
    public List<SelectOption> lstRole {get; set;}
    public List<SelectOption> lstLocation {get; set;}
    public InputWrapper inputWrapObj {get; set;}
   	public String message {get; set;}			//page message to be displayed
    public String accountId;				
    public String whatId {get; set;}			//to set attribute value in Component
    public String userEvent {get; set;}		
    public String users{get; set;}
    public String contactId;
    public Map<String,Event> userEventMap;
    public Date todayDate {get;set;}			//to set today's date
    public Boolean isPowerDialer {get; set;}	//to set attribute value in Component
    public Boolean flag{get; set;}				//to render calendar in page
    public Integer numOfSlots {get; set;}		//create slots in calendar
    public Account customerInfo{get; set;}		//customer account of opportunity 
    public Account accountPD{get; set;}			//to set attribute value in Component
    public Boolean changeTimezone{get; set;}	//flag to check if timezone is changed
    public Boolean isError{get; set;}			//flag if error occured
    public transient String jsonTimeSpanDisp {get; set;}
    public String timezone;
    public String custTimezone;*/
    
    /**
     * @author  Chitra Poojari
     * @date March 22, 2016
     * @return None
     * @description Constructor to initialize parameter values
    */ 
    public MultiCal_controller(){
    	/*
    	isError = false;
    	flag = false;
    	userEvent = '';
    	users = '';
    	jsonTimeSpanDisp = '';
    	timezone = 'America/Phoenix';
    	setTimeSpan = new Set<String>();
    	//setTimeSpanDisp = new Set<String>();
    	createTimeMap();
    	createPicklistValue();
    	inputWrapObj = new InputWrapper();
    	inputWrapObj.dateInput = system.Today();
    	todayDate = system.Today();
    	eventRec = new Event();
		getCustomerInfo();
		changeTimezone = false;*/
    }
    /*
    public void setVal(){
    	changeTimezone = true;
    }
    
    public void getAllUsersAndEvents(){
		
		flag = false;
		userEvent = '';
    	users = '';/*
		if(accountPD != null && accountPD.TA_AC_TimeZone__c != null && accountPD.TA_AC_TimeZone__c != ''){
			if(changeTimezone){
				Account accountToUpdate = new Account(Id = accountPD.Id, TA_AC_TimeZone__c = accountPD.TA_AC_TimeZone__c);
				Database.saveResult saveResult = Database.update(accountToUpdate,Boolean.valueOf(Label.TA_AC_DMLAllorNoneFlag));
				logErrorMessage(saveResult, 'Updating account from Calendar', 'TA_AC_MultiCalendar_Controller.getAllUsersAndEvents');
				changeTimezone = false;
			}
			String zone = accountPD.TA_AC_TimeZone__c.substringBetween('(',')');
			if(zone != null){
				timezone = zone;
			}
		}
		InputWrapper wrapObj = inputWrapObj;
		
		if(customerInfo != null && custTimezone != customerInfo.TA_AC_TimeZone__c && customerInfo.TA_AC_TimeZone__c != ''){
			Account accountToUpdate = new Account(Id = customerInfo.Id, TA_AC_TimeZone__c = customerInfo.TA_AC_TimeZone__c);
			Database.saveResult saveResult = Database.update(accountToUpdate,Boolean.valueOf(Label.TA_AC_DMLAllorNoneFlag));
			LOG_LogMessageUtility.databaseSaveResult(saveResult, 'Updating account from Calendar', 'TA_AC_MultiCalendar_Controller.getAllUsersAndEvents');
			
			 if(customerInfo.TA_AC_TimeZone__c.substringBetween('(',')') != null){
				timezone = customerInfo.TA_AC_TimeZone__c.substringBetween('(',')');
			 }
			 custTimezone = customerInfo.TA_AC_TimeZone__c;
		}
		
		DateTime dt = DateTime.newInstance(wrapObj.dateInput,Time.newInstance(0,0,0,0));
		
    	ResultWrapper resWrapper = new ResultWrapper();
		
		if(wrapObj != null){
			
			if(wrapObj.dateInput < system.today()){
				ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error,Label.TA_AC_CalendarFutureDate));
			}
			
			else{
				String userQuery = 'SELECT id, UserRole.Name, Name, City FROM User WHERE UserRoleId != null AND City != null ';
				if(wrapObj.role != null && wrapObj.role != '' && wrapObj.role != TA_AC_GlobalConstants.STR_DEF_VAL){
					userQuery+= ' AND UserRoleId = \'' + wrapObj.Role + '\'';
				}
				if(wrapObj.location != null && wrapObj.location != '' && wrapObj.location != TA_AC_GlobalConstants.STR_DEF_VAL){
					userQuery+= ' AND City = \'' + wrapObj.Location + '\'';
				}
			
				userQuery+=  TA_AC_GlobalConstants.STR_ORDER_BY + TA_AC_GlobalConstants.STR_FIELD_NAME + TA_AC_GlobalConstants.STR_SORT_ORDER_DESC + TA_AC_GlobalConstants.STR_LIMIT;
				List<User> lstUserRec = Database.query(userQuery);
				
				
		    	if(lstUserRec != null && !lstUserRec.isEmpty()){
		    		users = JSON.serialize(lstUserRec);
		    		List<Event> lstEvent = new List<Event>();
					Map<String,Event> userEventMap = new Map<String,Event>();
		    		List<Id> lstOwnerId = new List<Id>();
		    		
		    		for(User userRec : lstUserRec){
		    			lstOwnerId.add(userRec.Id);
		    		}
		    		
		    		String query = 'Select Id, Subject, StartDateTime, EndDateTime,IsAllDayEvent, DurationInMinutes, OwnerId From Event WHERE IsArchived = false AND IsDeleted = false AND OwnerID IN :lstOwnerId ';
					if(wrapObj.dateInput != null){
						query+= ' AND startdatetime >= ' + dt.format(TA_AC_GlobalConstants.STR_DTTIMEHR,timezone) +' AND enddatetime <= ' + dt.addDays(1).format(TA_AC_GlobalConstants.STR_DTTIMEHR,timezone);
					}
					query+=  TA_AC_GlobalConstants.STR_LIMIT;
					lstEvent = Database.query(query);
					
					if(lstEvent != null && !lstEvent.isEmpty()){
						userEventMap = createUserMap(lstEvent,timezone);
						userEvent = JSON.serialize(userEventMap);
		    		}
		    		flag = true;
		    		
	    		}
	    		else{
	    			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error,Label.TA_AC_CalendarNoUserMsg));
	    		}
			}
		}else{
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error,'Invalid Input'));
		}
    }
    
    public Integer calculateTime(Event eventRec, String timezone){
    	
    	Integer timeDay;
    	String timezoneStartDateFormat;
    	String timezoneEndDateFormat;
    	Map<String,Integer> timeDayEvent = createTimeMap();  
    	DateTime eventStartDateTime = eventRec.StartDateTime;
    	Integer addMinutes = 0;
    	/*
    	if(eventStartDateTime.minute() > 0 && eventStartDateTime.minute() < 30){
    		addMinutes = (0-eventStartDateTime.minute());
    	}
    	else if(eventStartDateTime.minute() > 30){
    		addMinutes = (30-eventStartDateTime.minute());
    	}
    	eventStartDateTime = eventStartDateTime.addMinutes(addMinutes);
		if(timezone != null && timezone != ''){
			timezoneStartDateFormat = eventStartDateTime.format(TA_AC_GlobalConstants.STR_DTTIMEFRMT,timezone).split(' ')[1];
			timezoneEndDateFormat = eventRec.EndDateTime.format(TA_AC_GlobalConstants.STR_DTTIMEFRMT,timezone).split(' ')[1];
		}
		else{
			timezoneStartDateFormat = eventStartDateTime.format(TA_AC_GlobalConstants.STR_DTTIMEFRMT).split(' ')[1];
			timezoneEndDateFormat = eventRec.EndDateTime.format(TA_AC_GlobalConstants.STR_DTTIMEFRMT).split(' ')[1];
		}
		
		if(timeDayEvent.containsKey(timezoneStartDateFormat)){
			timeDay = timeDayEvent.get(timezoneStartDateFormat);
		}
		else{
			List<String> startDate = timezoneStartDateFormat.split(':');
			List<String> endDate = timezoneEndDateFormat.split(':');
			if(Integer.valueOf(startDate[0]) < startHour && Integer.valueOf(endDate[0]) > startHour){
				timeDay = ((Integer.valueOf(startDate[0])- startHour)*60 - (Integer.valueOf(startDate[1])-0))/30;
			}
		}
		return timeDay;
    }
    
    public Map<String,Integer> createTimeMap(){
    	Set<String> setTimeSpanDisp = new Set<String>();
    	Time startTime = Time.newInstance(7,0,0,0);
    	Time endTime = Time.newInstance(19,30,0,0);
    	Integer duration = 30;
    	/*Map<String,TA_AC_MultiUserCalendar__c> calendarSettings = TA_AC_MultiUserCalendar__c.getall();
		if(!calendarSettings.isEmpty()){
			for(TA_AC_MultiUserCalendar__c setting : calendarSettings.values()){
				if(Setting.Name == 'StartTime' && setting.TA_AC_Values__c != '' && setting.TA_AC_Values__c != null){
					List<String> lstStartTime = setting.TA_AC_Values__c.split(':');
					startHour = Integer.valueOf(lstStartTime[0]);
					startTime = Time.newInstance(Integer.valueOf(lstStartTime[0]),Integer.valueOf(lstStartTime[1]),0,0);
				}
				if(Setting.Name == 'EndTime' && setting.TA_AC_Values__c != '' && setting.TA_AC_Values__c != null){
					List<String> lstEndTime = setting.TA_AC_Values__c.split(':');
					endTime = Time.newInstance(Integer.valueOf(lstEndTime[0]),Integer.valueOf(lstEndTime[1]),0,0);
				}
				if(Setting.Name == 'Duration_in_minutes' && setting.TA_AC_Values__c != '' && setting.TA_AC_Values__c != null){
					duration = Integer.valueOf(setting.TA_AC_Values__c);
				}
			}
		}
    	DateTime startDt = DateTime.newInstanceGMT(system.today(),startTime);
    	DateTime endDt = DateTime.newInstanceGMT(system.today(),endTime);
    	
    	Integer numOfIntervals = Integer.valueOf((endDt.getTime() - startDt.getTime())/(1000*60*duration));
    	numOfSlots = numOfIntervals;
    	Map<String,Integer> timeDayMap = new Map<String,Integer>(); 
    	for(Integer i = 0 ; i <= numOfIntervals ; i++){
    		Time getTime = startTime.addMinutes(i*duration);
    		setTimeSpan.add(startDt.addMinutes(i*duration).formatGMt('h:mm a'));
			timeDayMap.put(getTime.hour() + ':' + getTime.minute(),i);
    	}
    	setTimeSpanDisp.addAll(setTimeSpan);
    	setTimeSpanDisp.add(startDt.addMinutes(setTimeSpan.size()*duration).formatGMt('h:mm a'));
    	jsonTimeSpanDisp = JSON.serialize(setTimeSpanDisp);
    	system.debug('setTimeSpanDisp>>>'+setTimeSpanDisp);
    	return timeDayMap;
    }

    public void createAppointment(){
    	
    	isError = false;
    	/*
    	if(eventRec != null && eventRec != new Event() ){

    		eventRec.DurationInMinutes = Integer.valueOf((eventRec.EndDateTime.getTime()-eventRec.StartDateTime.getTime())/(1000*60));
    		DateTime dtTimeZoneFrmt = DateTime.valueOf(eventRec.StartDateTime.format('yyyy-MM-dd HH:mm:ss',timezone));
			eventRec.StartDateTime = eventRec.StartDateTime.addMinutes(((eventRec.StartDateTime.getTime() - dtTimeZoneFrmt.getTime())/(1000*60)).intValue());
			eventRec.EndDateTime = eventRec.StartDateTime.addMinutes(eventRec.DurationInMinutes);
	    	if(whatId == null || whatId == ''){
	    		whatId = ApexPages.currentPage().getParameters().get('objId');
	    	}
    		if(whatId != null && whatId != ''){
    			eventRec.WhatId = whatId;
    		}
    		if(contactId != '' && contactId != null){
    			eventRec.WhoId = contactId;
    		}
    		else if(accountPD != null && accountPD.PersonContactId != null){
				contactId = accountPD.PersonContactId;
				eventRec.WhoId = contactId;
			}
			
    		if(inputWrapObj.location != null && inputWrapObj.location != TA_AC_GlobalConstants.STR_DEF_VAL){
    			eventRec.location = inputWrapObj.location;
    		}
			
			Database.saveResult saveResult = Database.Insert(eventRec,Boolean.valueOf(Label.TA_AC_DMLAllorNoneFlag));
            logErrorMessage(saveResult, 'Inserting appointment from Calendar','TA_AC_MultiCalendar_Controller.createAppointment');
	        
            Map<String,Event> userEventMap = new Map<String,Event>();
            if(userEvent != null && userEvent != ''){
            	userEventMap = (Map<String,Event>)JSON.deserialize(userEvent,Map<String,Event>.class); 
            }
            if(saveResult.isSuccess()){
            	userEventMap.putAll(createUserMap(new List<Event>{eventRec},timezone));
            	if(userEventMap != null && !userEventMap.isEmpty()){  
            		userEvent = JSON.serialize(userEventMap);
            	}
            }
    	}
    	eventRec = new Event();
    }
    
	public void createPicklistValue(){
		
		lstRole = new List<SelectOption>();
		lstLocation = new List<SelectOption>();
		
		List<String> lstRoleNames = new List<String>();
		List<String> lstCity = new List<String>();
		/*
		Map<String,TA_AC_MultiUserCalendar__c> calendarSettings = TA_AC_MultiUserCalendar__c.getall();
		if(!calendarSettings.isEmpty()){
			for(TA_AC_MultiUserCalendar__c setting : calendarSettings.values()){
				if(setting.Name == 'Location' && setting.TA_AC_Values__c != '' && setting.TA_AC_Values__c != null){
					lstCity = setting.TA_AC_Values__c.split(';');
				}
				if(setting.Name =='Role' && setting.TA_AC_Values__c != '' && setting.TA_AC_Values__c != null){
					lstRoleNames = setting.TA_AC_Values__c.split(';');
				}
			}
		}
		lstLocation.add(new SelectOption(TA_AC_GlobalConstants.STR_DEF_VAL,TA_AC_GlobalConstants.STR_DEF_VAL));
		for(AggregateResult usr : [SELECT City From User Where  City != null AND City NOT IN : lstCity group BY city]){
    		lstLocation.add(new SelectOption((String)usr.get('City'),(String)usr.get('City')));
    	}
    	for(UserRole role : [SELECT id, Name FROM UserRole WHERE Name NOT IN : lstRoleNames LIMIT 50000]){
    		lstRole.add(new SelectOption(role.Id, role.Name));
    	} 
		
	}
	
	public Map<String,Event> createUserMap(List<Event> lstEvent, String timezone){
		Map<String,Event> userEventMap = new Map<String,Event>();
		for(Event event : lstEvent){
			Integer timeDay = calculateTime(event, timezone);
			Integer diff = 	event.DurationInMinutes/30 + Math.mod(event.DurationInMinutes,30);
			if(timeDay != null){
				for(Integer i = 0 ; i < (event.DurationInMinutes + Math.mod(event.DurationInMinutes,30))/30; i++){
				if( i >= 0 ){
					String colSpan = event.OwnerId + '-' + timeDay;
					userEventMap.put(colSpan,event);
				}
				timeDay += 1;
				}
			}
		}
		return userEventMap;
	}
	
	public void getCustomerInfo(){
		/*
		accountId = ApexPages.currentPage().getParameters().get('accId');
		if(accountId != null && accountId != ''){
			List<Account> lstAccount = [SELECT id, Name,devTest123__TA_AC_TimeZone__c FROM Account WHERE Id = :accountId];
			if(!lstAccount.isEmpty()){
				customerInfo = lstAccount[0];
				/*if(customerInfo.PersonContactId != null){
					contactId = customerInfo.PersonContactId;
				}*//*
				if(customerInfo.devTest123__TA_AC_TimeZone__c != null && customerInfo.devTest123__TA_AC_TimeZone__c != ''){
					String zone = customerInfo.devTest123__TA_AC_TimeZone__c.substringBetween('(',')'); 
					if(zone != null){
						timezone = zone;
					}
				}
				custTimezone = customerInfo.devTest123__TA_AC_TimeZone__c;
			}
			
		}
	}
	
	public void setPageMessage(){
		ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error,message));
	}
	
	public void logErrorMessage(Database.SaveResult saveResult, String message, String sourceFunction){
		/*
		if (!saveResult.isSuccess()){
			isError = true;
            String statCodeMessage ='';                                    
            for(Database.Error err : saveResult.getErrors()){
                statCodeMessage += (err.getStatusCode()+ '-' + err.getMessage() +' ');
                
            }
            LOG_LogMessageUtility.logMessage(LOG_LogMessageUtility.LOG_LogLevel.Error, message, sourceFunction, statCodeMessage, '',True);       
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error,statCodeMessage));	            						                          	
        }
	
	}
	
    public class InputWrapper{
    	
    	public String role{get; set;}
    	public String location {get;set;}
    	public Date dateInput {get; set;}	
    	
    }
    
    public class ResultWrapper{
    	public Object Data;
    	public String message;
    	public Boolean Success;
    	
    	public ResultWrapper(){
    		
    	}
    }*/
}