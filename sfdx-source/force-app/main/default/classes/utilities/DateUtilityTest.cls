@IsTest
private class DateUtilityTest
{
    @IsTest
    private static void itShouldGetIso8601OfCurrentDatetime()
    {
        // given
        String expected = Datetime.now().format(DateUtility.ISO_8601_FORMAT);

        // when
        String actual = DateUtility.toIso8601();

        // then
        System.assertEquals(expected, actual);
    }

    @IsTest
    private static void itShouldGetIso8601OfDate()
    {
        // given
        Date dateValue = Date.today();
        Time timeValue = Time.newInstance(0, 0, 0, 0);

        String expected = Datetime.newInstance(dateValue, timeValue).format(DateUtility.ISO_8601_FORMAT);

        // when
        String actual = DateUtility.toIso8601(dateValue);

        // then
        System.assertEquals(expected, actual);
    }
}
