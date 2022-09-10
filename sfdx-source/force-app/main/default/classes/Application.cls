public inherited sharing class Application
{
    public static final fflib_Application.UnitOfWorkFactory UnitOfWork =
        new fflib_Application.UnitOfWorkFactory(
            new List<SObjectType>
            {
                Account.SObjectType,
                Job__c.SObjectType,
                Project__c.SObjectType
            }
        );

    public static final fflib_Application.ServiceFactory Service =
        new fflib_Application.ServiceFactory(
            new Map<Type, Type>
            {
                IJobsService.class => JobsServiceImpl.class,
                IProjectsService.class => ProjectsServiceImpl.class
            }
        );

    public static final fflib_Application.SelectorFactory Selector =
        new fflib_Application.SelectorFactory(
            new Map<SObjectType, Type>
            {
                Job__c.SObjectType => JobsSelector.class,
                Project__c.SObjectType => ProjectsSelector.class
            }
        );

    public static final fflib_Application.DomainFactory Domain =
        new fflib_Application.DomainFactory(
            Application.Selector,
            new Map<SObjectType, Type>
            {
                Job__c.SObjectType => Jobs.Constructor.class,
                Project__c.SObjectType => Projects.Constructor.class
            }
        );
}
