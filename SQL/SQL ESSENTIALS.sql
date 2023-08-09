--Find first and last name of employees whose first name starts with “J”
select
	first_name,
	last_name
from
	employees
where
	first_name like 'J%';

--Find first and last name of employees whose first name starts with “J” and has more than 4 letters.
select
	first_name,
	last_name
from
	employees
where
	first_name like 'J____%';

--Find first name ,last name and department of employees whose First name starts with “J” and has more than 4 lettersAND They do not belong in department ‘’10’’.
select
	first_name,
	last_name,
	department_id 
from
	employees
where
	first_name like 'J____%' and department_id <> 10 ;

--Alternative solution for the above with inner join 
select
	first_name,
	last_name,
	departments.department_name
	--employees.department_id --how to hide?//////////////////////////////////////////////////////// δεν ετρεχε πολλες φορες επειδη ηταν κατω στην συνθηκη! 
from
	employees
	inner join departments on employees.department_id  = departments.department_id 
where
	first_name like 'J____%' and employees.department_id <> 10;
	
--Find first name ,last name and salary and manager id of employees whose Salary is between 5k and 10k AND Belong to manager ‘’100”
select
	first_name,
	last_name,
	salary,
	manager_id
from
	employees
where
	salary between 5000 and 10000
	and manager_id = 100;

--Find the first 3 employees whose telephone number is NULL in alphabetical order of their first names
select
	first_name,
	last_name,
	phone_number
from
	employees
where
	phone_number is null
order by
	first_name
limit 3;

--How many employees appear in the ‘’employees’’ table?
select
	count(employee_id) as number_of_employees
from
	employees;
	
--How many employees appear in the ‘’employees’’ table whose first name ends with “n”?
select
	count(first_name) as number_of_employees_condition
from
	employees
where
	first_name like '%n';
	
--How many different managers appear in the ‘’employees’’ table?
select
	count(distinct manager_id) as distinct_managers
from
	employees; 
	--does not count null 
	
--How many employees work for each department and whats the average salary for each one?
	select
	department_id ,
	count(employee_id) as Number_of_employees_in_department,
	avg(salary) as Average_salary
from
	employees
group by
	department_id;
	
--Find the department with the greatest total of salaries. What is the average salary for this department?
select
	department_id as id ,
	max((select sum(salary) from employees group by department_id)),
	--Giati ERROR!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	avg(salary) as average_salary
from
	employees
group by
	department_id;
--limit 1;

--Alternative Solution for the above showing the department name.
select
departments.department_name, 	
sum(salary) as sum_salaries,
avg(salary) as average_salary	
from
	employees
inner join departments on employees.department_id = departments.department_id 
group by
	departments.department_name 
order by
	sum(salary) desc
limit 1;
	