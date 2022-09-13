/**
 * Date utility class to help standardize dates.
 *
 * @group Utilities
 */
public inherited sharing class DateUtility
{
    /**
     * ISO 8601 format.
     *
     * Example format is 2000-12-04T03:30:00-05:00 where timezone -05:00 denotes
     * America/New_York timezone.
     *
     * @see https://en.wikipedia.org/wiki/ISO_8601
     * @see https://docs.oracle.com/javase/7/docs/api/java/text/SimpleDateFormat.html
     */
    public static String ISO_8601_FORMAT = 'yyyy-MM-dd\'T\'HH:mm:ssXXX';

    /**
     * Return current Datetime formatted in ISO 8601.
     *
     * Timezone is based on the current running user.
     *
     * @return  `String` String representation of Datetime in ISO 8601 format.
     */
    public static String toIso8601()
    {
        return toIso8601(Datetime.now());
    }

    /**
     * Convert Date to String formatted in ISO 8601.
     *
     * Timezone is based on the current running user.
     *
     * @param value Date to convert.
     * @return  `String` String representation of Datetime in ISO 8601 format.
     */
    public static String toIso8601(Date value)
    {
        Time timeValue = Time.newInstance(0, 0, 0, 0);

        return toIso8601(Datetime.newInstance(value, timeValue));
    }

    /**
     * Convert Datetime to String formatted in ISO 8601.
     *
     * @param value Datetime to convert.
     * @return  `String` String representation of Datetime in ISO 8601 format.
     */
    public static String toIso8601(Datetime value)
    {
        return value.format(ISO_8601_FORMAT);
    }
}
