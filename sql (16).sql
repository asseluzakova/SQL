SELECT * FROM employees
WHERE hire_date > '2000-01-01'; #0.172 sec / после создания индекса 0.031 sec 

CREATE INDEX i_hire_date
ON employees(hire_date); #1.000 sec

SELECT * FROM employees
WHERE first_name='Georgi' AND last_name='Facello'; #0.156 sec / после создания индекса 0.016 sec 

CREATE INDEX i_name
ON employees(first_name,last_name); #1.907 sec