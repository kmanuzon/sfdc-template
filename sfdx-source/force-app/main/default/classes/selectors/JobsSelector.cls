public inherited sharing class JobsSelector extends fflib_SObjectSelector implements IJobsSelector
{
    public static IJobsSelector newInstance()
    {
        return (IJobsSelector) Application.Selector.newInstance(Job__c.SObjectType);
    }

    public List<Schema.SObjectField> getSObjectFieldList()
    {
        return new List<Schema.SObjectField>
        {
            Job__c.Id,
            Job__c.Project__c,
            Job__c.Tasks__c,
            Job__c.Vendor__c
        };
    }

    public Schema.SObjectType getSObjectType()
    {
        return Job__c.SObjectType;
    }

    public List<Job__c> selectById(Set<Id> ids)
    {
        return (List<Job__c>) selectSObjectsById(ids);
    }
}
