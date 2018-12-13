@isTest

public class TestData{
    public static void testWeb(){
    id cid = TestCont.newContact();
    Test.startTest();
    Contact Retrieved = wService.Details(cid);
    Test.stopTest();
    system.debug(Retrieved);
    system.assert(Retrieved!=null);
    }
}