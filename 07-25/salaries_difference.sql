-- Title: Salaries Differences
-- Date: 2025-07-23
-- Source: Stratascratch
-- Difficulty: Easy
-- Link : https://platform.stratascratch.com/coding/10308-salaries-differences?code_type=3

-- # select 
-- # max(salary)
-- # join db_employee and db_dept - inner join on ids
-- # groupby dept
-- # having dept = this and this

SELECT ABS(
    MAX(CASE WHEN d.department = 'engineering' THEN e.salary END) -
    MAX(CASE WHEN d.department = 'marketing' THEN e.salary END)
) AS salary_difference
FROM db_employee as e
INNER JOIN db_dept as d ON e.department_id = d.id
WHERE d.department IN ('engineering', 'marketing');