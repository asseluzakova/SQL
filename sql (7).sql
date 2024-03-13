#1
SELECT a.emp_no,a.first_name,a.last_name,b.dept_no
FROM employees a
JOIN dept_emp b
ON a.emp_no=b.emp_no;

#2
SELECT a.emp_no,b.dept_no
FROM employees a
LEFT JOIN dept_manager b
ON a.emp_no=b.emp_no;

#3
SELECT a.dept_no,b.emp_no
FROM departments a
RIGHT JOIN dept_emp b
ON a.dept_no=b.dept_no;

#4
SELECT a.emp_no,AVG(b.salary) as Salary
FROM employees a
JOIN salaries b
ON a.emp_no=b.emp_no
GROUP BY a.emp_no;
