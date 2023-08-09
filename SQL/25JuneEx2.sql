--Sort the employees by their last name, their salary and their hire date (3 separate queries)
	select * from employees
	order by last_name;
	
	select * from employees 
	order by salary desc;
	
	select * from employees
	order by hire_date; 
	
--4.How many employees are there? How many departments and job specialties? (give a name to the new columns)
select
	count( distinct employee_id) as number_of_employees,
	count( distinct department_id) as number_of_departments,
	count(distinct job_id) as job_specialties
from
	employees;

--a. What is the average salary of all employees? How much is the company paying for salaries in total?
select
	sum(salary) as total_salaries_for_company,
	avg(salary) as average_employee_salary
from
	employees; 
	
--b. Who is getting the highest and who the lowest salary? google gia mazi kai ta duo 
select first_name ,last_name,  max(salary) as highest_salary from employees 
group by first_name, last_name  
order by highest_salary desc
limit 1;

select first_name ,last_name, salary  from employees 
where salary = (select min(salary) from employees);

select first_name ,last_name,  min(salary) as lowest_salary from employees 
group by first_name, last_name  
order by lowest_salary asc 
limit 1;

-- where salary = (select max(salary) from employees) or salary=(select min(salary) from employees)

--a. How many employees are working in each department? find the five departments with the most of them.
select count(employee_id), departments.department_name  from employees 
inner join departments on employees.department_id = departments.department_id 
group by departments.department_name 
order by count(employee_id) desc 
limit 5; 

--b. Find the five specialties with the most employees, too.
select count(employee_id), jobs.job_title  from employees 
inner join jobs on employees.job_id  = jobs.job_id 
group by jobs.job_title 
order by count(employee_id) desc 
limit 5; 

-- c.Find how many employees were hired per department from 1990 to the end of 1995.
select count(employee_id), departments.department_name, max(hire_date) as hire_date  from employees
inner join departments on employees.department_id = departments.department_id 
where hire_date between '1990-01-01' and '1995-12-30'
group by departments.department_name ;


--5. How many employees does each manager supervise and what are the total salaries they manage?  
--We are interested only in managers with at least 2 supervisees.

select manager_id, count(distinct employee_id), sum(salary) from employees
group by manager_id
having count(distinct employee_id)>=2;

--6a. What is the lowest and highest salary for departments which have more than two employees?
select departments.department_name  , count(distinct employee_id), max(salary) from employees
--where salary = (select max(salary) from employees) --as max_salary
--where salary = (select min(salary) from employees) as min_salary
inner join departments on departments.department_id = employees.department_id 
group by departments.department_name 
having count(distinct employee_id)>2;
--mporousa mazi auta ta duo 
select department_id, count(distinct employee_id), min(salary) from employees
--where salary = (select max(salary) from employees) --as max_salary
--where salary = (select min(salary) from employees) as min_salary
group by department_id 
having count(distinct employee_id)>2;

--b. What is each specialty's average salary with more than one employee?
select job_id, count(distinct employee_id), avg(salary) from employees 
group by job_id
having count(distinct employee_id)>1;

--c. What about each department's average salary and total budget? sort them by average
select departments.department_name, sum(salary) as total_budget, avg(salary) from employees
inner join departments  on departments.department_id = employees.department_id 
group by departments.department_name 
order by avg(salary); 

--d. Filter the last question for departments with more than two employees and average salary higher than 6000.
select departments.department_name,count(distinct employee_id), sum(salary) as total_budget, avg(salary) from employees
inner join departments  on departments.department_id = employees.department_id 
group by departments.department_name 
having avg(salary)>6000 and count(distinct employee_id)>2
order by avg(salary)