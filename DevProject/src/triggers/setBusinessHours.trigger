trigger setBusinessHours on Case (before update,before insert) {
    for(case c: trigger.new){
        system.debug(c);
       // system.debug()
       c.BusinessHoursId='01m900000004Npp';
    }
}