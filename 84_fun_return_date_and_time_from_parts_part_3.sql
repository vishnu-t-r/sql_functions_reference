-- function that return date and time from parts

select 
datefromparts('2023','12','12') as dtfrmparts,
datefromparts(2023,12,12) as dtfrmparts1, --both works,
datetimefromparts(2023,12,12,06,30,25,00) as dttmfrmparts,
timefromparts(12,30,45,0,0) as tmfrmparts,

--
