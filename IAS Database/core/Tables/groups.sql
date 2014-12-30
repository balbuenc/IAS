CREATE TABLE [core].[groups] (
    [id_group] INT          IDENTITY (1, 1) NOT NULL,
    [group]    VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_groups] PRIMARY KEY CLUSTERED ([id_group] ASC)
);

