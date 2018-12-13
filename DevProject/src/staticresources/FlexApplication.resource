<?xml version="1.0" encoding="utf-8"?>
<mx:Application xmlns:mx="http://www.adobe.com/2006/mxml" xmlns:salesforce="http://www.salesforce.com/" 
        layout="absolute" width="500" height="300" 
        backgroundGradientAlphas="[1.0, 1.0]" 
        backgroundGradientColors="[#FFFFFF, #FFFFFF]" applicationComplete="init()">
        
        <mx:Script>
               <![CDATA[
                       import mx.collections.ArrayCollection;
                       import com.salesforce.results.QueryResult;
                       import com.salesforce.results.LoginResult;
                       import com.salesforce.AsyncResponder;
                       import com.salesforce.objects.LoginRequest;
                       
                       [Bindable]
                       private var opps:ArrayCollection;
                       
                       private function init():void 
                       {
                               var lr:LoginRequest = new LoginRequest();
                               lr.username = "chitra.p@salesforce.com";
                               lr.password = "Barclays123#uMgwY0hQRjGLK0v95quNmJDtG"; // You may need the security token if so please append the security token eg: passwordsecurityToken
                               lr.callback = new AsyncResponder(loginHandler,faultHandler);
                               force.login(lr);
                       }              
                       
                       private function loginHandler(result:LoginResult):void 
                       {
                               force.query("SELECT Name, Amount FROM Opportunity " + 
                                      "WHERE Account.Name = 'GenePoint'", 
                                      new AsyncResponder(queryHandler, faultHandler));
                       }
                       
                       private function queryHandler(result:QueryResult):void
                       {
                               opps = result.records;
                       }
                       
                       private function faultHandler(result:Object):void
                       {
                               Alert.show(“Error: ” + result.toString());
                       }

               ]]>
        </mx:Script>
        
        <salesforce:Connection id="force"/>
        
        <mx:BarChart id="chart" dataProvider="{opps}" top="10" bottom="10" left="10" right="10">
        <mx:verticalAxis>
           <mx:CategoryAxis dataProvider="{opps}" categoryField="Name"/>
        </mx:verticalAxis>
        <mx:series>
           <mx:BarSeries xField="Amount"/>
        </mx:series>
        </mx:BarChart>
        
</mx:Application>