--create a new db for json files only
--CREATE DATABASE json_learn;

--create table authors
/*
CREATE TABLE authors (
    id INT IDENTITY NOT NULL PRIMARY KEY,
    authorname NVARCHAR(MAX),
    age INT,
    skillsets NVARCHAR(MAX),
    numberofposts INT
);

INSERT INTO authors (authorname,age,skillsets,numberofposts) 
VALUES ('Geek',25,'Java,Python,.Net',5),
('Geek2',22,'Android,Python,.Net',15),
('Geek3',23,'IOS,GO,R',10),
('Geek4',24,'Java,Python,GO',5);
GO
*/

--json documnetns can be stored in nvarchar columns
--nvarchar(max) can store data upto 2GB
--if data is huge then use nvarchar(4000)

--example json data
declare @jsondata nvarchar(max);
set @jsondata = '{
"Information": {"SchoolDetails": 
     [{"Name": "VidhyaMandhir"}, {"Name": "Chettinad"}, {"Name":"PSSenior"}]
  }}';

--SELECT @jsondata as json_data;

--function_1
--ISJSON
--function check whether input file is json or not
--return 1 if json and 0 if not
/*
SELECT ISJSON(@jsondata) as validjson;
*/

--function 2
--JSON_VALUE(json string, path)
--return a scalar value (one value)

--‘$’ – reference entire JSON object
--‘$.Example1’ – reference Example1 in JSON object
--‘$[4]’ – reference 4th element in JSON array
--‘$.Example1.Example2[2].Example3’ – reference nested property in JSON object

/*
SELECT json_value(@jsondata,'$')
SELECT json_value(@jsondata,'$.Information.SchoolDetails[0].Name')
SELECT json_value(@jsondata,'$.Information.SchoolDetails[1].Name')
*/

--function 3
--JSON_QUERY(json, path)
--return an array of data from the json object


--SELECT json_query(@jsondata,'$.Information.SchoolDetails') AS school_list
--SELECT json_query(@jsondata,'$.Information') as school_details
--SELECT json_query(@jsondata,'$') as school_info


--function 4
--json_modify(json, path, value)
--to update values in json file

/*
SET @jsondata = json_modify(@jsondata,'$.Information.SchoolDetails[2].Name','mgsss');
select modifiedjson = @jsondata;
*/

--function 5
--FOR JSON
--export sql server data in json format (two options AUTO and PATH)

/*
select * from authors;

select * from authors for json auto;

SELECT * FROM authors for json auto, root('author info');
*/


--funtion 6
--OPENJSON
--import json as string data


declare @json nvarchar(max);
set @json = '{
				"id":1,
				"name":"toto",
				"age":50,
				"skills":{
						"skill1":"data1",
						"skill2":"data2",
						"skill3":"data3"
						},
				"noofposts":10
				}'

select * FROM OPENJSON (@json)
Select * FROM OPENJSON (@json,  '$.skills')


--making skills in seperate columns

/*
select * from openjson(@json,'$.skills')
with (skill1 varchar(25), skill2 varchar(25), skill3 varchar(25))
*/

--insert this column values into a table (here skillsettable)
/*
use json_learn;

select * into skillsettable from openjson(@json,'$.skills')
with (skill1 varchar(25), skill2 varchar(25), skill3 varchar(25))

select * from skillsettable
*/

