--DATE AND TIME Functions

select 
--high precision date and time functions
sysdatetime() as sysdttm,
sysdatetimeoffset() as sysdttmoffset,
sysutcdatetime() as sysdttmutc,
--low precision date and time functions
current_timestamp as crnttmstmp,
getdate() as getdt,
getutcdate() as getutcdt


declare @tdy date = getdate();
--select @tdy;
