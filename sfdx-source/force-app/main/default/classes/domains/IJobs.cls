public interface IJobs extends fflib_ISObjects
{
    Map<Id, List<Job__c>> getRecordsByProjectId();
}
