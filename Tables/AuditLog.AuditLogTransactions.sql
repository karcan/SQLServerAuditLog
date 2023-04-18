CREATE TABLE [AuditLog].[AuditLogTransactions]
(
	[ID]				BIGINT					NOT NULL		IDENTITY(1, 1),
	[SchemaName]		NVARCHAR (128)			NOT NULL,
	[TableName]			NVARCHAR (128)			NOT NULL,
	[Action]			NVARCHAR (11)			NOT NULL		CONSTRAINT [CHK_AuditLogTransactions_Action] CHECK ([Action] IN ('INSERT', 'UPDATE', 'HARD DELETE', 'SOFT DELETE')),				
	[CreatedDate]		DATETIMEOFFSET (7)		NOT NULL		CONSTRAINT [DF_AuditLogTransactions_CreatedDate] DEFAULT (SYSDATETIME())

	CONSTRAINT [PK_AuditLogTransactions]
		PRIMARY KEY ([ID])
);

GO
CREATE NONCLUSTERED INDEX [IX_AuditLogTransactions_Action_CreatedDate_SchemaName_TableName]
ON [AuditLog].[AuditLogTransactions] ([Action] ASC, [CreatedDate] ASC, [SchemaName] ASC, [TableName] ASC)
WITH (FILLFACTOR = 70, PAD_INDEX = ON)

GO
CREATE NONCLUSTERED INDEX [IX_AuditLogTransactions_Action_SchemaName_TableName_CreatedDate]
ON [AuditLog].[AuditLogTransactions] ([Action] ASC, [SchemaName] ASC, [TableName] ASC, [CreatedDate] ASC)
WITH (FILLFACTOR = 70, PAD_INDEX = ON)

GO
CREATE NONCLUSTERED INDEX [IX_AuditLogTransactions_SchemaName_TableName_Action_CreatedDate]
ON [AuditLog].[AuditLogTransactions] ([SchemaName] ASC, [TableName] ASC, [Action] ASC, [CreatedDate] ASC)
WITH (FILLFACTOR = 70, PAD_INDEX = ON)