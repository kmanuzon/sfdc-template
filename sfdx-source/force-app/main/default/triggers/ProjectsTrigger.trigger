trigger ProjectsTrigger on Project__c (
    after delete, after insert, after update, before delete, before insert, before update
)
{
    fflib_SObjectDomain.triggerHandler(ProjectsTriggerHandler.class);
}
