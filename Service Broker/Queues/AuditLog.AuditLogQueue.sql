﻿CREATE QUEUE [AuditLog].[AuditLogQueue]
WITH 
	STATUS = ON, 
	ACTIVATION (
		STATUS = ON, 
		MAX_QUEUE_READERS = 1,
		PROCEDURE_NAME = [AuditLog].[SP_AuditLogAsync],   
		EXECUTE AS OWNER
	);