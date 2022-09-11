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

    /**
     * Query records by Project, Tasks, and Job Status fields.
     *
     * Three ways to query by multipicklist field:
     * 1. Field must have both specified values:
     *      `WHERE Multipicklist__c INCLUDES  ('Tower;Power')`
     * 2. Field can have either specified values:
     *      `WHERE Multipicklist__c INCLUDES ('Tower', 'Power')`
     * 3. Field must only have one value, can be any from the specified values:
     *      `WHERE Multipicklist__c IN ('Tower', 'Power')`
     *
     * @see https://salesforce.stackexchange.com/a/11518/84798
     *
     * @param projectIds Project ids to include.
     * @param tasks Tasks to include.
     * @param jobStatuses Job Statuses to exclude.
     * @return  `List<Job__c>` Queried records.
     */
    public List<Job__c> selectByProjectAndTaskAndNotInJobStatus(
        Set<Id> projectIds,
        Set<String> tasks,
        Set<String> excludeJobStatuses
    )
    {
        fflib_QueryFactory queryFactory = newQueryFactory();

        queryFactory.setCondition(
            'Project__c IN :projectIds'
            + ' AND Tasks__c IN :tasks'
            + ' AND Job_Status__c NOT IN :excludeJobStatuses'
        );

        return (List<Job__c>) Database.query(queryFactory.toSOQL());
    }
}
