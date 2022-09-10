public inherited sharing class Projects extends fflib_SObjects implements IProjects
{
    public static IProjects newInstance(List<Project__c> records)
    {
        return (IProjects) Application.Domain.newInstance(records);
    }

    public static IProjects newInstance(Set<Id> ids)
    {
        return (IProjects) Application.Domain.newInstance(ids);
    }

    public Projects(List<Project__c> records)
    {
        super(records);
    }

    public class Constructor implements fflib_IDomainConstructor
    {
        public fflib_SObjects construct(List<Object> objects)
        {
            return new Projects((List<SObject>) objects);
        }
    }
}
