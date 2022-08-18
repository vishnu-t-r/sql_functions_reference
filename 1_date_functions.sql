---return current data and time(system date and time)
SELECT CURRENT_TIMESTAMP AS curnt_dte;


---DATEADD(interval,number,date)
---add specified interval*number to the date
SELECT DATEADD(month, 2, '2022-01-01') AS Date_Add;


---DATEDIFF(interval,date1,date2)
---time and date differnce output we can get
SELECT DATEDIFF(month, '2017/08/25', '2011/08/25') AS Date_Diff;
---time diff in hours
SELECT DATEDIFF(hour, '2017/08/25 07:00', '2017/08/25 12:45') AS Time_Diff;


---return the system(computer) date and time where sql server is running
select SYSDATETIME() as system_date_time;


---date from parts
---DATEFROMPARTS(year,month,day)
SELECT DATEFROMPARTS(2022,01,01) AS date_from_parts;


---DATENAME and DATEPART
---similar functions DATENAME output is string, DATEPART output is integer
--year
SELECT DATEPART(year, '2022-01-01') AS date_part_int;
SELECT DATENAME(year, '2022-01-01') AS date_part_str;
--month
SELECT DATEPART(month, '2022-01-01') AS date_part_int;
SELECT DATENAME(month, '2022-01-01') AS date_part_str;
--day
SELECT DATEPART(day, '2022-01-01') AS date_part_int;
SELECT DATENAME(day, '2022-01-01') AS date_part_str;



---below functions extract corresponding parts from the date
---DAY() - day of month
---MONTH() - month of year
---YEAR() - year from the date

---GETDATE()
---return current database systems date and time
---output format 'YYYY-MM-DD hh:mm:ss.mmm'
SELECT GETDATE() current_db_dt_tm;


---return utc date and time
SELECT GETUTCDATE() current_db_dt_tm;

---ISDATE()
---check if the column has valid date or not
---return 1 if valid, if not valid then return 0
SELECT ISDATE('2017') AS valid; -- valid
SELECT ISDATE(2017) AS valid; -- valid

SELECT ISDATE('2017-2-2') AS valid; -- valid
SELECT ISDATE('hello if valid') AS valid; -- 0, not valid


