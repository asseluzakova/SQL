/*1.Нахождение следующей должности каждого сотрудника:
- Цель: Определить, какая должность будет следующей для каждого сотрудника в ходе их карьеры.
- Таблицы для использования: titles (содержит информацию о должностях сотрудников).
- Колонки для отображения: Идентификатор сотрудника (emp_no), текущая должность (title), следующая должность (next_title).*/
SELECT emp_no,title,LEAD(title) OVER(partition by emp_no order by emp_no) as next_title FROM titles;

/*2. Определение начальной и последней зарплаты сотрудника:
- Цель: Узнать, какая была начальная и какая текущая зарплата у каждого сотрудника.
- Таблицы для использования: salaries (содержит информацию о зарплатах сотрудников).
- Колонки для отображения: Идентификатор сотрудника (emp_no), текущая зарплата (salary), начальная зарплата (first_salary), 
последняя зарплата (last_salary).*/
SELECT emp_no,salary,first_value(salary) over (partition by emp_no order by emp_no) as first_salary,
last_value(salary) over(partition by emp_no order by emp_no) as last_salary FROM salaries;

/*3. - Цель: Вычислить скользящее среднее зарплаты для каждого сотрудника, основываясь на его последних трех зарплатах.
- Таблицы для использования: salaries: содержит информацию о зарплатах сотрудников, включая emp_no (идентификатор сотрудника), 
salary (зарплата), и from_date (дата начала действия зарплаты).
- Колонки для отображения: emp_no (идентификатор сотрудника), from_date (дата начала действия зарплаты), salary (зарплата), 
moving_avg_salary (скользящее среднее зарплаты, рассчитанное на основе последних трех зарплат).*/
SELECT emp_no,from_date,salary,
AVG(salary) OVER(partition by emp_no order by from_date rows between 2 preceding and current row) AS moving_avg_salary
FROM salaries;