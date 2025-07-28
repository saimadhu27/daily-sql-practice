-- Title: Salaries Differences
-- Date: 2025-07-27
-- Source: Stratascratch
-- Difficulty: Easy
-- Link : https://platform.stratascratch.com/coding/10299-finding-updated-records?code_type=3

-- Q. We have a table with employees and their salaries, however, some of the records are old and contain outdated salary information. 
-- Find the current salary of each employee assuming that salaries increase each year. 
-- Output their id, first name, last name, department ID, and current salary. Order your list by employee ID in ascending order. 

SELECT id,
    first_name,
    department_id,
    last_name,
    MAX(salary) as max_salary
FROM ms_employee_salary
GROUP BY id
ORDER BY id ASC;

