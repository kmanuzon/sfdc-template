public inherited sharing class ProjectsServiceImpl implements IProjectsService
{
    public void syncVendor(Map<Id, List<Job__c>> jobsByProjectId)
    {
        fflib_ISObjectUnitOfWork uow = Application.UnitOfWork.newInstance();

        syncVendor(uow, jobsByProjectId);

        uow.commitWork();
    }

    private void syncVendor(fflib_ISObjectUnitOfWork uow, Map<Id, List<Job__c>> jobsByProjectId)
    {
        Set<Id> projectIds = jobsByProjectId.keySet();

        IProjects domain = getProjectsDomain(projectIds).setSpVendorFields(jobsByProjectId);

        uow.registerDirty(domain.getRecords());
    }

    private IProjects getProjectsDomain(Set<Id> ids)
    {
        return (IProjects) Application.Domain.newInstance(ids);
    }
}
