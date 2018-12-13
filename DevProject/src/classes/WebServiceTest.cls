global class WebServiceTest {
	
	webservice static String getAccountName(Id AccountId){
		List<Account> accountList = [select Name from Account where id =: AccountId];
		if(!accountList.isEmpty() && accountList!= null){
			return accountList[0].Name;
		}
		else
			return 'No Account Found';
	}
}