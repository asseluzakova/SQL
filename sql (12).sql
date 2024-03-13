#1. Создание простого View: Напишите SQL-запрос для создания представления (View), 
#которое отображает имена и фамилии всех сотрудников.
CREATE VIEW fl_employees AS
SELECT first_name,last_name FROM employees;

#2. View с JOIN: Создайте представление, которое объединяет таблицы employees и salaries, 
#показывая идентификатор сотрудника, его имя, фамилию и текущую зарплату.
CREATE VIEW empl_salaries AS
SELECT e.emp_no,e.first_name,e.last_name,s.salary FROM employees e
JOIN salaries s
ON e.emp_no=s.emp_no
WHERE s.to_date='9999-01-01';

#3. View для агрегированных данных: Создайте представление, которое показывает среднюю зарплату по каждому отделу.
CREATE VIEW avg_salary_dept AS
SELECT d.dept_no,AVG(salary) AS Salary FROM salaries s
JOIN dept_emp d
ON s.emp_no=d.emp_no
GROUP BY dept_no
ORDER BY dept_no;

#4. Комбинированный View с JOIN и WHERE: Создайте представление, 
#которое отображает информацию о сотрудниках, работающих в отделе 'Sales'.
CREATE VIEW sales_empl AS
SELECT e.*FROM employees e
JOIN dept_emp de 
ON e.emp_no=de.emp_no
JOIN departments d
ON de.dept_no=d.dept_no
WHERE d.dept_name='Sales';