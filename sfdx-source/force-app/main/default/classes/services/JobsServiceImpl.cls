public inherited sharing class JobsServiceImpl implements IJobsService
{
    public void syncVendor(String task, List<Project__c> projectRecords)
    {
        fflib_ISObjectUnitOfWork uow = Application.UnitOfWork.newInstance();

        syncVendor(uow, task, projectRecords);

        uow.commitWork();
    }

    public void syncVendor(fflib_ISObjectUnitOfWork uow, String task, List<Project__c> projectRecords)
    {
        Set<Id> projectIds = Projects.newInstance(projectRecords).getRecordIds();
        Set<String> tasks = new Set<String> { task };
        Set<String> excludeJobStatuses = new Set<String>{ 'Cancelled', 'Completed' };

        List<Job__c> jobRecords =
            JobsSelector.newInstance().selectByProjectAndTaskAndNotInJobStatus(projectIds, tasks, excludeJobStatuses);

        String projectSpVendorfield = Projects.projectSpVendorByJobTask.get(task);

        for (Project__c projectRecord : projectRecords)
        {
            Id currentVendorId = (Id) projectRecord.get(projectSpVendorfield);

            uow.registerDirty(
                Jobs.newInstance(jobRecords.deepClone(true, true, true))
                    .filterByProject(projectRecord.Id)
                    .filterByNotInVendor(currentVendorId)
                    .setVendor(currentVendorId)
                    .getRecords()
            );
        }
    }
}
