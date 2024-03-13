#1
SELECT emp_no FROM employees
WHERE gender='M'
UNION ALL
SELECT emp_no FROM dept_manager;

#2
SELECT distinct title FROM titles
UNION
SELECT dept_name FROM departments;

#3
(SELECT e.first_name,salary FROM salaries a
JOIN employees e
ON a.emp_no=e.emp_no
WHERE salary>60000)
UNION
(SELECT em.first_name,salary FROM salaries b
JOIN employees em
ON b.emp_no=em.emp_no
WHERE salary<40000);

#4
(SELECT em.first_name,em.last_name, d.to_date as status from dept_emp d
JOIN employees em
ON d.emp_no=em.emp_no
WHERE to_date='9999-01-01')
UNION
(SELECT e.first_name,e.last_name, de.to_date as status from dept_emp de
JOIN employees e
ON de.emp_no=e.emp_no
WHERE to_date!='9999-01-01');

#5
SELECT emp_no as type,avg(salary) as avg_salary FROM salaries
WHERE emp_no not in(SELECT emp_no FROM dept_manager) 
GROUP BY emp_no
UNION
SELECT emp_no as type,avg(salary) as avg_salary FROM salaries
WHERE emp_no  in(SELECT emp_no FROM dept_manager)
GROUP BY emp_no ;