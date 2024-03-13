SELECT * FROM employees; #1

SELECT * FROM employees
WHERE gender='M'; #2

SELECT * FROM employees
WHERE first_name='Elvis'; #3

SELECT DISTINCT(title) FROM titles; #4

SELECT * FROM employees s
WHERE YEAR(s.hire_date)=2000; #5

SELECT * FROM employees s
WHERE YEAR(CURDATE())-YEAR(s.birth_date)>60; #6

SELECT COUNT(*) FROM salaries; #7

SELECT COUNT(*) FROM salaries
WHERE salary>100000; #8