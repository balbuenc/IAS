CREATE TABLE [collections].[tasks] (
    [id_task]      NUMERIC (18)  IDENTITY (1, 1) NOT NULL,
    [id_user]      INT           NOT NULL,
    [task]         VARCHAR (512) NOT NULL,
    [id_priority]  INT           NOT NULL,
    [status]       VARCHAR (50)  NOT NULL,
    [start]        DATETIME      CONSTRAINT [DF_tasks_start] DEFAULT (getdate()) NOT NULL,
    [finish]       DATETIME      NOT NULL,
    [id_task_type] INT           NOT NULL,
    CONSTRAINT [PK_tasks] PRIMARY KEY CLUSTERED ([id_task] ASC),
    CONSTRAINT [FK_tasks_task_types] FOREIGN KEY ([id_task_type]) REFERENCES [collections].[task_types] ([id_task_type]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_tasks_tasks_prioirities] FOREIGN KEY ([id_priority]) REFERENCES [collections].[tasks_priorities] ([id_priority]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_tasks_users] FOREIGN KEY ([id_user]) REFERENCES [core].[users] ([id_user]) ON DELETE CASCADE ON UPDATE CASCADE
);

