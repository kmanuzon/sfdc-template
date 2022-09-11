public interface IJobs extends fflib_ISObjects
{
    IJobs filterByNotInVendor(Id value);

    IJobs filterByNotInVendor(Set<Id> values);

    IJobs filterByProject(Id value);

    IJobs filterByProject(Set<Id> values);

    Map<Id, List<Job__c>> getRecordsByProjectId();

    IJobs setVendor(Id value);
}
