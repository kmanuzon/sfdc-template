public inherited sharing class ProjectsServiceImpl implements IProjectsService
{
    public static void syncVendor(Map<Id, List<Job__c>> jobsByProjectId)
    {
        fflib_ISObjectUnitOfWork uow = Application.UnitOfWork.newInstance();

        syncVendor(uow, jobsByProjectId);

        uow.commitWork();
    }

    private static void syncVendor(fflib_ISObjectUnitOfWork uow, Map<Id, List<Job__c>> jobsByProjectId)
    {
        Set<Id> projectIds = jobsByProjectId.keySet();

        Projects domain = Projects.newInstance(projectIds).setSpVendorFields(jobsByProjectId);

        uow.registerDirty(domain.getRecords());
    }
}
