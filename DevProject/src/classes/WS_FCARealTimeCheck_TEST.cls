@isTest

public with sharing class WS_FCARealTimeCheck_TEST {
    
    public static testmethod void getOrganization_Callout_Test(){
        WS_FCACheck fcaObj = new WS_FCACheck();
        fcaObj.getOrganization_Callout();
        
    }
}