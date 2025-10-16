-- Get employees 👥 with their department names 🏢
SELECT employees.name 👤, employees.salary 💰, departments.dept_name 🏢
FROM employees
INNER JOIN departments
ON employees.dept_id = departments.id 🔑;

-- Get all employees 👥 and all departments 🏢
SELECT employees.name 👤, departments.dept_name 🏢
FROM employees
FULL OUTER JOIN departments
ON employees.dept_id = departments.id 🔑;


-- Get employee name 👤, department 🏢, and location 📍
SELECT e.name 👤, d.dept_name 🏢, l.city 📍
FROM employees e
INNER JOIN departments d ON e.dept_id = d.id 🔑
INNER JOIN locations l ON d.location_id = l.id 🔑;
-- Above query , first departments table is joined with employees table and then the result is joined with locations table. 
-- This is an example of chaining multiple joins together to get comprehensive data from related tables.
-- departements table must contain location_id column which is foreign key to locations table.


-- Get employees 👥 sorted by salary 💰 (highest first ⬇️)
SELECT name 👤, salary 💰
FROM employees
ORDER BY salary DESC ⬇️;

-- Sort by department 🏢, then by name 👤
SELECT name 👤, dept_id 🔑
FROM employees
ORDER BY dept_id ASC ⬆️, name ASC ⬆️;
-- Above query sorts employees first by their department IDs in ascending order, and then by their names in ascending order within each department.

-- Get top 5 highest paid employees 👥💰
SELECT name 👤, salary 💰
FROM employees
ORDER BY salary DESC ⬇️
LIMIT 5 🔢;

-- Get employees 6-10 (pagination ⏭️)
SELECT name 👤
FROM employees
ORDER BY name ASC ⬆️
LIMIT 5 🔢 OFFSET 5 ⏭️; -- Skip first 5, get next 5
