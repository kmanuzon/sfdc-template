public without sharing class ProjectsTriggerHandler extends fflib_SObjectDomain
{
    public ProjectsTriggerHandler(List<Project__c> records)
    {
        super(records);
    }

    public override void onAfterUpdate(Map<Id,SObject> existingRecords)
    {
        // do something
    }

    public class Constructor implements fflib_SObjectDomain.IConstructable
    {
        public fflib_SObjectDomain construct(List<SObject> sObjects)
        {
            return new ProjectsTriggerHandler(sObjects);
        }
    }
}
