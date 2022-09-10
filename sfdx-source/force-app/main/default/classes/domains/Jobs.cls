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

    public Map<Id, List<Job__c>> getRecordsByProjectId()
    {
        Map<Id, List<Job__c>> valuesByKey = new Map<Id, List<Job__c>>();

        for (Job__c record : (List<Job__c>) getRecords())
        {
            if (valuesByKey.containsKey(record.Project__c) == false)
            {
                valuesByKey.put(record.Project__c, new List<Job__c>());
            }

            valuesByKey.get(record.Project__c).add(record);
        }

        return valuesByKey;
    }

    public class Constructor implements fflib_IDomainConstructor
    {
        public fflib_SObjects construct(List<Object> objects)
        {
            return new Jobs((List<SObject>) objects);
        }
    }
}
