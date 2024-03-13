/*1. Определение наивысшей текущей зарплаты в каждом отделе (для подсчета текущей зарплаты, используем фильтр WHERE to_date = '9999-01-01'):
- Цель: Найти наивысшую текущую зарплату в каждом отделе.
- Таблицы для использования: salaries (содержит информацию о зарплатах сотрудников), dept_emp (содержит информацию о том, к каким отделам относятся сотрудники).
- Колонки для отображения: Идентификатор сотрудника (emp_no), зарплата (salary), номер отдела (dept_no), наивысшая зарплата в отделе (max_salary_in_dept).*/
SELECT s.emp_no,s.salary,d.dept_no,max(salary) over (partition by d.dept_no) as max_salary_in_dept FROM salaries s
JOIN dept_emp d ON s.emp_no=d.emp_no
WHERE s.to_date='9999-01-01';

/*2. Сравнение зарплаты каждого сотрудника с средней зарплатой в их отделе:
- Цель: Сравнить зарплату каждого сотрудника с средней зарплатой в его/ее отделе.
- Таблицы для использования: salaries, dept_emp.
- Колонки для отображения: Идентификатор сотрудника (emp_no), зарплата (salary), номер отдела (dept_no), средняя зарплата в отделе (avg_salary_in_dept).*/
SELECT s.emp_no,s.salary,d.dept_no,avg(salary) over (partition by d.dept_no) as avg_salary_in_dept FROM salaries s
JOIN dept_emp d ON s.emp_no=d.emp_no;

/*3. Ранжирование сотрудников в отделе по стажу работы:
- Цель: Ранжировать сотрудников в каждом отделе по длительности их работы в компании.
- Таблицы для использования: employees (содержит информацию о сотрудниках, включая дату найма), dept_emp.
- Колонки для отображения: Идентификатор сотрудника (emp_no), дата найма (hire_date), номер отдела (dept_no), 
ранг опыта (experience_rank). То есть мы хотим разделить на партиции по департаменту и сортировать по hire_date.*/
SELECT e.emp_no,e.hire_date,d.dept_no,dense_rank() OVER (partition by d.dept_no ORDER BY e.hire_date) as experience_rank 
FROM employees e 
JOIN dept_emp d ON e.emp_no=d.emp_no;
