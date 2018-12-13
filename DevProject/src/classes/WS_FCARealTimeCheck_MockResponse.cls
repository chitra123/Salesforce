/*
Class Name   : WS_FCARealTimeCheck_MockResponse
Description  : This Class will be used to generate a mock callout response for the FCARealTimeCheck request
Created By   : Cognizant Technology Solutions - Mahesh  PolicePatel
Created On   : 08-Aug-2014

 
Change History:
-----------------------------------------------------------------------------------------------------------------------------------
Sr#        Description                                                 Updated By                                     Updated On
-----------------------------------------------------------------------------------------------------------------------------------             
*/
@isTest
global class WS_FCARealTimeCheck_MockResponse implements WebServiceMock  {
    // Implement this interface method
    global void doInvoke( Object stub,
                           Object request,
                           Map<String, Object> response,
                           String endpoint,
                           String soapAction,
                           String requestName,
                           String responseNS,
                           String responseName,
                           String responseType) {
 System.debug('Request ------'+request +endpoint);
        sdmFsaRegisterWSStub.GetOrganisationResponse_element dummyResponse=new sdmFsaRegisterWSStub.GetOrganisationResponse_element();
        sdmFsaRegisterWSStub.GetOrganisationResult_element  setParam=new sdmFsaRegisterWSStub.GetOrganisationResult_element(); 
        
        dummyResponse.GetOrganisationResult =setParam;
        response.put('response_x',dummyResponse);
     
       /* <?xml version="1.0" standalone="yes"?>
<Organisation xmlns="http://tempuri.org/Organisation.xsd">
<OrganisationDetail>
<Reference>100000</Reference>
<CompanyName>Test Company 1</CompanyName>
<Address1>4th Floor</Address1>
<Address2>100 A Street</Address2>
<Address3 />
<Address4 />
<Address5>London</Address5>
<Address6 />
<Postcode>E1 2AA</Postcode>
<Telephone>44 020 7000 0000</Telephone>
<Fax />
<ClientMoney>No</ClientMoney>
<Status>Authorised</Status>
<StatusModified>2007-05-01T00:00:00+01:00</StatusModified>
<Registered>2007-05-01T00:00:00+01:00</Registered>
<OrganisationType>Regulated</OrganisationType>
<LegalStatus>Company Limited by Share Capital</LegalStatus>
<IsOnWatchList>false</IsOnWatchList>
</OrganisationDetail>
<Individuals>
<IndividualReference>GCC01025</IndividualReference>
<OrganisationReference>461914</OrganisationReference>
<Name>Mr John Smith</Name>
<Status>Active</Status>
</Individuals>
<Individuals>
<IndividualReference>JSB01089</IndividualReference>
<OrganisationReference>461914</OrganisationReference>
<Name>Mr John Doe</Name>
<Status>Active</Status>
</Individuals>
<InvestmentTypes>
<Reference>461914</Reference>
<Activity>Advising on investments (except on Pension Transfers and Pension Opt
Outs)</Activity>
<InvestmentType>Contractually Based Investments</InvestmentType>
<InvestmentDescription>Commodity Future</InvestmentDescription>
<Status>Authorised</Status>
<Effective>2007-05-01T00:00:00+01:00</Effective>
<LastUpdated>2007-05-01T00:00:00+01:00</LastUpdated>
</InvestmentTypes>
<InvestmentTypes>
<Reference>461914</Reference>
<Activity>Advising on investments (except on Pension Transfers and Pension Opt
Outs)</Activity>
<InvestmentType>Contractually Based Investments</InvestmentType>
<InvestmentDescription>Commodity option and option on commodity
future</InvestmentDescription>
<Status>Authorised</Status>
<Effective>2007-05-01T00:00:00+01:00</Effective>
<LastUpdated>2007-05-01T00:00:00+01:00</LastUpdated>
</InvestmentTypes>
<InvestmentTypes>
<Reference>461914</Reference>
<Activity>Advising on investments (except on Pension Transfers and Pension Opt
Outs)</Activity>
<InvestmentType>Contractually Based Investments</InvestmentType>
<InvestmentDescription>Contract for Differences (excluding a spread bet and a
rolling spot forex contract)</InvestmentDescription>
<Status>Authorised</Status>
<Effective>2007-05-01T00:00:00+01:00</Effective>
<LastUpdated>2007-05-01T00:00:00+01:00</LastUpdated>*/
        
    }

}