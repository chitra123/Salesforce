global class POC_TaskWrapper implements Comparable{
    
    public Boolean isSelected {get;set;}
    public Task cont{get;set;} 
    public static String sortByFieldValue;
    public static Boolean sortOrder;
    
    public POC_TaskWrapper(Task cont,Boolean isSelected)
    {
        this.cont= cont;
        this.isSelected= isSelected;
    }
    
    // Compare Tasks based on the field
    global Integer compareTo(Object compareTo) {
        // Cast argument to OpportunityWrapper
        POC_TaskWrapper compareToTask = (POC_TaskWrapper)compareTo;
        
        // The return value of 0 indicates that both elements are equal.
        Integer returnValue = 0;
        
        if(sortOrder){
            if (String.valueOf(cont.get(sortByFieldValue)) < String.valueOf(compareToTask.cont.get(sortByFieldValue))) {
                // Set return value to a positive value.
                returnValue = 1;
            } else if (String.valueOf(cont.get(sortByFieldValue)) > String.valueOf(compareToTask.cont.get(sortByFieldValue))) {
                // Set return value to a negative value.
                returnValue = -1;
            }
        }
        else{
            if (String.valueOf(cont.get(sortByFieldValue)) > String.valueOf(compareToTask.cont.get(sortByFieldValue))) {
                // Set return value to a positive value.
                returnValue = 1;
            } else if (String.valueOf(cont.get(sortByFieldValue)) < String.valueOf(compareToTask.cont.get(sortByFieldValue))) {
                // Set return value to a negative value.
                returnValue = -1;
            }
        }
        
        return returnValue;       
    }
    
}