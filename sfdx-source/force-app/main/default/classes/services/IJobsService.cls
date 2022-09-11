public interface IJobsService
{
    void syncVendor(String task, List<Project__c> projectRecords);

    void syncVendor(fflib_ISObjectUnitOfWork uow, String task, List<Project__c> projectRecords);
}
