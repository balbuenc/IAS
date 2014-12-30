CREATE TABLE [core].[users] (
    [id_user]    INT           IDENTITY (1, 1) NOT NULL,
    [login]      VARCHAR (50)  NOT NULL,
    [password]   VARCHAR (50)  NOT NULL,
    [id_group]   INT           NOT NULL,
    [status]     VARCHAR (1)   NOT NULL,
    [first_name] VARCHAR (128) NULL,
    [last_name]  VARCHAR (128) NULL,
    CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED ([id_user] ASC),
    CONSTRAINT [FK_users_groups] FOREIGN KEY ([id_group]) REFERENCES [core].[groups] ([id_group]) ON DELETE CASCADE ON UPDATE CASCADE
);

