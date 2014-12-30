CREATE TABLE [collections].[tasks_priorities] (
    [id_priority] INT          IDENTITY (1, 1) NOT NULL,
    [priority]    VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_tasks_prioirities] PRIMARY KEY CLUSTERED ([id_priority] ASC)
);

