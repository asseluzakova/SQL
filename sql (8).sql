#1 список всех менеджеров, а именно их emp_no, имена/фамилии, номер департамента, который они курируют, и дату найма в компанию. 
SELECT a.emp_no,a.first_name,a.last_name,b.dept_no,b.from_date FROM employees a
JOIN dept_manager b
ON a.emp_no=b.emp_no;

#2 Существует ли сотрудник по фамилии Markovitch, 
#который когда-то был менеджером департамента. Может быть таких сотрудников несколько?
SELECT a.last_name,b.dept_no FROM employees a
JOIN dept_manager b
ON a.emp_no=b.emp_no
WHERE a.last_name='Markovitch';

#3 Вывести список сотрудников, имена/фамилии, дату найма, должность в компании, 
#у которых имя начинается на М, а фамилия заканчивается на H.
SELECT a.first_name,a.last_name,b.from_date,b.title FROM employees a
JOIN titles b
ON a.emp_no=b.emp_no
WHERE a.first_name LIKE 'M%' AND a.last_name LIKE '%h';

#4 Создайте временную таблицу на основе salaries, где у вас будет emp_no и 
#его/ее максимальная и минимальная зарплата за весь период работы в компании. 
#Далее сделайте JOIN используя эту временную таблицу и таблицу employees 
#чтобы получить список сотрудников, их имена/фамилии, и их мин/макс зарплат.
CREATE temporary TABLE salaries2
SELECT emp_no,max(salary) as salary
FROM salaries
GROUP BY  emp_no;
drop table salaries2;

SELECT a.emp_no,a.first_name,a.last_name,b.salary FROM employees a
JOIN salaries2 b
ON a.emp_no=b.emp_no;

