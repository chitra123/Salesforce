trigger InsertContact on Contact (before insert, before update) {
    TriggerHandler.createHandler(Contact.sObjectType);
}