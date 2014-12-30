CREATE TABLE [collections].[task_types] (
    [id_task_type] INT          IDENTITY (1, 1) NOT NULL,
    [type]         VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_task_types] PRIMARY KEY CLUSTERED ([id_task_type] ASC)
);

