# 📊 Day 3: Data Types 🔢, Aggregate Functions 📈 & Logical Operators 🔍

---

## 🎯 Part 1: Data Types in SQL 📝

Data types define what kind of information 📦 can be stored in each column 📋 of a table 🗂️.

### 🔢 **1. Numeric Data Types** (for numbers 🧮)

|Data Type 📊|Description 📖|Example 💡|Storage 💾|
|---|---|---|---|
|**INT** 🔢|Whole numbers (integers)|42, -100, 0|4 bytes|
|**FLOAT** 🌊|Decimal numbers (approximate)|3.14, -0.001|4 bytes|
|**DECIMAL(p,s)** 💰|Exact decimal numbers|Price: 99.99|Variable|

**💡 When to use:**

- **INT** → Age 👶, Quantity 📦, ID numbers 🆔
- **FLOAT** → Scientific calculations 🔬, measurements 📏
- **DECIMAL** → Money 💵, financial data 💳 (precise calculations ✅)

```sql
-- 🏗️ Creating a table with NUMERIC data types
CREATE TABLE products 🛍️ (
    product_id INT,              -- 🆔 Unique identifier (whole number)
    price DECIMAL(10, 2),        -- 💰 Price with 2 decimal places (e.g., 199.99)
    weight_kg FLOAT,             -- ⚖️ Weight in kilograms (approximate decimal)
    stock_quantity INT           -- 📦 Number of items in stock (whole number)
);

-- 📥 Inserting sample data
INSERT INTO products VALUES 
(1, 299.99, 1.5, 50),           -- 📱 Product 1: $299.99, 1.5kg, 50 units
(2, 49.50, 0.3, 200),           -- 🎧 Product 2: $49.50, 0.3kg, 200 units
(3, 1299.00, 2.8, 15);          -- 💻 Product 3: $1299.00, 2.8kg, 15 units
```

---

### 🔤 **2. Character Data Types** (for text 📝)

|Data Type 📊|Description 📖|Max Length 📏|Use Case 🎯|
|---|---|---|---|
|**CHAR(n)** 📌|Fixed-length text|n characters|Country codes 🌍 (US, IN)|
|**VARCHAR(n)** 📝|Variable-length text|n characters|Names 👤, emails 📧|
|**TEXT** 📄|Long text|~65,535 chars|Descriptions 📖, articles ✍️|

**💡 Key Difference:**

- **CHAR** → Always uses fixed space 📦 (CHAR(5) stores "Hi" as "Hi ")
- **VARCHAR** → Uses only needed space 💾 (VARCHAR(5) stores "Hi" as "Hi")

```sql
-- 🏗️ Creating a table with CHARACTER data types
CREATE TABLE users 👥 (
    user_id INT,                     -- 🆔 User identification number
    username VARCHAR(50),            -- 👤 Username (up to 50 characters, variable)
    country_code CHAR(2),            -- 🌍 Country code (exactly 2 characters: US, IN, UK)
    bio TEXT,                        -- 📄 User biography (long text, unlimited)
    status CHAR(1)                   -- ✅ Status: A=Active, I=Inactive (exactly 1 character)
);

-- 📥 Inserting sample data
INSERT INTO users VALUES 
(101, 'alice_wonder', 'US', 'Love coding and SQL! 💻', 'A'),    -- 🇺🇸 Active user
(102, 'bob_builder', 'IN', 'Database enthusiast 📊', 'A'),      -- 🇮🇳 Active user
(103, 'charlie_coder', 'UK', 'Learning SQL every day 📚', 'I'); -- 🇬🇧 Inactive user
```

---

### 📅 **3. Date & Time Data Types** (for temporal data ⏰)

|Data Type 📊|Description 📖|Format 📋|Example 💡|
|---|---|---|---|
|**DATE** 📅|Date only|YYYY-MM-DD|2025-10-15|
|**DATETIME** 🕐|Date + Time|YYYY-MM-DD HH:MM:SS|2025-10-15 14:30:00|
|**TIMESTAMP** ⏱️|Date + Time (auto-update)|YYYY-MM-DD HH:MM:SS|2025-10-15 14:30:00|

**💡 Difference between DATETIME and TIMESTAMP:**

- **DATETIME** → Stores exact date-time you provide 📌
- **TIMESTAMP** → Automatically updates to current time 🔄 (useful for tracking changes 📝)

```sql
-- 🏗️ Creating a table with DATE & TIME data types
CREATE TABLE orders 🛒 (
    order_id INT,                    -- 🆔 Order identification number
    customer_name VARCHAR(100),      -- 👤 Customer full name
    order_date DATE,                 -- 📅 Date when order was placed (no time)
    delivery_datetime DATETIME,      -- 🚚 Exact date and time of delivery
    last_updated TIMESTAMP           -- ⏱️ Automatically tracks last modification time
);

-- 📥 Inserting sample data
INSERT INTO orders VALUES 
(501, 'Alice Johnson', '2025-10-10', '2025-10-15 10:30:00', NOW()),  -- 📦 Order placed Oct 10
(502, 'Bob Smith', '2025-10-12', '2025-10-17 14:00:00', NOW()),      -- 📦 Order placed Oct 12
(503, 'Charlie Brown', '2025-10-14', '2025-10-19 09:15:00', NOW());  -- 📦 Order placed Oct 14

-- 🔍 Viewing the data
SELECT * FROM orders;
```

---

## 📈 Part 2: Aggregate Functions (for calculations 🧮)

Aggregate functions perform calculations 🔢 on multiple rows 📊 and return a single result ✅.

### 🎯 **The Five Core Functions:**

|Function 🔧|Purpose 🎯|Returns 📤|
|---|---|---|
|**COUNT()** 🔢|Counts rows|Number of records|
|**SUM()** ➕|Adds values|Total sum|
|**AVG()** 📊|Calculates average|Mean value|
|**MAX()** ⬆️|Finds maximum|Largest value|
|**MIN()** ⬇️|Finds minimum|Smallest value|

```sql
-- 🏗️ Creating a sample sales table
CREATE TABLE sales 💼 (
    sale_id INT,              -- 🆔 Unique sale identifier
    product VARCHAR(50),      -- 🛍️ Product name
    amount DECIMAL(10, 2),    -- 💰 Sale amount in dollars
    region VARCHAR(20),       -- 🌍 Geographic region
    sale_date DATE            -- 📅 Date of sale
);

-- 📥 Inserting sample data
INSERT INTO sales VALUES 
(1, 'Laptop', 1200.00, 'North', '2025-10-01'),      -- 💻 North region sale
(2, 'Mouse', 25.00, 'South', '2025-10-02'),         -- 🖱️ South region sale
(3, 'Keyboard', 75.00, 'North', '2025-10-03'),      -- ⌨️ North region sale
(4, 'Monitor', 300.00, 'East', '2025-10-04'),       -- 🖥️ East region sale
(5, 'Laptop', 1200.00, 'South', '2025-10-05'),      -- 💻 South region sale
(6, 'Mouse', 25.00, 'North', '2025-10-06');         -- 🖱️ North region sale

-- ═══════════════════════════════════════════════════════════════════
-- 🔢 COUNT() - Counts the number of records
-- ═══════════════════════════════════════════════════════════════════
SELECT COUNT(*) AS total_sales 📊       -- Counts all rows (result: 6)
FROM sales;

SELECT COUNT(DISTINCT region) AS unique_regions 🌍  -- Counts unique regions (result: 3)
FROM sales;

-- ═══════════════════════════════════════════════════════════════════
-- ➕ SUM() - Adds up all numeric values
-- ═══════════════════════════════════════════════════════════════════
SELECT SUM(amount) AS total_revenue 💵   -- Adds all sale amounts (1200+25+75+300+1200+25)
FROM sales;                              -- Result: 2825.00

-- ═══════════════════════════════════════════════════════════════════
-- 📊 AVG() - Calculates the average (mean) value
-- ═══════════════════════════════════════════════════════════════════
SELECT AVG(amount) AS average_sale 📈    -- Sum of amounts ÷ count of rows
FROM sales;                              -- Result: 470.83 (2825 ÷ 6)

-- ═══════════════════════════════════════════════════════════════════
-- ⬆️ MAX() - Finds the largest value
-- ═══════════════════════════════════════════════════════════════════
SELECT MAX(amount) AS highest_sale 🏆    -- Finds maximum amount
FROM sales;                              -- Result: 1200.00

-- ═══════════════════════════════════════════════════════════════════
-- ⬇️ MIN() - Finds the smallest value
-- ═══════════════════════════════════════════════════════════════════
SELECT MIN(amount) AS lowest_sale 💸     -- Finds minimum amount
FROM sales;                              -- Result: 25.00

-- ═══════════════════════════════════════════════════════════════════
-- 🎯 COMBINING MULTIPLE AGGREGATE FUNCTIONS
-- ═══════════════════════════════════════════════════════════════════
SELECT 
    COUNT(*) AS total_transactions 🔢,              -- Total number of sales
    SUM(amount) AS total_revenue 💵,                -- Sum of all sales
    AVG(amount) AS average_transaction 📊,          -- Average sale amount
    MAX(amount) AS biggest_sale 🏆,                 -- Largest single sale
    MIN(amount) AS smallest_sale 💸                 -- Smallest single sale
FROM sales;
```

---

### 📦 **GROUP BY Clause** (grouping data together 🗂️)

**GROUP BY** groups rows 📋 that have the same values 🔗 in specified columns and allows aggregate functions to work on each group separately 🎯.

**💡 Simple Explanation:** Think of it like sorting 🗃️ items into boxes 📦 based on labels 🏷️, then counting or calculating totals for each box.

```sql
-- ═══════════════════════════════════════════════════════════════════
-- 📦 GROUP BY - Grouping sales by region
-- ═══════════════════════════════════════════════════════════════════
SELECT 
    region 🌍,                                      -- Group by region column
    COUNT(*) AS number_of_sales 🔢,                -- Count sales per region
    SUM(amount) AS regional_revenue 💰,            -- Total revenue per region
    AVG(amount) AS avg_sale_amount 📊              -- Average sale per region
FROM sales
GROUP BY region;                                   -- Create separate groups for each region

-- 📤 Result will show:
-- North: 3 sales, $1300 revenue, $433.33 average
-- South: 2 sales, $1225 revenue, $612.50 average
-- East: 1 sale, $300 revenue, $300.00 average

-- ═══════════════════════════════════════════════════════════════════
-- 📦 GROUP BY with HAVING (filtering groups 🔍)
-- ═══════════════════════════════════════════════════════════════════
-- HAVING filters groups AFTER aggregation (WHERE filters rows BEFORE aggregation)

SELECT 
    region 🌍,
    SUM(amount) AS regional_revenue 💵
FROM sales
GROUP BY region
HAVING SUM(amount) > 500;                          -- ✅ Only show regions with revenue > $500

-- 📤 Result: Shows only North ($1300) and South ($1225), excludes East ($300)

-- ═══════════════════════════════════════════════════════════════════
-- 📦 GROUP BY with multiple columns
-- ═══════════════════════════════════════════════════════════════════
SELECT 
    region 🌍,
    product 🛍️,
    COUNT(*) AS sales_count 🔢,                    -- Count sales per region per product
    SUM(amount) AS total 💰
FROM sales
GROUP BY region, product                           -- Group by both region AND product
ORDER BY region, total DESC;                       -- 🔽 Sort by region, then by total (descending)
```

---

## 🔍 Part 3: Logical Operators (for filtering data 🎯)

Logical operators help filter rows 📋 based on conditions ✅❌. They work with the **WHERE** clause.

### 🎯 **The Core Logical Operators:**

| Operator 🔧    | Symbol 🔣 | Purpose 🎯                  | Example 💡                  |
| -------------- | --------- | --------------------------- | --------------------------- |
| **AND** ➕      | `AND`     | All conditions must be true | Age > 18 AND Country = 'US' |
| **OR** 🔀      | `OR`      | At least one condition true | City = 'NY' OR City = 'LA'  |
| **NOT** ❌      | `NOT`     | Reverses the condition      | NOT Status = 'Inactive'     |
| **LIKE** 🔎    | `LIKE`    | Pattern matching            | Name LIKE 'A%'              |
| **IN** 📋      | `IN`      | Matches any value in list   | City IN ('NY', 'LA', 'SF')  |
| **BETWEEN** ↔️ | `BETWEEN` | Range of values             | Age BETWEEN 18 AND 65       |

```sql
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
```

---

## 🎓 **TOPICS LEARNED FROM THIS LESSON** 📚

### **✅ Data Types & Storage 🗄️**

• **Numeric Types 🔢**: INT for whole numbers (IDs, quantities), FLOAT for approximate decimals (measurements), DECIMAL for precise money calculations 💰  
• **Character Types 🔤**: CHAR for fixed-length (codes), VARCHAR for variable-length (names, emails), TEXT for long content 📝  
• **Date/Time Types ⏰**: DATE for dates only 📅, DATETIME for exact timestamps 🕐, TIMESTAMP for auto-updating records ⏱️

### **✅ Aggregate Functions for Analysis 📊**

• **COUNT()** 🔢 counts rows, **SUM()** ➕ adds values, **AVG()** 📊 calculates mean, **MAX()** ⬆️ finds largest, **MIN()** ⬇️ finds smallest  
• **GROUP BY** 📦 organizes data into categories and calculates aggregates for each group separately 🗂️  
• **HAVING** 🔍 filters groups after aggregation (different from WHERE which filters rows before aggregation) ✨

### **✅ Logical Operators for Filtering 🎯**

• **AND** ➕ requires all conditions true, **OR** 🔀 needs at least one true, **NOT** ❌ reverses conditions  
• **LIKE** 🔎 matches patterns using wildcards (% for any chars, _ for single char) 🎭  
• **IN** 📋 checks membership in a list, **BETWEEN** ↔️ filters inclusive ranges (numbers, dates, text) 📈  
• **Combining operators** 🧩 creates powerful, complex queries with parentheses () for proper logic grouping �