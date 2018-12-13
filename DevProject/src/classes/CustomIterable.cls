global class  CustomIterable implements Iterator<list<POC_TaskWrapper>>
{ 
    list<POC_TaskWrapper> InnerList;
    list<POC_TaskWrapper> ListRequested;
    public Integer i; 
    public Integer setPageSize;
	public Integer pageNumber;
    public Integer totalPages;
    
    public CustomIterable(List<POC_TaskWrapper> lstAccWr)
    {
        InnerList = new list<POC_TaskWrapper >(); 
        ListRequested = new list<POC_TaskWrapper >();  
        pageNumber = 0;
        InnerList = lstAccWr;
        setPageSize = 10;
        i = 0; 
    }   
    
    global boolean hasNext(){ 
        system.debug('i>>'+i);
        system.debug('InnerList.size()>>>'+InnerList.size());
        if(i >= InnerList.size()) {
            return false; 
        } else {
            return true; 
        }
    } 
    
    global boolean hasPrevious(){ 
        system.debug('I am in hasPrevious' + i);
        if(i <= setPageSize) {
            return false; 
        } else {
            return true; 
        }
    }   
    
    global list<POC_TaskWrapper > next(){       
        system.debug('i value is ' + i);
        ListRequested = new list<POC_TaskWrapper >(); 
        integer size = InnerList.size();
        Integer startNumber;
        //i = taskClosureObj.pageNumber * setPageSize;
        if(hasNext())
        {  /*
            if(size <= (i + setPageSize))
            {
                startNumber = i;
                i = size;
            }
            else
            {
                i = (i + setPageSize);
                startNumber = (i - setPageSize);
            }*/
            system.debug('taskClosureObj.pageNumber>>>'+pageNumber);
            i = pageNumber * setPageSize;
            if(size <= (i + setPageSize)){	
                startNumber = i;
                i = size;
                
            }
            else{
                i = pageNumber * setPageSize + setPageSize;
                startNumber = (i - setPageSize);
            }
            system.debug('i value is =====' + i);
            system.debug('i value is 2==== ' + (i - setPageSize));
            system.debug('startNumber>>>'+startNumber);
            
            for(integer start = startNumber; start < i; start++)
            {
                ListRequested.add(InnerList[start]);
            }
        } 
        return ListRequested;
    } 
    
    global list<POC_TaskWrapper > previous(){      
        ListRequested = new list<POC_TaskWrapper >(); 
        system.debug('i value is previous before =====' + i);
        integer size = InnerList.size(); 
        i = pageNumber * setPageSize;
        if(i == size)
        {
            if(math.mod(size, setPageSize) > 0)
            {    
                i = size - math.mod(size, setPageSize);
            }
            else
            {
                i = (size - setPageSize);
            } 
        }
        else
        {
            i = (i - setPageSize);
        }
        
        system.debug('i value is previous =====' + i);
        system.debug('i value is 2previous ==== ' + (i - setPageSize));
        
        for(integer start = (i - setPageSize); start < i; ++start)
        {
            ListRequested.add(InnerList[start]);
        } 
        return ListRequested;
    }   
}