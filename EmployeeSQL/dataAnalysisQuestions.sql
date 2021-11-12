--List the following details of each employee:
--employee number, last name, first name, sex, and salary
SELECT * FROM employees;
SELECT * FROM salaries;

SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT * FROM employees;
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information:
--department number, department name, the manager's employee number, last name, first name
SELECT * FROM employees;
SELECT * FROM dept_manager;
SELECT * FROM departments;

SELECT departments.dept_no, dept_name, dept_manager.emp_no, last_name, first_name
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
INNER JOIN employees
ON dept_manager.emp_no = employees.emp_no;

--List the department of each employee with the following information:
--employee number, last name, first name, and department name.
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM departments;

SELECT employees.emp_no, last_name, first_name, dept_name
FROM departments
INNER JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees
ON dept_emp.emp_no = employees.emp_no;

--List first name, last name, and sex for employees whose first name is
--"Hercules" and last names begin with "B."
SELECT * FROM employees;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number,
--last name, first name, and department name.
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM departments;

SELECT employees.emp_no, last_name, first_name, dept_name
FROM departments
INNER JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name IN ('Sales');

--List all employees in the Sales and Development departments, including their
--employee number, last name, first name, and department name.
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM departments;

SELECT employees.emp_no, last_name, first_name, dept_name
FROM departments
INNER JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name IN ('Sales', 'Development');

--In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.
SELECT * FROM employees;

SELECT last_name, COUNT(last_name) AS "Last Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC;