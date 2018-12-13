global class wService{
    
    webservice static Contact Details(ID patient){
        Contact c = [SELECT lastname,owner.name from Contact where id =:Patient];
        return c;
    }
}