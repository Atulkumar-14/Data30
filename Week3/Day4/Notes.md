# 📊 Day 4: Joins, Clauses & Query Execution Order 🔗

---

## 🔗 JOINS IN SQL - Connecting Tables Together 🤝

Joins are used to **combine rows** ⚡ from two or more tables 📋 based on a **related column** 🔑 between them.

---

### 🎯 1. INNER JOIN - The Intersection ⚡

**Definition:** Returns only the **matching records** ✅ from both tables 📊📊.

**Visual Concept:** Think of it as the **overlapping area** ⭕ of two circles in a Venn diagram.

```python
# INNER JOIN Syntax 🔧
SELECT columns 📝
FROM table1 🗂️
INNER JOIN table2 🗂️
ON table1.column = table2.column 🔑;
```

**Example:**

```sql
-- Get employees 👥 with their department names 🏢
SELECT employees.name 👤, employees.salary 💰, departments.dept_name 🏢
FROM employees
INNER JOIN departments
ON employees.dept_id = departments.id 🔑;
```

**Result:** Only employees who **have a department** ✅ will appear.

---

### ⬅️ 2. LEFT JOIN (LEFT OUTER JOIN) - Keep All Left Records 📌

**Definition:** Returns **all records** from the left table 📋 and **matched records** from the right table 📊. If no match ❌, returns NULL for right table columns.

**Visual Concept:** Takes everything from the **left circle** ⭕ and only the overlapping part from the right.

```python
# LEFT JOIN Syntax 🔧
SELECT columns 📝
FROM table1 🗂️ (left table)
LEFT JOIN table2 🗂️ (right table)
ON table1.column = table2.column 🔑;
```

**Example:**

```sql
-- Get all employees 👥 and their department names 🏢 (if assigned)
SELECT employees.name 👤, departments.dept_name 🏢
FROM employees
LEFT JOIN departments
ON employees.dept_id = departments.id 🔑;
```

**Result:** All employees appear ✅, even those **without a department** (dept_name shows NULL ❌).

---

### ➡️ 3. RIGHT JOIN (RIGHT OUTER JOIN) - Keep All Right Records 📌

**Definition:** Returns **all records** from the right table 📊 and **matched records** from the left table 📋. If no match ❌, returns NULL for left table columns.

**Visual Concept:** Takes everything from the **right circle** ⭕ and only the overlapping part from the left.

```python
# RIGHT JOIN Syntax 🔧
SELECT columns 📝
FROM table1 🗂️ (left table)
RIGHT JOIN table2 🗂️ (right table)
ON table1.column = table2.column 🔑;
```

**Example:**

```sql
-- Get all departments 🏢 and their employees 👥 (if any)
SELECT employees.name 👤, departments.dept_name 🏢
FROM employees
RIGHT JOIN departments
ON employees.dept_id = departments.id 🔑;
```

**Result:** All departments appear ✅, even those **without employees** (name shows NULL ❌).

---

### 🔄 4. FULL JOIN (FULL OUTER JOIN) - Everything Combined 🌐

**Definition:** Returns **all records** when there's a match in **either** left or right table 📋📊. Unmatched rows show NULL ❌ for missing side.

**Visual Concept:** Both circles ⭕⭕ completely, including non-overlapping areas.

```python
# FULL JOIN Syntax 🔧
SELECT columns 📝
FROM table1 🗂️
FULL OUTER JOIN table2 🗂️
ON table1.column = table2.column 🔑;
```

**Example:**

```sql
-- Get all employees 👥 and all departments 🏢
SELECT employees.name 👤, departments.dept_name 🏢
FROM employees
FULL OUTER JOIN departments
ON employees.dept_id = departments.id 🔑;
```

**Result:** Shows employees without departments ❌ AND departments without employees ❌.

**Note:** MySQL ⚠️ doesn't support FULL JOIN directly; use UNION of LEFT and RIGHT joins.

---

### ✖️ 5. CROSS JOIN - Cartesian Product 🔢

**Definition:** Returns the **Cartesian product** of two tables 📊📊 (every row from table1 ⚡ combined with every row from table2 ⚡).

**Visual Concept:** If table1 has 5 rows and table2 has 3 rows, result = **15 rows** 🎲.

```python
# CROSS JOIN Syntax 🔧
SELECT columns 📝
FROM table1 🗂️
CROSS JOIN table2 🗂️;
```

**Example:**

```sql
-- Combine every product 📦 with every color 🎨
SELECT products.name 📦, colors.color_name 🎨
FROM products
CROSS JOIN colors;
```

**Result:** Every possible combination 🔀 of products and colors.

---

### 🔗 6. Joining Multiple Tables - Chaining Connections 🌉

You can join **more than two tables** 📋📊📂 by chaining JOIN statements ⛓️.

**Example:**

```sql
-- Get employee name 👤, department 🏢, and location 📍
SELECT e.name 👤, d.dept_name 🏢, l.city 📍
FROM employees e
INNER JOIN departments d ON e.dept_id = d.id 🔑
INNER JOIN locations l ON d.location_id = l.id 🔑;
```

**Explanation:** First join employees ⚡ with departments, then join the result ⚡ with locations.

---

### 🎯 Understanding Table Relationships 🔗

- **One-to-One** (1️⃣:1️⃣): One record in Table A relates to one record in Table B (e.g., Person ↔️ Passport 📇)
- **One-to-Many** (1️⃣:🔢): One record in Table A relates to multiple records in Table B (e.g., Department ↔️ Employees 👥)
- **Many-to-Many** (🔢:🔢): Multiple records in Table A relate to multiple records in Table B (use junction table 🔗) (e.g., Students ↔️ Courses 📚)

---

## 📜 CLAUSES IN SQL - Filtering & Organizing Data 🎯

Clauses help you **filter** 🔍, **group** 📦, **sort** 🔽, and **limit** ⚖️ your query results.

---

### 🔍 1. WHERE Clause - Filter Rows Before Grouping ⚡

**Definition:** Filters individual rows **before** any grouping happens 📊.

```python
# WHERE Syntax 🔧
SELECT columns 📝
FROM table 🗂️
WHERE condition 🎯;
```

**Example:**

```sql
-- Get employees 👥 with salary 💰 greater than 50000
SELECT name 👤, salary 💰
FROM employees
WHERE salary > 50000 🎯;
```

**Use Cases:** Filter by specific values 🔢, ranges 📏, patterns 🔤 (with LIKE).

---

### 📦 2. GROUP BY Clause - Aggregate Data into Groups 🎁

**Definition:** Groups rows that have the same values 🔄 in specified columns 📝, often used with **aggregate functions** 🧮 (COUNT, SUM, AVG, MAX, MIN).

```python
# GROUP BY Syntax 🔧
SELECT column 📝, AGGREGATE_FUNCTION(column) 🧮
FROM table 🗂️
GROUP BY column 📦;
```

**Example:**

```sql
-- Count employees 👥 in each department 🏢
SELECT dept_id 🔑, COUNT(*) 🔢 as employee_count
FROM employees
GROUP BY dept_id 📦;
```

**Result:** One row per department showing employee count 📊.

---

### 🎯 3. HAVING Clause - Filter Groups After Grouping 📦

**Definition:** Filters **groups** created by GROUP BY (works on aggregated data 🧮).

**Key Difference** ⚠️: WHERE filters rows 📋 before grouping; HAVING filters groups 📦 after grouping.

```python
# HAVING Syntax 🔧
SELECT column 📝, AGGREGATE_FUNCTION(column) 🧮
FROM table 🗂️
GROUP BY column 📦
HAVING condition 🎯;
```

**Example:**

```sql
-- Get departments 🏢 with more than 5 employees 👥
SELECT dept_id 🔑, COUNT(*) 🔢 as employee_count
FROM employees
GROUP BY dept_id 📦
HAVING COUNT(*) > 5 🎯;
```

**Result:** Only departments with **6 or more employees** ✅.

---

### 📊 WHERE vs HAVING - The Critical Difference ⚡

|Aspect 📌|WHERE 🔍|HAVING 📦|
|---|---|---|
|**Filters** 🎯|Individual rows 📋|Grouped results 📦|
|**Used with** 🔧|Any SELECT query ✅|GROUP BY queries 📊|
|**Aggregate functions**|❌ Cannot use (SUM, COUNT, etc.)|✅ Can use (SUM, COUNT, etc.)|
|**Execution order** ⏱️|Before grouping 📋 → 📦|After grouping 📦 ✅|

**Example showing both:**

```sql
-- Get departments 🏢 with average salary 💰 > 60000, 
-- but only consider employees earning > 40000
SELECT dept_id 🔑, AVG(salary) 💰 as avg_salary
FROM employees
WHERE salary > 40000 🔍 -- Filter individual rows first
GROUP BY dept_id 📦
HAVING AVG(salary) > 60000 🎯; -- Filter groups after
```

---

### 🔽 4. ORDER BY Clause - Sort Results 📊

**Definition:** Sorts the result set 📋 by one or more columns in ascending ⬆️ (ASC) or descending ⬇️ (DESC) order.

```python
# ORDER BY Syntax 🔧
SELECT columns 📝
FROM table 🗂️
ORDER BY column1 ASC|DESC 🔽, column2 ASC|DESC 🔽;
```

**Example:**

```sql
-- Get employees 👥 sorted by salary 💰 (highest first ⬇️)
SELECT name 👤, salary 💰
FROM employees
ORDER BY salary DESC ⬇️;

-- Sort by department 🏢, then by name 👤
SELECT name 👤, dept_id 🔑
FROM employees
ORDER BY dept_id ASC ⬆️, name ASC ⬆️;
```

---

### ⚖️ 5. LIMIT Clause - Restrict Number of Rows 🔢

**Definition:** Limits the number of rows 📋 returned by the query.

```python
# LIMIT Syntax 🔧
SELECT columns 📝
FROM table 🗂️
LIMIT number 🔢;

# LIMIT with OFFSET (skip rows) 🔧
SELECT columns 📝
FROM table 🗂️
LIMIT number 🔢 OFFSET skip_number ⏭️;
```

**Example:**

```sql
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
```

**Note:** In SQL Server use **TOP** instead of LIMIT ⚠️.

---

## ⏱️ ORDER OF EXECUTION IN SQL QUERIES 🔄

Understanding the **execution order** ⚡ is crucial for writing correct queries and debugging ❌.

---

### 🎯 SQL Query Execution Sequence 📋

```
6️⃣ SELECT      → Choose columns to display 📝
1️⃣ FROM        → Identify source table(s) 🗂️
2️⃣ JOIN        → Combine tables 🔗
3️⃣ WHERE       → Filter individual rows 🔍
4️⃣ GROUP BY    → Group rows into sets 📦
5️⃣ HAVING      → Filter groups 🎯
7️⃣ ORDER BY    → Sort the result 🔽
8️⃣ LIMIT       → Restrict row count ⚖️
```

---

### 📊 Detailed Execution Flow ⚡

```sql
-- Example Query 🔧
SELECT dept_id 🔑, AVG(salary) 💰 as avg_sal    -- 6️⃣ Select final columns
FROM employees                                  -- 1️⃣ Start with this table
JOIN departments ON employees.dept_id = departments.id  -- 2️⃣ Combine tables
WHERE salary > 30000 🔍                         -- 3️⃣ Filter rows (before grouping)
GROUP BY dept_id 📦                             -- 4️⃣ Group by department
HAVING AVG(salary) > 50000 🎯                   -- 5️⃣ Filter groups (after grouping)
ORDER BY avg_sal DESC ⬇️                        -- 7️⃣ Sort results
LIMIT 10 ⚖️;                                    -- 8️⃣ Take top 10 rows
```

---

### 🔑 Execution Order Explained Step-by-Step 📝

1️⃣ **FROM** 🗂️: Database identifies the source table(s) to query.

2️⃣ **JOIN** 🔗: If multiple tables are involved, they are combined based on JOIN conditions.

3️⃣ **WHERE** 🔍: Filters individual rows before any grouping or aggregation happens.

4️⃣ **GROUP BY** 📦: Rows are grouped together based on specified column(s). Aggregate functions work here 🧮.

5️⃣ **HAVING** 🎯: Filters the groups created by GROUP BY (not individual rows).

6️⃣ **SELECT** 📝: Determines which columns to include in the final result. Column aliases 🏷️ are created here.

7️⃣ **ORDER BY** 🔽: Sorts the final result set by specified column(s).

8️⃣ **LIMIT/OFFSET** ⚖️: Restricts how many rows are returned to the user.

---

### ⚠️ Why This Order Matters 🎯

- **You cannot use column aliases from SELECT in WHERE** ❌: Because WHERE executes before SELECT.
    
    ```sql
    -- ❌ This will ERROR
    SELECT salary * 1.1 AS new_salary 💰
    FROM employees
    WHERE new_salary > 50000; -- new_salary doesn't exist yet!
    
    -- ✅ Correct approach
    SELECT salary * 1.1 AS new_salary 💰
    FROM employees
    WHERE salary * 1.1 > 50000 🔍;
    ```
    
- **You CAN use column aliases in ORDER BY** ✅: Because ORDER BY executes after SELECT.
    
    ```sql
    -- ✅ This works fine
    SELECT salary * 1.1 AS new_salary 💰
    FROM employees
    ORDER BY new_salary DESC ⬇️;
    ```
    
- **Aggregate functions 🧮 cannot be used in WHERE**: Use HAVING instead ✅.
    
    ```sql
    -- ❌ Wrong
    SELECT dept_id 🔑, AVG(salary) 💰
    FROM employees
    WHERE AVG(salary) > 50000; -- ERROR!
    
    -- ✅ Correct
    SELECT dept_id 🔑, AVG(salary) 💰
    FROM employees
    GROUP BY dept_id 📦
    HAVING AVG(salary) > 50000 🎯;
    ```
    

---

## 🎓 Summary: What We Learned Today 📚

• **JOINS** 🔗: Five types to combine tables ⚡ → INNER (matching only ✅), LEFT (all left + matches ⬅️), RIGHT (all right + matches ➡️), FULL (everything 🌐), CROSS (all combinations ✖️) → Used to establish relationships 🤝 between tables based on common keys 🔑

• **CLAUSES** 📜: Essential tools for data manipulation ⚡ → WHERE (filters rows before grouping 🔍), GROUP BY (aggregates data into groups 📦), HAVING (filters groups after aggregation 🎯), ORDER BY (sorts results ascending/descending 🔽), LIMIT (restricts output size ⚖️) → WHERE vs HAVING is critical ⚠️: WHERE filters individual rows 📋, HAVING filters grouped results 📦

• **EXECUTION ORDER** ⏱️: The actual sequence SQL processes queries 🔄 → FROM 🗂️ → JOIN 🔗 → WHERE 🔍 → GROUP BY 📦 → HAVING 🎯 → SELECT 📝 → ORDER BY 🔽 → LIMIT ⚖️ → Understanding this prevents common errors ❌ (like using SELECT aliases in WHERE) and helps optimize queries 🚀

• **MULTIPLE TABLE JOINS** ⛓️: Chain JOINs to connect 3+ tables 🗂️🗂️🗂️ → Understand relationships 🔗: One-to-One (1️⃣:1️⃣), One-to-Many (1️⃣:🔢), Many-to-Many (🔢:🔢 with junction tables) → Always join on primary 🔑 and foreign keys 🗝️ to maintain data integrity ✅