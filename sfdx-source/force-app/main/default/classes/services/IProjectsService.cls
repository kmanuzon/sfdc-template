public interface IProjectsService
{
    void syncVendor(Map<Id, List<Job__c>> jobsByProjectId);
}
