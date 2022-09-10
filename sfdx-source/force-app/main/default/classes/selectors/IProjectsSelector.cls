public interface IProjectsSelector extends fflib_ISObjectSelector
{
    List<Project__c> selectById(Set<Id> ids);
}
