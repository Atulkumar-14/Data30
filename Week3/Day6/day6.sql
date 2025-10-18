-- 📋 Employees Table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY 🔑,
    name VARCHAR(100) 📛,
    email VARCHAR(100) 📧,
    salary DECIMAL(10,2) 💰,
    department_id INT 🏢,
    hire_date DATE 📅
);

-- 🏢 Departments Table
CREATE TABLE departments (
    department_id INT PRIMARY KEY 🔑,
    department_name VARCHAR(100) 🏷️,
    location VARCHAR(100) 🌍
);

-- 🛒 Sales Table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY 🔑,
    product_name VARCHAR(100) 📦,
    employee_id INT 👤,
    sale_amount DECIMAL(10,2) 💵,
    sale_date DATE 📅
);
-----------------------------------------------------------------------------------
-- 📝 Task: Find employees 👥 earning more than $70,000 💰
-- ⚡ Optimization: Create index on salary column

-- Step 1: Create index 📇 for better performance
CREATE INDEX idx_salary ON employees (salary);

-- Step 2: Query with optimized performance ⚡
SELECT employee_id 🔑, name 📛, salary 💰
FROM employees
WHERE salary > 70000 💵
ORDER BY salary DESC ⬇️;

-----------------------------------------------------------------------------------
-- 📝 Task: Count employees 👥 in each department 🏢
-- ⚡ Optimization: Index on department_id for faster grouping

-- Step 1: Create index 📇
CREATE INDEX idx_dept ON employees (department_id);

-- Step 2: Aggregate query 📊
SELECT d.department_name 🏷️, COUNT(e.employee_id) 🔢 AS employee_count
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name 🏢
ORDER BY employee_count DESC ⬇️;

-----------------------------------------------------------------------------------
-- 📝 Task: Find the employee 👤 with the highest total sales 💰
-- ⚡ Optimization: Index on employee_id in sales table

-- Step 1: Create index 📇
CREATE INDEX idx_sales_emp ON sales (employee_id);

-- Step 2: Query with SUM aggregation 💵
SELECT e.name 📛, SUM(s.sale_amount) 💰 AS total_sales
FROM employees e
JOIN sales s ON e.employee_id = s.employee_id
GROUP BY e.employee_id, e.name 👤
ORDER BY total_sales DESC ⬇️
LIMIT 1 🏆;