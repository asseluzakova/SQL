/*1. Создать процедуру, в которой мы получаем на вход два параметра p_salary, p_dept и на выходе получим:
- Список сотрудников (emp_no, first_name, gender), у которых средняя зарплата больше p_salary и 
которые когда-то работали в департаменте p_dept.*/
DELIMITER $$
CREATE PROCEDURE p_employees(IN p_salary INT,IN p_dept VARCHAR(50))
BEGIN
	SELECT e.emp_no,e.first_name,e.gender FROM salaries s 
    JOIN employees e ON e.emp_no=s.emp_no
    JOIN dept_emp dt ON e.emp_no=dt.emp_no
    WHERE dept_no=p_dept
    GROUP BY s.emp_no
    HAVING AVG(salary)>p_salary;
END $$
DELIMITER ;

/*
2. Создать функцию, которая получает на вход f_name и выдает максимальную зарплату среди сотрудников с именем f_name.*/
DELIMITER $$
CREATE FUNCTION f_max_employees(f_name VARCHAR(50)) RETURNS INT
deterministic reads sql data
BEGIN
	DECLARE max_salary int;
    SELECT MAX(salary) INTO max_salary FROM salaries s
    JOIN employees e ON e.emp_no=s.emp_no
    WHERE e.first_name=f_name;
    RETURN max_salary;
END $$
DELIMITER ;

USE world;
#1. Посчитайте количество городов в каждой стране, где IndepYear = 1991 (Independence Year).
SELECT cn.Name,count(c.Name) AS count_city FROM city c 
JOIN country cn ON cn.Code=c.CountryCode
WHERE IndepYear = 1991
GROUP BY cn.Name;

#2. Узнайте, какая численность населения и средняя продолжительность жизни людей в Аргентине (ARG).
SELECT Name,Population,LifeExpectancy FROM country
WHERE Code='ARG';

#3. В какой стране самая высокая продолжительность жизни?
SELECT Name FROM country
WHERE LifeExpectancy=
(SELECT MAX(LifeExpectancy) FROM country);

#4. Перечислите все языки, на которых говорят в регионе «Southeast Asia».
SELECT distinct cl.Language FROM countrylanguage cl
JOIN country c ON cl.CountryCode=c.Code
WHERE c.Region='Southeast Asia';

#5. Посчитайте сумму SurfaceArea для каждого континента.
SELECT Continent,SUM(SurfaceArea) AS Area FROM country
GROUP BY Continent;