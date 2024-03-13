# 1. Найдите количество сотрудников мужского пола (M) и женского пола (F) и 
# выведите записи в порядке убывания по количеству сотрудников.
SELECT gender,count(emp_no) FROM employees 
GROUP BY gender
order by count(emp_no) desc;

# 2 Найдите среднюю зарплату в разрезе должностей сотрудников (title), 
#округлите эти средние зарплаты до 2 знаков после запятой и выведите записи в порядке убывания.
SELECT a.title,ROUND(AVG(b.salary),2) as Salary FROM titles a
JOIN salaries b
ON a.emp_no=b.emp_no
GROUP BY a.title
ORDER BY Salary desc;

# 3 Вывести месяцы (от 1 до 12), и количество нанятых сотрудников в эти месяцы.
SELECT month(hire_date),count(emp_no) from employees
group by month(hire_date)
order by month(hire_date);

# 4  Сформируйте запрос, который соединяет employees, dept_emp, departments и titles, 
#чтобы показать имена и фамилии сотрудников, названия их отделов и их текущие должности 
#(именно текущие должности, то есть фильтр по таблице titles, столбец to_date).
SELECT a.emp_no,a.first_name,a.last_name,c.dept_name,d.title FROM employees a
JOIN dept_emp b
ON a.emp_no=b.emp_no
JOIN departments c
ON b.dept_no=c.dept_no
JOIN titles d
ON a.emp_no=d.emp_no
WHERE d.to_date = '9999-01-01';
SELECT * FROM titles;

# 5 Используйте Self JOIN в таблице employees, чтобы найти пары сотрудников с одинаковыми фамилиями. 
# Отобразите их имена и фамилии.
SELECT a.first_name,a.last_name,b.first_name,b.last_name
FROM employees a
JOIN employees b
ON a.emp_no!=b.emp_no and a.last_name=b.last_name;

