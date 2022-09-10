public inherited sharing class ProjectsSelector extends fflib_SObjectSelector implements IProjectsSelector
{
    public static IProjectsSelector newInstance()
    {
        return (IProjectsSelector) Application.Selector.newInstance(Project__c.SObjectType);
    }

    public List<Schema.SObjectField> getSObjectFieldList()
    {
        return new List<Schema.SObjectField>
        {
            Project__c.Id,
            Project__c.SP_Ground__c,
            Project__c.SP_Power__c,
            Project__c.SP_Tower__c
        };
    }

    public Schema.SObjectType getSObjectType()
    {
        return Project__c.SObjectType;
    }

    public List<Project__c> selectById(Set<Id> ids)
    {
        return (List<Project__c>) selectSObjectsById(ids);
    }
}
