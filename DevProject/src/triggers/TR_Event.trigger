trigger TR_Event on Event (before update, after update) {

    if(Trigger.isUpdate){
        system.debug('update trigger'+ Trigger.new);
    }
}