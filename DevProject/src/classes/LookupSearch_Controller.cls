public class LookupSearch_Controller {
	
    public LookupSearch_Controller(){
        
    }
    
    @auraEnabled 
    public static List<sObject> getSearchResults(String likeQuery, String objectName, String fieldName, Integer limitResults){
        
        system.debug('likeQuery>>>'+likeQuery);
        system.debug('objectName>>>'+objectName);
        system.debug('fieldName>>>'+fieldName);
        system.debug('limitResults>>>'+limitResults);
        
        List<String> lstFields = fieldName.split(';');
        List<sObject> lstResults = new List<sObject>();
        
        //create a SOQL Query
        String query = 'SELECT Id, ';// + fieldName +
        String whereClause = '';
        for(String name : lstFields){
            String trimmed = name.trim();
            query += trimmed + ', ';
            whereClause += trimmed + ' LIKE \'%' + likeQuery + '%\' OR ';
        }
        whereClause = whereClause.removeEnd(' OR ');
        query = query.removeEnd(', ');
        query += ' FROM ' + objectName;
        
        query += ' WHERE ' + whereClause;
        query +=  ' LIMIT ' + limitResults;
        
        system.debug('query>>>'+query);
        lstResults = Database.query(query);
        return lstResults;
    }
}