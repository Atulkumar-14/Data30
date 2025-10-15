-- 🏗️ Creating a sample employees table
CREATE TABLE employees 👨‍💼 (
    emp_id INT,                  -- 🆔 Employee ID
    name VARCHAR(50),            -- 👤 Employee name
    age INT,                     -- 🎂 Age in years
    department VARCHAR(30),      -- 🏢 Department name
    salary DECIMAL(10, 2),       -- 💰 Salary amount
    city VARCHAR(30),            -- 🏙️ City of residence
    hire_date DATE               -- 📅 Date of joining
);

-- 📥 Inserting sample data
INSERT INTO employees VALUES 
(1, 'Alice Anderson', 28, 'IT', 75000.00, 'New York', '2022-01-15'),
(2, 'Bob Brown', 35, 'HR', 65000.00, 'Los Angeles', '2020-03-20'),
(3, 'Charlie Chen', 42, 'IT', 95000.00, 'San Francisco', '2019-06-10'),
(4, 'Diana Davis', 29, 'Sales', 70000.00, 'New York', '2021-08-05'),
(5, 'Eve Evans', 38, 'IT', 85000.00, 'Boston', '2018-11-12'),
(6, 'Frank Ford', 31, 'Sales', 72000.00, 'Los Angeles', '2023-02-28'),
(7, 'Grace Green', 26, 'HR', 60000.00, 'Chicago', '2023-05-15');

-- ═══════════════════════════════════════════════════════════════════
-- ➕ AND Operator - ALL conditions must be TRUE ✅
-- ═══════════════════════════════════════════════════════════════════
SELECT * FROM employees
WHERE department = 'IT' AND salary > 80000;        -- 👨‍💻 IT employees earning > $80k
                                                   -- Returns: Charlie Chen, Eve Evans

SELECT * FROM employees
WHERE age > 30 AND city = 'New York';              -- 🗽 People > 30 years in New York
                                                   -- Returns: No results (Alice is 28, Diana is 29)

-- ═══════════════════════════════════════════════════════════════════
-- 🔀 OR Operator - AT LEAST ONE condition must be TRUE ✅
-- ═══════════════════════════════════════════════════════════════════
SELECT * FROM employees
WHERE department = 'IT' OR department = 'Sales';   -- 👨‍💻🤝 All IT or Sales employees
                                                   -- Returns: Alice, Charlie, Diana, Eve, Frank

SELECT * FROM employees
WHERE city = 'New York' OR salary > 90000;         -- 🗽 New Yorkers OR high earners
                                                   -- Returns: Alice, Diana, Charlie

-- ═══════════════════════════════════════════════════════════════════
-- ❌ NOT Operator - REVERSES the condition
-- ═══════════════════════════════════════════════════════════════════
SELECT * FROM employees
WHERE NOT department = 'IT';                       -- 🚫 All employees EXCEPT IT department
                                                   -- Returns: Bob, Diana, Frank, Grace

SELECT * FROM employees
WHERE NOT city = 'New York' AND NOT city = 'Los Angeles';  -- Exclude NY and LA
                                                           -- Returns: Charlie, Eve, Grace

-- ═══════════════════════════════════════════════════════════════════
-- 🔎 LIKE Operator - PATTERN MATCHING with wildcards
-- ═══════════════════════════════════════════════════════════════════
-- 🎯 Wildcards: % (any characters), _ (single character)

SELECT * FROM employees
WHERE name LIKE 'A%';                              -- 🅰️ Names starting with 'A'
                                                   -- Returns: Alice Anderson

SELECT * FROM employees
WHERE name LIKE '%en';                             -- 🔚 Names ending with 'en'
                                                   -- Returns: Charlie Chen, Grace Green

SELECT * FROM employees
WHERE name LIKE '%a%';                             -- 🔤 Names containing 'a' anywhere
                                                   -- Returns: Alice, Diana, Frank, Grace

SELECT * FROM employees
WHERE name LIKE '_o%';                             -- 2️⃣ Second letter is 'o'
                                                   -- Returns: Bob Brown

-- ═══════════════════════════════════════════════════════════════════
-- 📋 IN Operator - MATCHES any value in a LIST
-- ═══════════════════════════════════════════════════════════════════
SELECT * FROM employees
WHERE city IN ('New York', 'Los Angeles', 'Chicago');  -- 🏙️ Employees in these 3 cities
                                                       -- Returns: Alice, Bob, Diana, Frank, Grace

SELECT * FROM employees
WHERE department IN ('IT', 'HR');                      -- 🏢 IT or HR departments
                                                       -- Returns: Alice, Bob, Charlie, Eve, Grace

SELECT * FROM employees
WHERE emp_id IN (1, 3, 5, 7);                          -- 🔢 Specific employee IDs (odd numbers)
                                                       -- Returns: Alice, Charlie, Eve, Grace

-- ═══════════════════════════════════════════════════════════════════
-- ↔️ BETWEEN Operator - RANGE of values (inclusive)
-- ═══════════════════════════════════════════════════════════════════
SELECT * FROM employees
WHERE age BETWEEN 30 AND 40;                           -- 🎂 Age between 30 and 40 (inclusive)
                                                       -- Returns: Bob(35), Eve(38), Frank(31)

SELECT * FROM employees
WHERE salary BETWEEN 70000 AND 80000;                  -- 💰 Salary range $70k-$80k
                                                       -- Returns: Alice(75k), Diana(70k), Frank(72k)

SELECT * FROM employees
WHERE hire_date BETWEEN '2020-01-01' AND '2022-12-31'; -- 📅 Hired between 2020-2022
                                                       -- Returns: Bob, Alice, Diana

-- ═══════════════════════════════════════════════════════════════════
-- 🎯 COMBINING MULTIPLE OPERATORS (Complex Queries 🧩)
-- ═══════════════════════════════════════════════════════════════════
SELECT * FROM employees
WHERE (department = 'IT' OR department = 'Sales')      -- 👨‍💻 IT or Sales employees
  AND salary > 70000                                   -- 💰 Earning more than $70k
  AND age BETWEEN 25 AND 35;                           -- 🎂 Age 25-35
                                                       -- Returns: Alice, Frank

SELECT * FROM employees
WHERE city IN ('New York', 'Boston')                   -- 🏙️ NY or Boston
  AND NOT department = 'HR'                            -- 🚫 Exclude HR
  AND name LIKE '%e%';                                 -- 🔤 Name contains 'e'
                                                       -- Returns: Alice, Eve

-- ═══════════════════════════════════════════════════════════════════
-- 🎯 PRACTICAL EXAMPLE: Finding qualified candidates
-- ═══════════════════════════════════════════════════════════════════
SELECT 
    name 👤,
    department 🏢,
    salary 💰,
    city 🏙️
FROM employees
WHERE salary BETWEEN 70000 AND 90000                   -- Salary range
  AND (city = 'New York' OR city = 'San Francisco')    -- Preferred cities
  AND department LIKE '%T'                             -- Department ending with 'T' (IT)
  AND age < 40                                         -- Age limit
ORDER BY salary DESC;                                  -- 🔽 Highest salary first