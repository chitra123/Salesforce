public class ContactListLightning {
    @auraenabled
    public static List<Contact> getContactDetails(){
        return [SELECT id, Name FROM Contact limit 10];
    }
	
}