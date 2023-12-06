--inbuild stored procedure to get the script of view

--sp_helptext

use int_ques;

create view test_employee_view 
with schemabinding, encryption
as
select first_name,
		last_name,
		salary,
		department
from [dbo].[Employee]
where department in ('hr','admin')


exec sp_helptext 'test_employee_view'


drop view test_employee_view

