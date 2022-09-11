public inherited sharing class SharedUtilities
{
    public static Set<String> multipicklistToSet(String value)
    {
        Set<String> values = new Set<String>();

        if (String.isNotBlank(value)) values.addAll(value.split(';'));

        return values;
    }

    public static Set<Object> convertToObject(Set<Id> values)
    {
        Set<Object> results = new Set<Object>();

        for (Id value : values)
        {
            results.add(value);
        }

        return results;
    }

    /**
     * Filter records that does not match given set of values.
     *
     * @param sObjects Records to filter.
     * @param sObjectField Field to compare.
     * @param values Values to filter out.
     * @return  `List<SObject>` Filtered records.
     */
    public static List<SObject> getRecordsByNotInFieldValues(
        List<SObject> sObjects,
        Schema.SObjectField sObjectField,
        Set<Object> values
    )
    {
        List<SObject> results = new List<SObject>();

        for (SObject record : sObjects)
        {
            if (!values?.contains(record.get(sObjectField)))
            {
                results.add(record);
            }
        }

        return results;
    }
}
