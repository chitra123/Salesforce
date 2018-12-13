@isTest

public with sharing class WS_FCARealTimeCh_TEST {
    
     @isTest static void getOrganization_Callout_Test(){
        WS_FCACheck fcaObj = new WS_FCACheck();
        Test.setMock(WebServiceMock.class,new WS_FCARealTimeCheck_MockResponse());
        WS_FCARealTimeCheck.getOrganization_WSDL();
    }
}