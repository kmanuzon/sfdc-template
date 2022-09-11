public without sharing class JobsTriggerHandler extends fflib_SObjectDomain
{
    public JobsTriggerHandler(List<Job__c> records)
    {
        super(records);
    }

    public override void onAfterUpdate(Map<Id, SObject> existingRecords)
    {
        onChangeTask();
    }

    private void onChangeTask()
    {
        Set<Schema.SObjectField> fields = new Set<Schema.SObjectField>
        {
            Schema.Job__c.Tasks__c
        };

        List<Job__c> changedRecords = getChangedRecords(fields);

        if (changedRecords.isEmpty()) return;

        if (FeatureToggleService.isFeatureActive('SyncJobTaskToProjectVendor'))
        {
            updateProjectVendorFields(changedRecords);
        }
    }

    private void updateProjectVendorFields(List<Job__c> records)
    {
        try
        {
            List<Job__c> eligibleRecords = new List<Job__c>();

            Set<String> eligibleTasks = Projects.projectSpVendorByJobTask.keySet();

            for (Job__c record : records)
            {
                Job__c oldRecord = (Job__c) ExistingRecords.get(record.Id);

                if (hasAddedEligibleTasks(record, oldRecord, eligibleTasks))
                {
                    eligibleRecords.add(record);
                }
            }

            if (eligibleRecords.isEmpty()) return;

            ProjectsService.syncVendor(Jobs.newInstance(eligibleRecords).getRecordsByProjectId());
        }
        catch (Exception ex)
        {
            // @TODO log error here
            System.debug('@@@JobsTriggerHandler.updateProjectVendorFields EXCEPTION ' + ex.getMessage());
        }
    }

    private Boolean hasAddedEligibleTasks(Job__c newRecord, Job__c oldRecord, Set<String> eligibleTasks)
    {
        Set<String> newTasks = SharedUtilities.multipicklistToSet(newRecord.Tasks__c);
        Set<String> oldTasks = SharedUtilities.multipicklistToSet(oldRecord.Tasks__c);

        for (String newTask : newTasks)
        {
            if (eligibleTasks?.contains(newTask) != true)  continue;

            if (oldTasks.contains(newTask) == false) return true;
        }

        return false;
    }

    public class Constructor implements fflib_SObjectDomain.IConstructable
    {
        public fflib_SObjectDomain construct(List<SObject> sObjects)
        {
            return new JobsTriggerHandler(sObjects);
        }
    }
}
