--DATASET : HR

--select all columns 
select
	*
from
	employees;


--select all columns order by salary
select
	*
from
	employees
order by
	salary;


--select all columns order by salary descending
select
	*
from
	employees
order by
	salary desc;


--select columns of choice  
select
	first_name,
	last_name,
	salary
from
	employees


--select columns of choice in alphabetical order by first_name 
select
	first_name,
	last_name,
	salary
from
	employees
order by
	first_name


--select all distinct values in first_name column
select
	distinct first_name
from
	employees;


--select all distinct PAIRS from first_name & last_name columns
select
	distinct first_name,
	last_name
from
	employees;


--select first_name, last_name, salary from  employees where salary>10000
select
	first_name,
	last_name,
	salary
from
	employees
where
	salary>10000;


-- find only 'John'
select
	first_name,
	last_name
from
	employees
where
	first_name = 'John';


-- those who start with 'Jo'
select
	first_name,
	last_name
from
	employees
where
	first_name like 'Jo%';


-- those who start with 'Jo' followed by AT LEAST 3 more characters
select
	first_name,
	last_name
from
	employees
where
	first_name like 'Jo___%';


-- those who start with 'Jo' followed by EXACT 2 more characters
select
	first_name,
	last_name
from
	employees
where
	first_name like 'Jo__';


-- those finishing to 's'
select
	first_name,
	last_name
from
	employees
where
	last_name like '%s';


-- those finishing to 's' AND ALSO have salary greater than 12000
select
	first_name,
	last_name,
	salary
from
	employees
where
	last_name like '%s'
	and salary>12000;


-- those finishing to 's' AND ALSO have salary greater or equal to 12000
select
	first_name,
	last_name,
	salary
from
	employees
where
	last_name like '%s'
	and salary >= 12000;


--those with salary from 5000 to 10000
select
	first_name,
	last_name,
	salary
from
	employees
where
	salary between 5000 and 10000;


--select those whose department is in list 
select
	first_name,
	last_name
from
	employees
where
	department_id in (1, 2, 8, 9);


--select those whose department is NOT in list 
select
	first_name,
	last_name
from
	employees
where
	department_id not in (1, 2, 8, 9);


--how many rows?
select
	count(*)
from
	employees;


--how many non null in column phone_number 
select
	count(phone_number)
from
	employees;


--how many non null distinct values in column department_id 
select
	count(distinct(department_id))
from
	employees;



--how much is the sum of all salaries
select
	sum(salary)
from
	employees;


--how much is the average salary
select
	avg(salary)
from
	employees;




--how much is the min salary
select
	min(salary)
from
	employees;


-- show headcound and average salary per department.
select department_id, 
	count(employee_id),
	avg(salary) 
from
	employees
group by
	department_id 



-- show headcound and average salary per department only for departments with 2 or more employees
select department_id, 
	count(employee_id),
	avg(salary) 
from
	employees
group by
	department_id 
having count(employee_id)>1
order by department_id 


-- show headcound and average salary per department only for departments with 2 or more employees,employee_id 
--and short from higher to lower average salary

select department_id, 
	count(employee_id),
	avg(salary) 
from
	employees
group by
	department_id 
having count(employee_id)>1
order by department_id 


-- show headcound and average salary per department only for departments with 2 or more employees,employee_id 
--and short from higher to lower average salary. Then rename columns with proper names
--rename columns with proper names

select department_id 
as departmet, 
	count(employee_id) as headcount,
	avg(salary) average_salary
from
	employees
group by
	department_id 
having count(employee_id)>1
order by department_id 
