public inherited sharing class JobsService
{
    private static IJobsService service()
    {
        return (IJobsService) Application.Service.newInstance(IJobsService.class);
    }
}
