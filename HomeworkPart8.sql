--creating and combining tables to complete #1 homework task
Drop Table emp_info;
Create Table emp_info (

	emp_no INTEGER NOT NULL,
	emp_title VARCHAR (30) not null,
	birth_date Date not null,
	first_name VARCHAR (30) not null,
	last_name VARCHAR (30) not null,
	sex VARCHAR,
	hire_date Date not null,
	Primary Key (emp_no)
);
Select * from emp_info

Drop Table emp_salary;
Create Table emp_salary (

	emp_no INTEGER NOT NULL,
	salary INTEGER not null
	
);

Select * from emp_salary
-- joining tables for answer to Part 1:

Create Table Part1 as
Select emp_info.emp_no, emp_info.last_name, emp_info.first_name, emp_info.sex, emp_salary.salary
From emp_info
Inner Join emp_salary on
emp_info.emp_no = emp_salary.emp_no;
Select * from Part1

-- filtering emp_info table to get employees hired in 1986 Part 2
Select emp_no, first_name, last_name, hire_date
From emp_info
Where hire_date >= '1986-1-1' and hire_date <= '1986-12-31'

--Part 3 Manager of each Department and details of each manager

Drop Table departments;
Create Table departments (

	dept_no VARCHAR(10) NOT NULL,
	dept_name VARCHAR(30) not null
);
Select * from departments

Drop Table emp_ids;
Create Table emp_ids (

	emp_no integer NOT NULL,
	dept_no VARCHAR(10) not null
);
Select * from emp_ids

Create Table managers (
	dept_no VARCHAR (10) NOT NULL,
	emp_no integer not null
);

Select * from managers
-- Final results for Part #3
Create Table Part3 as
Select managers.emp_no, managers.dept_no, departments.dept_name, emp_info.first_name, emp_info.last_name
From managers
Inner Join departments on
managers.dept_no = departments.dept_no
Inner Join emp_info on
managers.emp_no = emp_info.emp_no;
Select * from Part3
-- Joining tables for Part #4

Create Table Part4 as
Select emp_ids.emp_no, emp_info.last_name, emp_info.first_name, departments.dept_name
from emp_ids
Inner Join emp_info on
emp_ids.emp_no = emp_info.emp_no
Inner Join departments on
emp_ids.dept_no = departments.dept_no;
Select * from Part4

-- Part #5 First name = Hercules, last name start with B
Create Table Part5 as
Select first_name, last_name, sex
From emp_info
where first_name = 'Hercules' and last_name like 'B_%';
Select * from Part5
-- Joining tables for Part #6 filtering down to only the Sales department

Create Table Part6 as
Select emp_ids.emp_no, emp_info.last_name, emp_info.first_name, departments.dept_name
from emp_ids
Inner Join emp_info on
emp_ids.emp_no = emp_info.emp_no
Inner Join departments on
emp_ids.dept_no = departments.dept_no
where departments.dept_name = 'Sales';
Select * from Part6

-- Joining tables for Part #7 filtering down to only the Sales and Development departments

Create Table Part7 as
Select emp_ids.emp_no, emp_info.last_name, emp_info.first_name, departments.dept_name
from emp_ids
Inner Join emp_info on
emp_ids.emp_no = emp_info.emp_no
Inner Join departments on
emp_ids.dept_no = departments.dept_no
where departments.dept_name = 'Development' or departments.dept_name = 'Sales';
Select * from Part7
-- #8 listing the count of employees sharing the same last name in descending order.
Create Table Part8 as
Select Distinct last_name, Count (last_name) as count
from emp_info
Group by last_name
Order by count desc
Select * from Part8

