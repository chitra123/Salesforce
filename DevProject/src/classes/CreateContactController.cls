public without sharing class CreateContactController{
    
    public CreateContactController(){

    }
    
    @RemoteAction
    public static string createContact(String firstName, String lastName){

        Contact newContact  = new Contact(FirstName = firstName, LastName = lastName);
        try{
            insert newContact;
            return newContact.id;
        }
        catch(DmlException e){
            return e.getMessage();
        }
        
    } 
}