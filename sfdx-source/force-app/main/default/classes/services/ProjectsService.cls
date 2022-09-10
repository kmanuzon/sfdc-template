public inherited sharing class ProjectsService
{
    private static IProjectsService service()
    {
        return (IProjectsService) Application.Service.newInstance(IProjectsService.class);
    }

    public static void syncVendor(Map<Id, List<Job__c>> jobsByProjectId)
    {
        service().syncVendor(jobsByProjectId);
    }
}
