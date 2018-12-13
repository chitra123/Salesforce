//Generated by wsdl2apex

public class sdmFsaRegisterWSStub {
    public class DataFile {
        public Integer DirectoryID;
        public String FullPath;
        public String Contents;
        private String[] DirectoryID_type_info = new String[]{'DirectoryID','http://sdm-fsa-register.co.uk/',null,'1','1','false'};
        private String[] FullPath_type_info = new String[]{'FullPath','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] Contents_type_info = new String[]{'Contents','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'DirectoryID','FullPath','Contents'};
    }
    public class GetOrganisationResult_element {
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{};
    }
    public class Search_x {
        public Boolean WatchList;
        public String Reference;
        public String Name;
        private String[] WatchList_type_info = new String[]{'WatchList','http://sdm-fsa-register.co.uk/',null,'1','1','false'};
        private String[] Reference_type_info = new String[]{'Reference','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] Name_type_info = new String[]{'Name','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'WatchList','Reference','Name'};
    }
    public class GetPersonAuthStatuses_element {
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{};
    }
    public class AuthenticateUserResponse_element {
        public Boolean AuthenticateUserResult;
        private String[] AuthenticateUserResult_type_info = new String[]{'AuthenticateUserResult','http://sdm-fsa-register.co.uk/',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'AuthenticateUserResult'};
    }
    public class GetAppointeeRelationships_element {
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{};
    }
    public class GetPersonAuthStatusesResponse_element {
        public sdmFsaRegisterWSStub.ArrayOfString GetPersonAuthStatusesResult;
        private String[] GetPersonAuthStatusesResult_type_info = new String[]{'GetPersonAuthStatusesResult','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'GetPersonAuthStatusesResult'};
    }
    public class GetIndividualFunctions_element {
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{};
    }
    public class GetOrganisationAuthStatuses_element {
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{};
    }
    public class GetIndividualResult_element {
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{};
    }
    public class DownloadFileResponse_element {
        public sdmFsaRegisterWSStub.DataFile DownloadFileResult;
        private String[] DownloadFileResult_type_info = new String[]{'DownloadFileResult','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'DownloadFileResult'};
    }
    public class GetIndividualResponse_element {
        public sdmFsaRegisterWSStub.GetIndividualResult_element GetIndividualResult;
        private String[] GetIndividualResult_type_info = new String[]{'GetIndividualResult','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'GetIndividualResult'};
    }
    public class GetRegulatedActivitiesResponse_element {
        public sdmFsaRegisterWSStub.ArrayOfString GetRegulatedActivitiesResult;
        private String[] GetRegulatedActivitiesResult_type_info = new String[]{'GetRegulatedActivitiesResult','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'GetRegulatedActivitiesResult'};
    }
    public class FileBase {
        public Integer ID;
        public String Name;
        public Long Size;
        public DateTime Created;
        public DateTime Modified;
        public Integer UserID;
        public String UserName;
        private String[] ID_type_info = new String[]{'ID','http://sdm-fsa-register.co.uk/',null,'1','1','false'};
        private String[] Name_type_info = new String[]{'Name','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] Size_type_info = new String[]{'Size','http://sdm-fsa-register.co.uk/',null,'1','1','false'};
        private String[] Created_type_info = new String[]{'Created','http://sdm-fsa-register.co.uk/',null,'1','1','false'};
        private String[] Modified_type_info = new String[]{'Modified','http://sdm-fsa-register.co.uk/',null,'1','1','false'};
        private String[] UserID_type_info = new String[]{'UserID','http://sdm-fsa-register.co.uk/',null,'1','1','false'};
        private String[] UserName_type_info = new String[]{'UserName','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'ID','Name','Size','Created','Modified','UserID','UserName'};
    }
    public class GetOrganisationResponse_element {
        public sdmFsaRegisterWSStub.GetOrganisationResult_element GetOrganisationResult;
        private String[] GetOrganisationResult_type_info = new String[]{'GetOrganisationResult','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'GetOrganisationResult'};
    }
    public class SearchIndividualsResult_element {
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{};
    }
    public class GetAppointeeRelationshipsResponse_element {
        public sdmFsaRegisterWSStub.ArrayOfPairOfStringString GetAppointeeRelationshipsResult;
        private String[] GetAppointeeRelationshipsResult_type_info = new String[]{'GetAppointeeRelationshipsResult','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'GetAppointeeRelationshipsResult'};
    }
    public class AuthHeader {
        public String UserName;
        public String Password;
        private String[] UserName_type_info = new String[]{'UserName','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] Password_type_info = new String[]{'Password','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'UserName','Password'};
    }
    public class GetRegulatedActivities_element {
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{};
    }
    public class SearchIndividualsResponse_element {
        public sdmFsaRegisterWSStub.SearchIndividualsResult_element SearchIndividualsResult;
        private String[] SearchIndividualsResult_type_info = new String[]{'SearchIndividualsResult','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'SearchIndividualsResult'};
    }
    public class GetIndividual_element {
        public String reference;
        private String[] reference_type_info = new String[]{'reference','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'reference'};
    }
    public class GetOrganisationAuthStatusesResponse_element {
        public sdmFsaRegisterWSStub.ArrayOfString GetOrganisationAuthStatusesResult;
        private String[] GetOrganisationAuthStatusesResult_type_info = new String[]{'GetOrganisationAuthStatusesResult','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'GetOrganisationAuthStatusesResult'};
    }
    public class OrganisationSearchCriteria {
        public String Postcode;
        public DateTime StatusChangedFrom;
        public DateTime StatusChangedTo;
        public DateTime PermissionsChangedFrom;
        public DateTime PermissionsChangedTo;
        public DateTime AddedFrom;
        public DateTime AddedTo;
        public DateTime AppointeeStatusChangedFrom;
        public DateTime AppointeeStatusChangedTo;
        public String AuthStatus;
        public String Activity;
        public String InvestmentType;
        public DateTime ModifiedFrom;
        public DateTime ModifiedTo;
        private String[] Postcode_type_info = new String[]{'Postcode','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] StatusChangedFrom_type_info = new String[]{'StatusChangedFrom','http://sdm-fsa-register.co.uk/',null,'1','1','false'};
        private String[] StatusChangedTo_type_info = new String[]{'StatusChangedTo','http://sdm-fsa-register.co.uk/',null,'1','1','false'};
        private String[] PermissionsChangedFrom_type_info = new String[]{'PermissionsChangedFrom','http://sdm-fsa-register.co.uk/',null,'1','1','false'};
        private String[] PermissionsChangedTo_type_info = new String[]{'PermissionsChangedTo','http://sdm-fsa-register.co.uk/',null,'1','1','false'};
        private String[] AddedFrom_type_info = new String[]{'AddedFrom','http://sdm-fsa-register.co.uk/',null,'1','1','false'};
        private String[] AddedTo_type_info = new String[]{'AddedTo','http://sdm-fsa-register.co.uk/',null,'1','1','false'};
        private String[] AppointeeStatusChangedFrom_type_info = new String[]{'AppointeeStatusChangedFrom','http://sdm-fsa-register.co.uk/',null,'1','1','false'};
        private String[] AppointeeStatusChangedTo_type_info = new String[]{'AppointeeStatusChangedTo','http://sdm-fsa-register.co.uk/',null,'1','1','false'};
        private String[] AuthStatus_type_info = new String[]{'AuthStatus','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] Activity_type_info = new String[]{'Activity','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] InvestmentType_type_info = new String[]{'InvestmentType','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] ModifiedFrom_type_info = new String[]{'ModifiedFrom','http://sdm-fsa-register.co.uk/',null,'1','1','false'};
        private String[] ModifiedTo_type_info = new String[]{'ModifiedTo','http://sdm-fsa-register.co.uk/',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'Postcode','StatusChangedFrom','StatusChangedTo','PermissionsChangedFrom','PermissionsChangedTo','AddedFrom','AddedTo','AppointeeStatusChangedFrom','AppointeeStatusChangedTo','AuthStatus','Activity','InvestmentType','ModifiedFrom','ModifiedTo'};
    }
    public class ArrayOfString {
        public String[] string_x;
        private String[] string_x_type_info = new String[]{'string','http://sdm-fsa-register.co.uk/',null,'0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'string_x'};
    }
    public class ArrayOfPairOfStringString {
        public sdmFsaRegisterWSStub.PairOfStringString[] PairOfStringString;
        private String[] PairOfStringString_type_info = new String[]{'PairOfStringString','http://sdm-fsa-register.co.uk/',null,'0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'PairOfStringString'};
    }
    public class DownloadFile_element {
        public sdmFsaRegisterWSStub.FileRequest request;
        private String[] request_type_info = new String[]{'request','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'request'};
    }
    public class PairOfStringString {
        public String Key;
        public String Value;
        private String[] Key_type_info = new String[]{'Key','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] Value_type_info = new String[]{'Value','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'Key','Value'};
    }
    public class PersonSearchCriteria {
        public String AuthStatus;
        public String Position;
        public String AppointeeRelationship;
        public DateTime ModifiedFrom;
        public DateTime ModifiedTo;
        private String[] AuthStatus_type_info = new String[]{'AuthStatus','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] Position_type_info = new String[]{'Position','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] AppointeeRelationship_type_info = new String[]{'AppointeeRelationship','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] ModifiedFrom_type_info = new String[]{'ModifiedFrom','http://sdm-fsa-register.co.uk/',null,'1','1','false'};
        private String[] ModifiedTo_type_info = new String[]{'ModifiedTo','http://sdm-fsa-register.co.uk/',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'AuthStatus','Position','AppointeeRelationship','ModifiedFrom','ModifiedTo'};
    }
    public class FileRequest {
        public String FileFormat;
        public String SearchType;
        private String[] FileFormat_type_info = new String[]{'FileFormat','http://sdm-fsa-register.co.uk/',null,'1','1','false'};
        private String[] SearchType_type_info = new String[]{'SearchType','http://sdm-fsa-register.co.uk/',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'FileFormat','SearchType'};
    }
    public class GetIndividualFunctionsResponse_element {
        public sdmFsaRegisterWSStub.ArrayOfPairOfStringString GetIndividualFunctionsResult;
        private String[] GetIndividualFunctionsResult_type_info = new String[]{'GetIndividualFunctionsResult','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'GetIndividualFunctionsResult'};
    }
    public class SearchOrganisationsResult_element {
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{};
    }
    public class SearchIndividuals_element {
        public sdmFsaRegisterWSStub.PersonSearchCriteria criteria;
        private String[] criteria_type_info = new String[]{'criteria','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'criteria'};
    }
    public class AuthenticateUser_element {
        public String userName;
        public String password;
        private String[] userName_type_info = new String[]{'userName','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] password_type_info = new String[]{'password','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'userName','password'};
    }
    public class GetOrganisation_element {
        public Integer reference;
        private String[] reference_type_info = new String[]{'reference','http://sdm-fsa-register.co.uk/',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'reference'};
    }
    public class SearchOrganisationsResponse_element {
        public sdmFsaRegisterWSStub.SearchOrganisationsResult_element SearchOrganisationsResult;
        private String[] SearchOrganisationsResult_type_info = new String[]{'SearchOrganisationsResult','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'SearchOrganisationsResult'};
    }
    public class SearchOrganisations_element {
        public sdmFsaRegisterWSStub.OrganisationSearchCriteria criteria;
        private String[] criteria_type_info = new String[]{'criteria','http://sdm-fsa-register.co.uk/',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://sdm-fsa-register.co.uk/','true','false'};
        private String[] field_order_type_info = new String[]{'criteria'};
    }
    public class SdmFsaPlusWebServiceSoap {
        public String endpoint_x = 'https://www.sdm-fsa-register.co.uk/FSAWebService/SdmFsaPlusWebService.asmx';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        public sdmFsaRegisterWSStub.AuthHeader AuthHeader;
        private String AuthHeader_hns = 'AuthHeader=http://sdm-fsa-register.co.uk/';
        private String[] ns_map_type_info = new String[]{'http://sdm-fsa-register.co.uk/', 'sdmFsaRegisterWSStub'};
        public Boolean AuthenticateUser(String userName,String password) {
            sdmFsaRegisterWSStub.AuthenticateUser_element request_x = new sdmFsaRegisterWSStub.AuthenticateUser_element();
            request_x.userName = userName;
            request_x.password = password;
            sdmFsaRegisterWSStub.AuthenticateUserResponse_element response_x;
            Map<String, sdmFsaRegisterWSStub.AuthenticateUserResponse_element> response_map_x = new Map<String, sdmFsaRegisterWSStub.AuthenticateUserResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://sdm-fsa-register.co.uk/AuthenticateUser',
              'http://sdm-fsa-register.co.uk/',
              'AuthenticateUser',
              'http://sdm-fsa-register.co.uk/',
              'AuthenticateUserResponse',
              'sdmFsaRegisterWSStub.AuthenticateUserResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.AuthenticateUserResult;
        }
        public sdmFsaRegisterWSStub.GetOrganisationResult_element GetOrganisation(Integer reference) {
            sdmFsaRegisterWSStub.GetOrganisation_element request_x = new sdmFsaRegisterWSStub.GetOrganisation_element();
            request_x.reference = reference;
            sdmFsaRegisterWSStub.GetOrganisationResponse_element response_x;
            Map<String, sdmFsaRegisterWSStub.GetOrganisationResponse_element> response_map_x = new Map<String, sdmFsaRegisterWSStub.GetOrganisationResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://sdm-fsa-register.co.uk/GetOrganisation',
              'http://sdm-fsa-register.co.uk/',
              'GetOrganisation',
              'http://sdm-fsa-register.co.uk/',
              'GetOrganisationResponse',
              'sdmFsaRegisterWSStub.GetOrganisationResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.GetOrganisationResult;
        }
        public sdmFsaRegisterWSStub.ArrayOfString GetOrganisationAuthStatuses() {
            sdmFsaRegisterWSStub.GetOrganisationAuthStatuses_element request_x = new sdmFsaRegisterWSStub.GetOrganisationAuthStatuses_element();
            sdmFsaRegisterWSStub.GetOrganisationAuthStatusesResponse_element response_x;
            Map<String, sdmFsaRegisterWSStub.GetOrganisationAuthStatusesResponse_element> response_map_x = new Map<String, sdmFsaRegisterWSStub.GetOrganisationAuthStatusesResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://sdm-fsa-register.co.uk/GetOrganisationAuthStatuses',
              'http://sdm-fsa-register.co.uk/',
              'GetOrganisationAuthStatuses',
              'http://sdm-fsa-register.co.uk/',
              'GetOrganisationAuthStatusesResponse',
              'sdmFsaRegisterWSStub.GetOrganisationAuthStatusesResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.GetOrganisationAuthStatusesResult;
        }
        public sdmFsaRegisterWSStub.ArrayOfPairOfStringString GetAppointeeRelationships() {
            sdmFsaRegisterWSStub.GetAppointeeRelationships_element request_x = new sdmFsaRegisterWSStub.GetAppointeeRelationships_element();
            sdmFsaRegisterWSStub.GetAppointeeRelationshipsResponse_element response_x;
            Map<String, sdmFsaRegisterWSStub.GetAppointeeRelationshipsResponse_element> response_map_x = new Map<String, sdmFsaRegisterWSStub.GetAppointeeRelationshipsResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://sdm-fsa-register.co.uk/GetAppointeeRelationships',
              'http://sdm-fsa-register.co.uk/',
              'GetAppointeeRelationships',
              'http://sdm-fsa-register.co.uk/',
              'GetAppointeeRelationshipsResponse',
              'sdmFsaRegisterWSStub.GetAppointeeRelationshipsResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.GetAppointeeRelationshipsResult;
        }
        public sdmFsaRegisterWSStub.ArrayOfString GetRegulatedActivities() {
            sdmFsaRegisterWSStub.GetRegulatedActivities_element request_x = new sdmFsaRegisterWSStub.GetRegulatedActivities_element();
            sdmFsaRegisterWSStub.GetRegulatedActivitiesResponse_element response_x;
            Map<String, sdmFsaRegisterWSStub.GetRegulatedActivitiesResponse_element> response_map_x = new Map<String, sdmFsaRegisterWSStub.GetRegulatedActivitiesResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://sdm-fsa-register.co.uk/GetRegulatedActivities',
              'http://sdm-fsa-register.co.uk/',
              'GetRegulatedActivities',
              'http://sdm-fsa-register.co.uk/',
              'GetRegulatedActivitiesResponse',
              'sdmFsaRegisterWSStub.GetRegulatedActivitiesResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.GetRegulatedActivitiesResult;
        }
        public sdmFsaRegisterWSStub.DataFile DownloadFile(sdmFsaRegisterWSStub.FileRequest request) {
            sdmFsaRegisterWSStub.DownloadFile_element request_x = new sdmFsaRegisterWSStub.DownloadFile_element();
            request_x.request = request;
            sdmFsaRegisterWSStub.DownloadFileResponse_element response_x;
            Map<String, sdmFsaRegisterWSStub.DownloadFileResponse_element> response_map_x = new Map<String, sdmFsaRegisterWSStub.DownloadFileResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://sdm-fsa-register.co.uk/DownloadFile',
              'http://sdm-fsa-register.co.uk/',
              'DownloadFile',
              'http://sdm-fsa-register.co.uk/',
              'DownloadFileResponse',
              'sdmFsaRegisterWSStub.DownloadFileResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.DownloadFileResult;
        }
        public sdmFsaRegisterWSStub.ArrayOfPairOfStringString GetIndividualFunctions() {
            sdmFsaRegisterWSStub.GetIndividualFunctions_element request_x = new sdmFsaRegisterWSStub.GetIndividualFunctions_element();
            sdmFsaRegisterWSStub.GetIndividualFunctionsResponse_element response_x;
            Map<String, sdmFsaRegisterWSStub.GetIndividualFunctionsResponse_element> response_map_x = new Map<String, sdmFsaRegisterWSStub.GetIndividualFunctionsResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://sdm-fsa-register.co.uk/GetIndividualFunctions',
              'http://sdm-fsa-register.co.uk/',
              'GetIndividualFunctions',
              'http://sdm-fsa-register.co.uk/',
              'GetIndividualFunctionsResponse',
              'sdmFsaRegisterWSStub.GetIndividualFunctionsResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.GetIndividualFunctionsResult;
        }
        public sdmFsaRegisterWSStub.SearchOrganisationsResult_element SearchOrganisations(sdmFsaRegisterWSStub.OrganisationSearchCriteria criteria) {
            sdmFsaRegisterWSStub.SearchOrganisations_element request_x = new sdmFsaRegisterWSStub.SearchOrganisations_element();
            request_x.criteria = criteria;
            sdmFsaRegisterWSStub.SearchOrganisationsResponse_element response_x;
            Map<String, sdmFsaRegisterWSStub.SearchOrganisationsResponse_element> response_map_x = new Map<String, sdmFsaRegisterWSStub.SearchOrganisationsResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://sdm-fsa-register.co.uk/SearchOrganisations',
              'http://sdm-fsa-register.co.uk/',
              'SearchOrganisations',
              'http://sdm-fsa-register.co.uk/',
              'SearchOrganisationsResponse',
              'sdmFsaRegisterWSStub.SearchOrganisationsResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.SearchOrganisationsResult;
        }
        public sdmFsaRegisterWSStub.ArrayOfString GetPersonAuthStatuses() {
            sdmFsaRegisterWSStub.GetPersonAuthStatuses_element request_x = new sdmFsaRegisterWSStub.GetPersonAuthStatuses_element();
            sdmFsaRegisterWSStub.GetPersonAuthStatusesResponse_element response_x;
            Map<String, sdmFsaRegisterWSStub.GetPersonAuthStatusesResponse_element> response_map_x = new Map<String, sdmFsaRegisterWSStub.GetPersonAuthStatusesResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://sdm-fsa-register.co.uk/GetPersonAuthStatuses',
              'http://sdm-fsa-register.co.uk/',
              'GetPersonAuthStatuses',
              'http://sdm-fsa-register.co.uk/',
              'GetPersonAuthStatusesResponse',
              'sdmFsaRegisterWSStub.GetPersonAuthStatusesResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.GetPersonAuthStatusesResult;
        }
        public sdmFsaRegisterWSStub.SearchIndividualsResult_element SearchIndividuals(sdmFsaRegisterWSStub.PersonSearchCriteria criteria) {
            sdmFsaRegisterWSStub.SearchIndividuals_element request_x = new sdmFsaRegisterWSStub.SearchIndividuals_element();
            request_x.criteria = criteria;
            sdmFsaRegisterWSStub.SearchIndividualsResponse_element response_x;
            Map<String, sdmFsaRegisterWSStub.SearchIndividualsResponse_element> response_map_x = new Map<String, sdmFsaRegisterWSStub.SearchIndividualsResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://sdm-fsa-register.co.uk/SearchIndividuals',
              'http://sdm-fsa-register.co.uk/',
              'SearchIndividuals',
              'http://sdm-fsa-register.co.uk/',
              'SearchIndividualsResponse',
              'sdmFsaRegisterWSStub.SearchIndividualsResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.SearchIndividualsResult;
        }
        public sdmFsaRegisterWSStub.GetIndividualResult_element GetIndividual(String reference) {
            sdmFsaRegisterWSStub.GetIndividual_element request_x = new sdmFsaRegisterWSStub.GetIndividual_element();
            request_x.reference = reference;
            sdmFsaRegisterWSStub.GetIndividualResponse_element response_x;
            Map<String, sdmFsaRegisterWSStub.GetIndividualResponse_element> response_map_x = new Map<String, sdmFsaRegisterWSStub.GetIndividualResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://sdm-fsa-register.co.uk/GetIndividual',
              'http://sdm-fsa-register.co.uk/',
              'GetIndividual',
              'http://sdm-fsa-register.co.uk/',
              'GetIndividualResponse',
              'sdmFsaRegisterWSStub.GetIndividualResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.GetIndividualResult;
        }
    }
}