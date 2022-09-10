public inherited sharing class ProjectsService
{
    private static IProjectsService service()
    {
        return (IProjectsService) Application.Service.newInstance(IProjectsService.class);
    }
}
