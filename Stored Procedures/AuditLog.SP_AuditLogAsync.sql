CREATE PROCEDURE [AuditLog].[SP_AuditLogAsync]
AS
BEGIN
    DECLARE @message_type varchar(100)
    DECLARE @dialog uniqueidentifier, @message_body XML;
    WHILE (1 = 1)
    BEGIN -- Receive the next available message from the queue
    WAITFOR (
                RECEIVE TOP(1) @message_type = message_type_name,
                @message_body = CAST(message_body AS XML),
                @dialog = conversation_handle
    FROM [AuditLog].[AuditLogQueue] ), TIMEOUT 500    if (@@ROWCOUNT = 0 OR @message_body IS NULL)
    BEGIN
                BREAK
    END
    ELSE
                BEGIN
                            --process xml message here...
                            INSERT INTO [ChangeLog].[ChangeLogs](Data) values(CAST(@message_body AS NVARCHAR(MAX)))
                END
    END CONVERSATION @dialog
    END
END