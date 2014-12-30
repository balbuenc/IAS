-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_tasks_by_user]
(
@p_id_user int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT		collections.tasks.id_task, 
				collections.tasks.id_user, 
				collections.tasks.task, 
				collections.tasks.status, 
				collections.tasks.start, 
				collections.tasks.finish, 
				collections.tasks_priorities.priority, 
				collections.task_types.type
	FROM        collections.tasks INNER JOIN collections.task_types ON collections.tasks.id_task_type = collections.task_types.id_task_type 
				INNER JOIN collections.tasks_priorities ON collections.tasks.id_priority = collections.tasks_priorities.id_priority
	WHERE collections.tasks.id_user = @p_id_user;

END