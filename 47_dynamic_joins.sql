--dynamic joins
--table name - 'lookup_server'
select * from lookup_server

--table name - 'server-asset'
select * from server_asset

--normal  query
select a.*,b.category
from server_asset a
LEFT outer join
lookup_server b
on ISNULL(a.ServerType,'') = isnull(b.ServerType,'')
and isnull(a.manufacturer,'') = isnull(b.manufacturer,'')
and isnull(a.OS,'') = isnull(b.OS,'')	


--modified query

select a.*,b.category
from server_asset a
left outer join
lookup_server b
on ISNULL(a.ServerType,'') = isnull(b.ServerType,'')
and case when b.manufacturer is null then  isnull(b.manufacturer,'')
		else isnull(a.manufacturer,'') end
	= isnull(b.manufacturer,'')
and isnull(a.OS,'') = isnull(b.OS,'')




select a.*,b.category
from server_asset a
left outer join
lookup_server b
on ISNULL(a.ServerType,'') = isnull(b.ServerType,'')
and case when b.manufacturer is null then  isnull(a.manufacturer,'')
		else isnull(b.manufacturer,'') end
	= isnull(a.manufacturer,'')
and isnull(a.OS,'') = isnull(b.OS,'')



/*
CREATE TABLE #lookup(
ServerType		VARCHAR(100),
manufacturer	VARCHAR(100),
OS				VARCHAR(100),
Category		VARCHAR(100)
)
GO

INSERT #lookup VALUES ('VM',NULL,NULL,'Generic VM')
INSERT #lookup VALUES ('VM',NULL,'Windows','Windows VM')
INSERT #lookup VALUES ('VM',NULL,'Linux','Linux VM')
INSERT #lookup VALUES ('Server','Dell','Windows','Windows Server')
INSERT #lookup VALUES ('Server','HP','Redhat','Linux Server')
INSERT #lookup VALUES ('Server',NULL,'Redhat','Linux Server')

CREATE TABLE #Data(
ServerType		VARCHAR(100),
ServerName		VARCHAR(100),
manufacturer	VARCHAR(100),
OS				VARCHAR(100)
)
GO 

INSERT #Data VALUES ('VM','VMPrint1','VMWare',NULL)
INSERT #Data VALUES ('VM','Server2','VMWare',NULL)
INSERT #Data VALUES ('VM','DC1',NULL,'Windows')
INSERT #Data VALUES ('Server','SQL_WH1','Dell','Windows')
INSERT #Data VALUES ('Server','ZZWEBApp02','Dell','Windows')
INSERT #Data VALUES ('Server','BuildServer2',NULL,'Windows')
INSERT #Data VALUES ('VM','DC2',NULL,'RedHat')
INSERT #Data VALUES ('Server','SQL_WH12','Dell','Windows')
INSERT #Data VALUES ('Server','WEB1_Dev','HP','Windows')
INSERT #Data VALUES ('Server','BuildServer5',NULL,NULL)
GO

*/