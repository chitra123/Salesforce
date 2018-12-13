global class DataGridController{

    public static String queryString;
    public static List<Task> taskResultList;
    public static Task tsk {get; set;}
    public static Boolean showResult{get; set;}
    public static Boolean selectAll{get; set;}
    
    global DataGridController(){}
    global DataGridController(ApexPages.StandardController controller) {
        
        showResult = false;
        tsk = new Task();
        queryString = 'select id ';
        for(Schema.FieldSetMember fld :SObjectType.Task.FieldSets.devTest123__POC_TaskClosureResultFieldset.getFields()) {
            queryString += ', ' + fld.getFieldPath();
        }
        queryString += ' from Task';
    }
    
    @RemoteAction
    global static List<Object> queryList(String input, String sObjectName, String inputFieldsetName, String outputFieldsetName){
        
        queryString = 'select id ';
        
        for(Schema.FieldSetMember fld :Schema.getGlobalDescribe().get(sObjectName).getDescribe().fieldSets.getMap().get(outputFieldsetName).getFields()) {
            queryString += ', ' + fld.getFieldPath();
        }
        queryString += ' from '+ sObjectName;
        
        Map<String,Object> fieldNameByValue = new Map<String,Object>();
        fieldNameByValue = (Map<String,Object>)JSON.deserializeUntyped(input);

        String query = queryString + ' WHERE Status = ' + '\'In Progress\'' + ' AND ( ';
        for(Schema.FieldSetMember fld :Schema.getGlobalDescribe().get(sObjectName).getDescribe().fieldSets.getMap().get(inputFieldsetName).getFields()) {
            if(fieldNameByValue.get(fld.getFieldPath()) != null && fieldNameByValue.get(fld.getFieldPath()) != '' && fld.getFieldPath() != 'Status'){
                if(fld.getType() == Schema.DisplayType.DATE){
                    
                    query += fld.getFieldPath() + ' = ' + DateTime.newInstance( Date.parse((String)fieldNameByValue.get(fld.getFieldPath())) , Time.newInstance(0, 0, 0, 0)).format('yyyy-MM-dd') + ' AND ' ;
                }
                else if(fld.getType() == Schema.DisplayType.DATETIME){
                    query += fld.getFieldPath() + ' = ' + Datetime.valueOf(fieldNameByValue.get(fld.getFieldPath())).format('yyyy-MM-dd\'T\'hh:mm:ss\'Z\'') + ' AND ' ;
                }
                else if(fld.getFieldPath() == 'OwnerId'){
                    query += 'Owner.Name = ' + '\'' + fieldNameByValue.get(fld.getFieldPath()) + '\' AND ' ;
                }
                else if(fld.getType() == Schema.DisplayType.BOOLEAN){
                    query += fld.getFieldPath() + ' = ' + fieldNameByValue.get(fld.getFieldPath()) + ' AND ' ;
                }
                else{
                    query += fld.getFieldPath() + ' = ' + '\'' + fieldNameByValue.get(fld.getFieldPath()) + '\' AND ' ;
                }
            }
        }
        query = query.removeEnd(' AND ');
        query += ' ) ORDER BY ActivityDate asc ';
        List<Task> lstTask = Database.query(query);
        
        showResult = true;
        return lstTask;
    }
    
    @RemoteAction
    global static Map<Id,Task> processSelected(String taskIdsToClose) {
        
        Map<Id,Task> updatedTaskMap = new Map<Id,Task>();
        List<Task> updateTaskList = new List<Task>();
        if(taskIdsToClose != null){
            List<Object> idList = (List<Object>)JSON.deserializeUntyped(taskIdsToClose);
            system.debug('taskIdsToClose>>>'+idList);
            
            for(Object ids : idList){
               updateTaskList.add(new Task(Id = (String)ids, Status = 'Completed' )) ;
               updatedTaskMap.put((String)ids, new Task(Id = (String)ids, Status = 'Completed' ));
            }
            if(!updateTaskList.isEmpty()){
            	update updateTaskList;
            }
        }
        return updatedTaskMap;
    }
}