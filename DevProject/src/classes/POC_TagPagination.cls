public with sharing class POC_TagPagination
{
    
    public List<POC_TaskWrapper> lstWrapper{get;set;}
    public transient List<POC_TaskWrapper> lstSetController{get;set;}
    public String strTaskStatus{set;get;}
    public Boolean showResult{set;get;}
    public String queryString;
    public List<Task> lstFieldset;
    CustomIterable obj;
    public Task tsk{set;get;}
    public transient Boolean ifNotCompleted{get; set;}
    public List<POC_TaskWrapper> wrapperList {get;set;}
    
    public Id Tid {get;set;}
    
    public POC_TagPagination(ApexPages.StandardController controller) {
        ifNotCompleted = true;
        this.tsk = new Task();
        wrapperList = new List<POC_TaskWrapper>();
        lstWrapper =  new List<POC_TaskWrapper>();
        lstSetController = new List<POC_TaskWrapper>();
        strTaskStatus = '';
        showResult = false;
        
        
        queryString = 'select id';
        for(Schema.FieldSetMember fld :SObjectType.Task.FieldSets.POC_TaskBulkClosure.getFields()) {
            queryString += ', ' + fld.getFieldPath();
        }
        queryString += ' from Task';   
    }         
    
    public POC_TagPagination() 
    {
        
    }
    
    public void Search(){
        
        System.Debug('##Task Status'+tsk.status);
        String query = queryString + ' where Status =  ' + '\'' + tsk.status +'\'' + ' AND Priority =  ' + '\'' + tsk.Priority +'\''+ ' AND Ownerid =  ' + '\'' + tsk.Ownerid +'\''+' LIMIT 500';
        //queryString += ' where Status =  ' + '\'' + tsk.status +'\'';
        system.debug('***queryStringinsidesearch'+query );
        List<Task> lstTask = Database.query(query);
        system.debug('***queryStringinsidesearch'+queryString);
        system.debug('***lstTask'+lstTask.size());
        system.debug('***lstTask'+lstTask);
        
        showResult = true;
        lstWrapper.clear();
        for(Task tt : lstTask )
        {
            lstWrapper.add(new POC_TaskWrapper(tt ,false));
        }
        lstSetController = lstWrapper;
        
        ifNotCompleted = true;
        if(tsk.status != 'Completed' && !lstSetController.isEmpty()){
            ifNotCompleted = false;
        }
        
    }
    
    public PageReference processSelected() {
        
        system.debug('wrapperList >>>>'+wrapperList );
        List<Task> selectedTasks = new List<Task>();
        system.debug('lstWrapper>>>'+lstWrapper);
        
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
    
    @RemoteAction
    public static List<Task> getResult(){
        return [SELECT id, Status, Subject FROM Task WHERE Status = 'In Progress'];
    }
}