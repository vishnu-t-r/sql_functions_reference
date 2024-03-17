use int_ques;

select * from cust_orders

/* Tip 1 */
--Alternative way to write case statement

select co.*,
		case when status = 'DELIVERED' then 'd'
			when status = 'SUBMITTED' then 's'
			when status = 'CREATED' then 'c'
			end as new_status
from cust_orders co

select co.*,
		case status 
		 when 'DELIVERED' then 'd'
			when 'SUBMITTED' then 's'
			when 'CREATED' then 'c'
			end as new_status
from cust_orders co

/* Tip 2 */ 
--Implementing boolean logic using iif instead of case

select co.*,
		case when status = 'DELIVERED' then 'is_delivered'
			else 'in_transit'
			end as new_status
from cust_orders co



select co.*, iif(status = 'DELIVERED', 'is_delivered', 'in_transit') as is_delivered
from cust_orders co

/* Tip 3 */
--Drag and drop columns
[Birth_Rate], [Business_Tax_Rate], 
[test_cluster], [CO2_Emissions],
[Country_Region_group], [Country_Region], 
[Days_to_Start_Business], [Ease_of_Business], 
[Energy_Usage_GDP_clusters], [Energy_Usage], [GDP], 
[Health_Exp_GDP], [Health_Exp_Capita], [Hours_to_do_Tax], 
[Infant_Mortality_Rate], [Internet_Usage], [Lending_Interest], 
[Life_Expectancy_Female], [Life_Expectancy_Male], [Mobile_Phone_Usage], 
[Number_of_Records], [Population_0_14], [Population_15_64], [Population_65], 
[Population_Total], [Population_Urban], [Region], [Tourism_Inbound], [Tourism_Outbound], [Year]

[cust_name], [order_id], [status]


/* Tip 4 */
--table details
--

exec sp_columns cust_orders;





/* Tip 5 */
--alternative to distinct
select distinct [status]
from cust_orders

select [status]
from cust_orders
group by [status]