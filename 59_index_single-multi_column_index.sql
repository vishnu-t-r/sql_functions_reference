
--single column index
create index ss_rowid_index
on Sample_Superstore (Row_ID);

--index on muliple columns
create index ss_multi_index
on Sample_Superstore (Row_ID,Order_ID);

create index ss_multi_index01
on Sample_Superstore (Product_ID,Order_ID);


--drop index
drop index Sample_Superstore.ss_multi_index;


--SELECT * FROM Sample_Superstore

--SELECT COUNT(*) FROM Sample_Superstore

--select distinct Row_ID,Order_ID from Sample_Superstore

EXECUTE sp_helpindex Sample_Superstore
