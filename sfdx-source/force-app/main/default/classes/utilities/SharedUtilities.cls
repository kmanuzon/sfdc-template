public inherited sharing class SharedUtilities
{
    public static Set<String> multipicklistToSet(String value)
    {
        Set<String> values = new Set<String>();

        if (String.isNotBlank(value)) values.addAll(value.split(';'));

        return values;
    }
}
