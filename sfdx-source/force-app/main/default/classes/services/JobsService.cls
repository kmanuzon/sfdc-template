public inherited sharing class JobsService
{
    private static IJobsService service()
    {
        return (IJobsService) Application.Service.newInstance(IJobsService.class);
    }

    public static void syncVendor(String task, List<Project__c> projectRecords)
    {
        service().syncVendor(task, projectRecords);
    }

    public static void syncVendor(fflib_ISObjectUnitOfWork uow, String task, List<Project__c> projectRecords)
    {
        service().syncVendor(uow, task, projectRecords);
    }
}
