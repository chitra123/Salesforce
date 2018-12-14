public class AccList{

    public List<Account> accLi{get;set;}
    public String key{get;set;}
    public AccList(ApexPages.StandardController controller){
        accLi = new List<Account>();
    }

    /*trying commiting to git via git hub*/
    /*trying commiting to git via desktop2*/
    public void getAccounts(){
        String query = '%' + key + '%';
        accLi = [SELECT name from account where name like : query ];
        }    
}
