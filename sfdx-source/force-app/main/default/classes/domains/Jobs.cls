public inherited sharing class Jobs extends fflib_SObjects implements IJobs
{
    public static IJobs newInstance(List<Job__c> records)
    {
        return (IJobs) Application.Domain.newInstance(records, Schema.Job__c.SObjectType);
    }

    public static IJobs newInstance(Set<Id> ids)
    {
        return (IJobs) Application.Domain.newInstance(ids);
    }

    public Jobs(List<Job__c> records)
    {
        super(records);
    }

    public IJobs filterByNotInVendor(Id value)
    {
        return filterByNotInVendor(new Set<Id> { value });
    }

    public IJobs filterByNotInVendor(Set<Id> values)
    {
        Schema.SObjectField field = Schema.Job__c.Vendor__c;
        Set<Object> genericValues = SharedUtilities.convertToObject(values);

        return newInstance(SharedUtilities.getRecordsByNotInFieldValues(getRecords(), field, genericValues));
    }

    public IJobs filterByProject(Id value)
    {
        return filterByProject(new Set<Id> { value });
    }

    public IJobs filterByProject(Set<Id> values)
    {
        return newInstance(getRecordsByFieldValues(Schema.Job__c.Project__c, SharedUtilities.convertToObject(values)));
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

    public IJobs setVendor(Id value)
    {
        setFieldValue(Schema.Job__c.Vendor__c, value);

        return this;
    }

    public class Constructor implements fflib_IDomainConstructor
    {
        public fflib_SObjects construct(List<Object> objects)
        {
            return new Jobs((List<SObject>) objects);
        }
    }
}
