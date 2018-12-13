trigger TR_Task on Task (before insert) {
    system.debug('In task trigger');
}