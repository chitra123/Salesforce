public class DataTableController{
    
    public static List<Account> accountList{get; set;}
    public void getAccounts(){
        accountList = [SELECT id, NAme from Account LIMIT 100];
    }
}