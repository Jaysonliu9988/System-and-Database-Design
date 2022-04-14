-- Q1. Write a query which selects the last name, job ID and salary of all employees who earn a
-- salary of at least $12,000.
SELECT last_name, job_id, salary FROM employee
WHERE salary >= 12000;


-- Q2. Which of the following queries would retrieve all details of employees who have a job ID of ‘IT_PROG’?
SELECT * FROM employee WHERE job_id = 'IT_PROG'


-- Q3. Write a query which selects the full name (e.g. “Steven King”) of any employees who do not have their gender recorded in the database. Order the results by first name.
SELECT CONCAT(first_name, ' ', last_name) AS 'full_name' FROM employee
WHERE gender IS NULL
ORDER BY first_name;



-- Q4. Write a query which selects the employee ID, last name and salary of all employees who have a salary which is either less than $5,000 or more than $15,000. Order the results by the salary, with the highest salaries at the top.
SELECT employee_id, last_name, salary FROM employee
WHERE salary < 5000 OR salary > 15000 ORDER BY salary DESC;



-- Q5. Write a query which selects the last name, hire date and salary of all employees hired between June 1st 1997 and September 20th 1999 who have a salary of over $5,000.
SELECT last_name, hire_date, salary
FROM employee
WHERE hire_date BETWEEN '1997-06-01' AND '1999-09-20' AND salary > 5000;


-- Q6. Write a query which selects the last name of all employees who have both an “a” and an “e” in their last name. Order the results by last name, in descending order.
SELECT last_name
FROM employee
WHERE last_name LIKE '%a%' AND last_name LIKE '%e%' ORDER BY last_name DESC;




-- Q7. The following query is meant to retrieve details of all employees who were either hired
SELECT *
FROM employee
WHERE (hire_date < '01-JAN-1988' OR gender = 'F') AND salary >= 15000;



-- Q8. Write a query which selects the first name, and job ID of all employees who have a job ID of either IT_PROG, ST_CLERK, or SA_REP and have a first name starting either A, B, C or D. Order the results by first name.
SELECT first_name, job_id FROM employee
WHERE job_id IN ('IT_PROG', 'ST_CLERK', 'SA_REP') AND first_name LIKE '[A-D]%'
ORDER BY first_name;


-- Q9. Write a query which selects the last name, salary and job ID of the three highest paid employees who have a job ID which does not start with “AD”.
SELECT TOP 3 last_name, salary, job_id FROM employee
WHERE job_id NOT LIKE 'AD%' ORDER BY salary DESC;




-- Q10. Over a decade ago, a theft occurred in the company that was never solved. Some pieces of evidence were found which can be used to determine the identity of the thief. The evidence available is:
-- • The theft occurred in a room that only certain employees had access to – employees with job IDs of either ST_MAN, ST_CLERK, SA_MAN or SA_REP
-- • A dark and blurry security camera photo shows part of the thief’s name tag, but only “el” can be made out (it may be part of a first name or last name)
-- • Scent of lady’s perfume was noticed at the scene of the theft after it occurred (You may assume that no perfume-wearing men were employed at the time)
-- • The theft occurred on June 15th 1997, so anyone hired after then is not a suspect
-- Write a query which identifies the thief, using the available evidence. The query should return the thief’s full name, with the column being given an alias of “the_thief”. This task is a simple version of the “omniscient database” trope commonly seen on TV.
SELECT CONCAT(first_name, ' ', last_name) AS 'the_thief' FROM employee
WHERE job_id IN ('ST_MAN', 'ST_CLERK', 'SA_MAN', 'SA_REP') AND (first_name LIKE '%el%' OR last_name LIKE '%el%')
AND (gender = 'F' OR gender IS NULL)
AND (hire_date <= '1997-06-15' OR hire_date IS NULL);
-- Notes:
-- • The thief is Ellen Abel.
-- • While just gender = 'F' on its own for the third part of the condition will get you the correct result, it does not account for employees with no gender recorded in the database – those employees may be female. As such, I’ve included OR gender IS NULL.
-- • The same also applies to the hire_date column, which can also be left NULL in this database design. Employees with no hire date may have been employed at the time of the theft.
-- • The perfume (indicating a female thief) is not needed to identify the thief – the rest of the evidence is enough to narrow it down to one.