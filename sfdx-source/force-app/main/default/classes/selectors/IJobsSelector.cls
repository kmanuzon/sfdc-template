public interface IJobsSelector extends fflib_ISObjectSelector
{
    List<Job__c> selectById(Set<Id> ids);

    List<Job__c> selectByProjectAndTaskAndNotInJobStatus(
        Set<Id> projectIds,
        Set<String> tasks,
        Set<String> excludeJobStatuses
    );
}
