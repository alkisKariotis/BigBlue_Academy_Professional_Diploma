
--Create a query that returns  employee id, first, last name salary and a new column named ‘’salary_category’’ that calculates salary category as following:
--‘’Associate’’ for salary =<3000
--‘’Senior’’ for 3000 <salary =<5000
--‘’Manager’’ for 5000<salary <10000
--‘’Executive’ for salary>=10000
--ordered by descending salary
select
	employee_id,
	first_name,
	last_name,
	salary,
	case 
when salary <= 3000 then 'Associate'
		when salary > 3000
		and salary <= 5000 then 'Senior'
		when salary > 5000
		and salary < 10000 then 'Manager'
		when salary >= 10000 then 'Executive'
	end as salary_category
from
	employees;
	
--Use above query as nested in a new one to group ‘’salary_category’’ and count employees per category
select
	count(*),
	salary_category
from
	(
	select
		employee_id,
		first_name,
		last_name,
		salary,
		case
			when salary <= 3000 then 'Associate'
			when salary > 3000
			and salary <= 5000 then 'Senior'
			when salary > 5000
			and salary < 10000 then 'Manager'
			when salary >= 10000 then 'Executive'
		end as salary_category
	from
		employees) as first_query
group by
	salary_category;

----Create a query that returns employee id, first name, last name from ‘’employees’’ table and its 
--dependants first name, last name and relationship from “dependents’’ table
select
	employees.employee_id,
	employees.first_name,
	employees.last_name,
	dependents.first_name ,
	dependents.last_name,
	dependents.relationship
from
	employees
left join dependents
on
	employees.employee_id = dependents.employee_id ;
	
--Create a Create a query that returns department_name, department_id and how many employees each department occupies
create or replace view fourth_query as
select departments.department_name,departments.department_id,  count(employees.employee_id), location_id 
from departments
inner join employees
on departments.department_id = employees.department_id
group by departments.department_id ;


select * from fourth_query 