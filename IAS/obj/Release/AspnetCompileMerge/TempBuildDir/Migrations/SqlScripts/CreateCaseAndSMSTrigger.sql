create trigger CreateCaseAndSMS on [Collection] after insert
as
	declare @workflowID bigint, @initialStateID bigint;
	declare @priorityID int, @effectiveDaysThreshold int;
	declare @assignedToID nvarchar(128);
	
	select 
		@workflowID = CollectionWorkflowID,
		@initialStateID = CollectionInitialStateID,
		@priorityID = DefaultCasePriorityID,
		@effectiveDaysThreshold = EffectiveDaysThreshold,
		@assignedToID = DefaultUserID
	from AppConfig
	
	insert into [Case]
		select @workflowID ,RiskName,@priorityID,@initialStateID,
			GETDATE(),GETDATE(), dateadd(dd,@effectiveDaysThreshold,PaymentDueDate),@assignedToID
		from inserted;
		
	update c set c.CaseID = @@IDENTITY 
		from [Collection] c join inserted i on c.CollectionID = i.CollectionID