CREATE TABLE [collections].[tasks_comments] (
    [id_task] NUMERIC (18)  NOT NULL,
    [date]    DATETIME      CONSTRAINT [DF_tasks_comments_date] DEFAULT (getdate()) NOT NULL,
    [comment] VARCHAR (512) NULL,
    CONSTRAINT [FK_tasks_comments_tasks] FOREIGN KEY ([id_task]) REFERENCES [collections].[tasks] ([id_task]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE UNIQUE CLUSTERED INDEX [PK_tasks_comments]
    ON [collections].[tasks_comments]([id_task] ASC, [date] ASC);

