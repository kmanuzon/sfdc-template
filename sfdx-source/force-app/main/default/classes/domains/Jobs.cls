public inherited sharing class Jobs extends fflib_SObjects implements IJobs
{
    public static IJobs newInstance(List<Job__c> records)
    {
        return (IJobs) Application.Domain.newInstance(records);
    }

    public static IJobs newInstance(Set<Id> ids)
    {
        return (IJobs) Application.Domain.newInstance(ids);
    }

    public Jobs(List<Job__c> records)
    {
        super(records);
    }

    public class Constructor implements fflib_IDomainConstructor
    {
        public fflib_SObjects construct(List<Object> objects)
        {
            return new Jobs((List<SObject>) objects);
        }
    }
}
