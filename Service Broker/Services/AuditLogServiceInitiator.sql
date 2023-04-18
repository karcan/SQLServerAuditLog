CREATE SERVICE [AuditLogServiceInitiator]
	AUTHORIZATION [dbo]
	ON QUEUE [AuditLog].[AuditLogQueue]
	(
		[AuditLogContract]
	)
