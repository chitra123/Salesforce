public class WS_FCARealTimeCheck {
    
    static String userName='cPooj01';
    static String password='NKCQKD0041';
    
    public static void getOrganization_WSDL(){
        Boolean authenticateResult; 
        sdmFsaRegisterWSStub.SdmFsaPlusWebServiceSoap wsdlObj=new sdmFsaRegisterWSStub.SdmFsaPlusWebServiceSoap();
        //authenticateResult=wsdlObj.AuthenticateUser(userName,password);
        //system.debug('Authentication result-----'+authenticateResult);
        
          sdmFsaRegisterWSStub.AuthHeader auth = new sdmFsaRegisterWSStub.AuthHeader(); 
        auth.UserName = userName;
        auth.Password = password;
        wsdlObj.AuthHeader = auth;    
    
        sdmFsaRegisterWSStub.GetOrganisationResult_element  aa=wsdlObj.GetOrganisation(1000);
        system.debug('Organizant Response-----'+aa);
    }
}