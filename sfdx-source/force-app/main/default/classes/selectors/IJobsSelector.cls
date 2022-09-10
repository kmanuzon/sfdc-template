public interface IJobsSelector extends fflib_ISObjectSelector
{
    List<Job__c> selectById(Set<Id> ids);
}
