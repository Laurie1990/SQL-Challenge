/* SQL Script to create tables and then check data once it has been uploaded*/

CREATE TABLE departments (
dept_no VARCHAR(30) PRIMARY KEY,
dept_name VARCHAR(30) NOT NULL
);

SELECT * FROM departments

/*--------------------------------------------------------*/

CREATE TABLE titles (
title_id VARCHAR(30) PRIMARY KEY NOT NULL,
title VARCHAR(30) NOT NULL);

SELECT * FROM titles
/*--------------------------------------------------------*/

CREATE TABLE employees (
emp_no INT PRIMARY KEY NOT NULL,
title_id VARCHAR(30) NOT NULL,
birth_date DATE NULL,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
sex VARCHAR(30) NOT NULL,
hire_date DATE NOT NULL,
CONSTRAINT title_id 
	FOREIGN KEY (title_id) 
		REFERENCES titles(title_id));


SELECT * FROM employees


/*--------------------------------------------------------*/
DROP TABLE dept_emp

CREATE TABLE dept_emp (
emp_no INT NOT NULL,
dept_no VARCHAR(30) NOT NULL,
dep_emp_id SERIAL PRIMARY KEY,
CONSTRAINT emp_no 
	FOREIGN KEY (emp_no) 
		REFERENCES employees(emp_no),
CONSTRAINT dept_no 
	FOREIGN KEY (dept_no) 
		REFERENCES departments(dept_no));

SELECT * FROM dept_emp


/*--------------------------------------------------------*/
DROP TABLE dept_manager

CREATE TABLE dept_manager (
manager_id SERIAL PRIMARY KEY,
dept_no VARCHAR(30) NOT NULL,
emp_no INT NOT NULL,
CONSTRAINT fk_dept_id 
	FOREIGN KEY (dept_no) 
		REFERENCES departments(dept_no),
CONSTRAINT fk_emp_id 
	FOREIGN KEY (emp_no) 
		REFERENCES employees(emp_no));

SELECT * FROM dept_manager


/*--------------------------------------------------------*/

/*--------------------------------------------------------*/
DROP TABLE salaries

CREATE TABLE salaries (
sal_id SERIAL PRIMARY KEY,
emp_no INT NOT NULL,
salary INT NOT NULL,
CONSTRAINT emp_no 
	FOREIGN KEY (emp_no) 
		REFERENCES employees(emp_no));

SELECT * FROM salaries



/*--------------------------------------------------------*/
