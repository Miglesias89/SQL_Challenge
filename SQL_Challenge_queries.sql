/* Part1: Employee information including gender and salary */

SELECT * FROM salaries;

SELECT employees.emp_no, first_name, last_name, gender, salary FROM
employees
LEFT JOIN
salaries
ON employees.emp_no = salaries.emp_no;

/* Part 2: Employees hired in 1986 */
SELECT * FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'; 

/* Part 3: Department managers */

SELECT employees.emp_no, department_managers.dept_no, employees.first_name, employees.last_name,
	department_managers.from_date, department_managers.to_date
FROM employees 
INNER JOIN department_managers
ON employees.emp_no = department_managers.emp_no
INNER JOIN departments
ON department_managers.dept_no = departments.dept_no;

/*Part 4: Employee department information */

SELECT employees.emp_no, employees.first_name, employees.last_name,
	departments.dept_name
FROM employees 
INNER JOIN department_managers
ON employees.emp_no = department_managers.emp_no
INNER JOIN departments
ON department_managers.dept_no = departments.dept_no;

/*Part 5: Employees with the name Hercules and last name starting w/letter B*/

SELECT * FROM employees
WHERE first_name like 'Hercules'
AND last_name like 'B%';

/*Part 6: Employees in the Sale Department*/

SELECT employees.emp_no, employees.first_name, employees.last_name,
	departments.dept_name
FROM employees 
INNER JOIN dept_employees
ON employees.emp_no = dept_employees.emp_no
INNER JOIN departments
ON dept_employees.dept_no = departments.dept_no
WHERE dept_name = 'Sales';

/*Part 7: List of employees in sales and development*/

SELECT employees.emp_no, employees.first_name, employees.last_name,
	departments.dept_name
FROM employees 
INNER JOIN dept_employees
ON employees.emp_no = dept_employees.emp_no
INNER JOIN departments
ON dept_employees.dept_no = departments.dept_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

/*Part 8: List of employees that share a last name */

SELECT last_name, COUNT(last_name) AS "last name"
FROM employees
GROUP BY last_name
ORDER BY "last name" DESC;

