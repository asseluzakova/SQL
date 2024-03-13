#1. Найдите всех сотрудников, которые работали как минимум в 2 департаментах. 
#Вывести их имя, фамилию и количество департаментов, в которых они работали. 
#Показать записи в порядке возрастания.
select e.first_name, e.last_name, countdep.count from employees e
join (
		select d.emp_no, count(dept_no) as count FROM dept_emp d
        group by d.emp_no
        having count >= 2) countdep
on e.emp_no = countdep.emp_no
order by e.first_name, e.last_name, countdep.count;

#2. Вывести имя, фамилию и зарплату самого высокооплачиваемого сотрудника.
SELECT first_name,last_name,s.salary from employees e
JOIN (
		SELECT emp_no,salary FROM salaries
        WHERE salary=(
						SELECT MAX(salary) FROM salaries
					)
	)s
ON e.emp_no=s.emp_no;

#3. Создайте запрос, который выбирает названия всех отделов, 
#в которых работает более 100 сотрудников.
SELECT dept_name FROM departments
WHERE dept_no in
				(SELECT n FROM 
						(SELECT dept_no AS n,count(emp_no) AS c 
						FROM dept_emp
						GROUP BY dept_no
						HAVING c>100) a);

#4. Напишите запрос, который находит имена и фамилии всех сотрудников, 
#которые никогда не были менеджерами.
SELECT first_name,last_name FROM employees
WHERE emp_no NOT IN(
					SELECT emp_no FROM dept_manager
                    );
                    
#5. Создайте запрос, который для каждого отдела выводит сотрудников, 
#получающих наибольшую зарплату в этом отделе.
SELECT e.first_name, e.last_name, de.dept_no
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN salaries s ON e.emp_no = s.emp_no
WHERE (de.dept_no, s.salary) IN (
									SELECT de.dept_no, MAX(s.salary) FROM dept_emp de
									JOIN salaries s ON de.emp_no = s.emp_no
                                    GROUP BY de.dept_no
);

# 6. Напишите запрос, который выбирает названия отделов, 
#где средняя зарплата выше общей средней зарплаты по компании.
SELECT dept_name FROM departments
WHERE dept_no in(
				SELECT d.dept_no FROM dept_emp d
                JOIN (SELECT emp_no,AVG(salary)AS s FROM salaries
                GROUP BY emp_no)a
                ON d.emp_no=a.emp_no
                GROUP BY d.dept_no
                HAVING AVG(s)>(
								SELECT AVG(salary) from salaries
                                )
				);