create view UserCaseAssigment
                    as
                    SELECT c.*,w.WorkflowName,cp.PriorityName FROM dbo.[Case] c 
                    inner join Workflow w 
	                on w.WorkflowID = c.WorkflowID
                    inner join CasePriority cp 
	                    on cp.CasePriorityID = c.CasePriorityID	
                    WHERE c.StateID IN (
	                SELECT dbo.[WorkflowStateTransition].InitialStateID
		                FROM dbo.[UserStateTransition] INNER JOIN dbo.[WorkflowStateTransition] 
			                ON dbo.[UserStateTransition].WorkflowStateTransitionID = dbo.[WorkflowStateTransition].WorkflowStateTransitionID
		            WHERE dbo.[UserStateTransition].UserID = c.UserID
	                UNION
	                SELECT dbo.[WorkflowStateTransition].InitialStateID
		                FROM dbo.[RoleStateTransition] INNER JOIN dbo.[WorkflowStateTransition] 
			            ON dbo.[RoleStateTransition].WorkflowStateTransitionID = dbo.[WorkflowStateTransition].WorkflowStateTransitionID
		                WHERE dbo.[RoleStateTransition].RoleID IN (
			            SELECT dbo.[AspNetUserRoles].RoleId FROM dbo.[AspNetUserRoles] WHERE dbo.[AspNetUserRoles].UserId = c.UserID
		                )
                    )