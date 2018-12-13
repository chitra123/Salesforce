public with sharing class POC_TaskClosure {
   
    public Id Tid;
    CustomIterable obj;
    public String queryString;
    public String strTaskStatus;
    public List<String> fieldList;
    public List<POC_TaskWrapper> lstWrapper;
	public Map<String, List<POC_TaskWrapper>> sortedFieldByListMap;
    public List<POC_TaskWrapper> lstSetController{get;set;}
    public Boolean showResult{set;get;}
    public List<Task> lstFieldset{get;set;}
    public Task tsk{set;get;}
    public Boolean selectAll {get;set;}
    public Boolean upArrow {get; set; }
    public String sortByFieldValue{get;set;}
    public Boolean ifNotCompleted{get; set;}
    public Integer pageNumber {get; set;}
    public Integer totalPages {get; set;}
    
    public POC_TaskClosure(ApexPages.StandardController controller) {
        
        pageNumber = 0;
        strTaskStatus = '';
        showResult = false;
        this.tsk = new Task();
        fieldList = new List<String>();
        lstWrapper =  new List<POC_TaskWrapper>();
        lstSetController = new List<POC_TaskWrapper>();
        sortedFieldByListMap = new Map<String, List<POC_TaskWrapper>>();
        
        queryString = 'select id ';
        for(Schema.FieldSetMember fld :SObjectType.Task.FieldSets.devTest123__POC_TaskClosureResultFieldset.getFields()) {
            queryString += ', ' + fld.getFieldPath();
            fieldList.add(fld.getFieldPath());
        }
        queryString += ' from Task';
    }         
    
    public POC_TaskClosure(){
        pageNumber = 0;
    }
    
    public void Search(){
        upArrow = true;
        sortByFieldValue = 'ActivityDate';
        selectAll = false;
        pageNumber = 0;
        System.Debug('##Task Status'+tsk.status);
        Date activitydt = tsk.activityDate;
        system.debug('activitydt>>>'+activitydt);
       	
        String query = queryString + ' WHERE Status = ' + '\'' + tsk.status + '\'' + ' AND ( ';
        for(Schema.FieldSetMember fld :SObjectType.Task.FieldSets.devTest123__POC_TaskBulkClosure.getFields()) {
            if(tsk.get(fld.getFieldPath()) != null && tsk.get(fld.getFieldPath()) != '' && fld.getFieldPath() != 'Status'){
                if(fld.getType() == Schema.DisplayType.DATE){
                    query += fld.getFieldPath() + ' = ' + DateTime.newInstance( (Date)tsk.get(fld.getFieldPath()) , Time.newInstance(0, 0, 0, 0)).format('yyyy-MM-dd') + ' AND ' ;
                }
                else if(fld.getType() == Schema.DisplayType.DATETIME){
                    query += fld.getFieldPath() + ' = ' + Datetime.valueOf(tsk.get(fld.getFieldPath())).format('yyyy-MM-dd\'T\'hh:mm:ss\'Z\'') + ' AND ' ;
                }
                else{
               		query += fld.getFieldPath() + ' = ' + '\'' + tsk.get(fld.getFieldPath()) + '\' AND ' ;
                }
                
            }
        }
        query = query.removeEnd(' AND ');
        query += ' )  ORDER BY ActivityDate asc';
        system.debug('query1>>>'+query);
        /*String query = queryString + ' where Status =  ' + '\'' + tsk.status +'\'' + ' AND Priority =  ' + '\'' + tsk.Priority +'\''+ ' AND Ownerid =  ' 
            					+ '\'' + tsk.Ownerid +'\'' ;
        if(tsk.ActivityDate != null){
            query+= ' AND ActivityDate =  ' + DateTime.newInstance(tsk.ActivityDate, Time.newInstance(0, 0, 0, 0)).format('yyyy-MM-dd');
            					 
        }
        query+= ' ORDER BY ActivityDate asc';*/
        List<Task> lstTask = Database.query(query);
        
        showResult = true;
        lstWrapper.clear();
        for(Task tt : lstTask )
        {
            lstWrapper.add(new POC_TaskWrapper(tt ,false));
        }
        
        if(!lstWrapper.isEmpty()){
            Decimal total = lstWrapper.size()/50.0;
            totalPages = (Integer)total.round(System.RoundingMode.CEILING);
        }
        
        obj = new CustomIterable (lstWrapper); 
        obj.setPageSize = 50;
        obj.pageNumber = 0;
        obj.totalPages = totalPages;
        next();
        
        ifNotCompleted = true;
        if(lstSetController.isEmpty()){
           showResult = false;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Info,'No records returned for this search criteria')); 
        }
        if(tsk.status != 'Completed' && !lstSetController.isEmpty()){
            ifNotCompleted = false;
        }
        
        
        system.debug('lstWrapper.size()>>'+lstWrapper.size()+'den>>' + totalPages);
        //sortRecords(fieldList);
    }
    
    public PageReference processSelected() {
        
        List<Task> selectedTasks = new List<Task>();
        selectAll = false;
        for(POC_TaskWrapper cTsk: lstWrapper) {
            if(cTsk.isSelected == true) {
                selectedTasks.add(cTsk.cont);
            }
        }
        
        System.debug('These are the selected Tasks...');
        for(Task Tsk: selectedTasks) {
            Tsk.Status = 'Completed';
            system.debug(Tsk);
        }
        Update selectedTasks;
        
        //remove selected checkbox
        for(POC_TaskWrapper cTsk : lstSetController){
            cTsk.isSelected = false;
        }
        
        for(POC_TaskWrapper cTsk : lstWrapper){
            cTsk.isSelected = false;
        }
        return null;
    }
    
    public Boolean hasNext {
        get 
        {
            return obj.hasNext();
        }
        set;
    }
    
    public Boolean hasPrevious {
        get 
        {
            return obj.hasPrevious();
        }
        set;
    }
    
    public void next() 
    {	
        selectAll = false;
        obj.pageNumber = pageNumber;
        lstSetController = obj.next();
        pageNumber += 1;
    }
    
    public void previous() 
    {	
        obj.pageNumber = pageNumber;
        lstSetController = obj.previous();
        pageNumber -= 1;
    }
    
    public void getPageRecord(){
        
        Integer startIndex;
        Integer stopIndex;
        
        lstSetController.clear();
        if(pageNumber > totalPages ){
            pageNumber = totalPages;
        }
        else if(pageNumber < = 0){
            pageNumber = 1;
        }
        startIndex = (pageNumber-1)* 50;
        stopIndex = (pageNumber*50) > lstWrapper.size() ? lstWrapper.size() : pageNumber*50;
        
        for(Integer i = startIndex; i < stopIndex ; i++){
            lstSetController.add(lstWrapper[i]);
        }
        obj.i = pageNumber * obj.setPageSize;
        hasNext = obj.hasNext();
        hasPrevious = obj.hasPrevious();
    }
    
    public void sortRecords(){
        POC_TaskWrapper.sortByFieldValue = sortByFieldValue;
        POC_TaskWrapper.sortOrder = upArrow;
        upArrow = !upArrow;
       	lstWrapper.sort();
        pageNumber = 0;
        obj = new CustomIterable (lstWrapper); 
        obj.setPageSize = 50;
        next();
    }
    
    public void sortRecords(List<String> fieldList){
        
        for(String field : fieldList){
            if(field != 'AssignedTo' ||  field != 'Status'){
                POC_TaskWrapper.sortByFieldValue = field;
                POC_TaskWrapper.sortOrder = true;
                lstWrapper.sort();
                sortedFieldByListMap.put(field, lstWrapper);
            }
        }
    }
    
	public void sortTasks(){
        if(sortedFieldByListMap.containsKey(sortByFieldValue)){
            upArrow = !upArrow;
            obj = new CustomIterable (sortedFieldByListMap.get(sortByFieldValue)); 
            obj.setPageSize = 50;
            next();
        }
    }
    
}