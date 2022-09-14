public inherited sharing class Projects extends fflib_SObjects implements IProjects
{
    public static Map<String, String> projectSpVendorByJobTask
    {
        get
        {
            if (projectSpVendorByJobTask == null)
            {
                // @TODO service to call the mapping
                projectSpVendorByJobTask = new Map<String, String>
                {
                    'Tower' => 'SP_Tower__c',
                    'Power' => 'SP_Power__c',
                    'Ground' => 'SP_Ground__c'
                };
            }

            return projectSpVendorByJobTask;
        }

        private set;
    }

    public static IProjects newInstance(List<Project__c> records)
    {
        return (IProjects) Application.Domain.newInstance(records, Schema.Project__c.SObjectType);
    }

    public static IProjects newInstance(Set<Id> ids)
    {
        return (IProjects) Application.Domain.newInstance(ids);
    }

    public Projects(List<Project__c> records)
    {
        super(records);
    }

    public IProjects setSpVendorFields(Map<Id, List<Job__c>> jobsByProjectId)
    {
        for (Project__c project : (List<Project__c>) getRecords())
        {
            syncVendor(project, jobsByProjectId.get(project.Id));
        }

        return this;
    }

    private void syncVendor(Project__c project, List<Job__c> jobs)
    {
        for (Job__c job : jobs)
        {
            syncVendor(project, job);
        }
    }

    private void syncVendor(Project__c project, Job__c job)
    {
        for (String task : SharedUtilities.multipicklistToSet(job.Tasks__c))
        {
            if (projectSpVendorByJobTask.containsKey(task))
            {
                project.put(projectSpVendorByJobTask.get(task), job.Vendor__c);
            }
        }
    }

    public class Constructor implements fflib_IDomainConstructor
    {
        public fflib_SObjects construct(List<Object> objects)
        {
            return new Projects((List<SObject>) objects);
        }
    }
}
