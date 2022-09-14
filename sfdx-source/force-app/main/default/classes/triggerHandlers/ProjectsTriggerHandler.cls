public without sharing class ProjectsTriggerHandler extends fflib_SObjectDomain
{
    public ProjectsTriggerHandler(List<Project__c> records)
    {
        super(records);
    }

    public override void onAfterUpdate(Map<Id, SObject> existingRecords)
    {
        onChangeSpVendorFields();
    }

    /**
     * Collect records that have changed any of their SP* Vendor fields.
     */
    private void onChangeSpVendorFields()
    {
        Map<String, List<Project__c>> projectsByTask = new Map<String, List<Project__c>>();

        for (String task : Projects.projectSpVendorByJobTask.keySet())
        {
            Set<String> fields = new Set<String> { Projects.projectSpVendorByJobTask.get(task) };

            List<Project__c> changedRecords = (List<Project__c>) getChangedRecords(fields);

            if (!changedRecords.isEmpty())
            {
                projectsByTask.put(task, changedRecords);
            }
        }

        if (projectsByTask.isEmpty()) return;

        if (FeatureToggleService.isFeatureActive('SyncProjectSpVendorToJob'))
        {
            updateJobVendor(projectsByTask);
        }
    }

    private void updateJobVendor(Map<String, List<Project__c>> projectsByTask)
    {
        try
        {
            fflib_ISObjectUnitOfWork uow = Application.UnitOfWork.newInstance();

            for (String task : projectsByTask.keySet())
            {
                JobsService.syncVendor(uow, task, projectsByTask.get(task));
            }

            uow.commitWork();
        }
        catch (Exception ex)
        {
            // @TODO log error here
            System.debug('@@@ProjectsTriggerHandler.updateJobVendor EXCEPTION ' + ex.getMessage());
        }
    }

    public class Constructor implements fflib_SObjectDomain.IConstructable
    {
        public fflib_SObjectDomain construct(List<SObject> sObjects)
        {
            return new ProjectsTriggerHandler(sObjects);
        }
    }
}
