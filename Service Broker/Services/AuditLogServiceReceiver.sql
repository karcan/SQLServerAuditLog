CREATE SERVICE [AuditLogServiceReceiver]
	AUTHORIZATION [dbo]
	ON QUEUE [AuditLog].[AuditLogQueue]
	(
		[AuditLogContract]
	)
