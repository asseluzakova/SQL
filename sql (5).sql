#1 все женщины, у которых emp_no заканчивается на 7
SELECT * FROM employees
WHERE emp_no LIKE '%7';

#2 emp_no сотрудников, кто не работал в департаменте d005
SELECT emp_no FROM dept_emp
WHERE dept_no not in('d005');

#3 все названия департаментов, где есть буквы ‘u’ и ‘o’
SELECT dept_name FROM departments
WHERE dept_name LIKE '%u%o%';

#4 имена всех сотрудников, где есть либо ‘z’ либо ‘t’
SELECT first_name FROM employees
WHERE first_name LIKE '%z%' OR '%t%';

#5 все фамилии сотрудников, которые были наняты на работу между ‘1993-01-15’ и ‘1993-12-31’
SELECT last_name FROM employees
WHERE hire_date BETWEEN '1993-01-15' AND '1993-12-31';

#6 список со всеми сотрудницами, чье имя Kellie 
#gender = 'F' ставить обезательно там есть и мужчины с таким именем
SELECT * FROM employees
WHERE gender = 'F' 
AND first_name = 'Kellie';

#7 список со всеми сотрудницами, чье имя Kellie или Aruna
SELECT * FROM employees
WHERE gender = 'F' 
AND (first_name = 'Kellie' OR first_name = 'Aruna');

#8 где зарплатa между 66 000 и 70 000 долларов
SELECT * FROM salaries
WHERE salary BETWEEN 66000 AND 70000;