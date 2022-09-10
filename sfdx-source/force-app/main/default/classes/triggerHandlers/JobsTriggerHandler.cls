public without sharing class JobsTriggerHandler extends fflib_SObjectDomain
{
    public JobsTriggerHandler(List<Job__c> records)
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
            return new JobsTriggerHandler(sObjects);
        }
    }
}
