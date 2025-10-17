# 📚 Day 5: Common Table Expressions (CTEs) 🔗 & Window Functions 🪟

---

## 🎯 **Introduction to Advanced SQL Query Techniques** ⚡

Welcome to Day 5! 🎉 Today we'll explore two powerful SQL features 💪 that will elevate your querying skills 📈 to professional levels 🏆. **Common Table Expressions (CTEs)** 🔗 allow you to create temporary ⏰ named result sets 📦 that make complex queries 🧩 more readable 📖 and maintainable 🔧. **Window Functions** 🪟 enable you to perform calculations 🧮 across sets of rows 📊 related to the current row ➡️ without collapsing the result set ❌ like aggregate functions do. Together, these tools 🛠️ will help you write cleaner ✨, more efficient ⚡, and more sophisticated 🎓 SQL queries 📝 for real-world business scenarios 💼.

---

## 📋 **Part 1: Common Table Expressions (CTEs)** 🔗

### **What are CTEs?** 🤔

A **CTE** (Common Table Expression) is a temporary ⏰ named result set 📦 that you can reference 🔖 within a `SELECT`, `INSERT`, `UPDATE`, or `DELETE` statement 📝. Think of it as a **temporary view** 👁️ that exists only for the duration ⏱️ of a single query 🔄.

**Linear Explanation:** 📖 Imagine you're working on a complex report 📊 that requires multiple steps 🪜. Instead of nesting subqueries 🎭 (which becomes hard to read 😵), you can break down your logic 🧠 into named steps 🏷️ using CTEs. Each CTE acts like a stepping stone 🪨 that helps you build up to your final result 🎯.

---

### **💡 Key Benefits of CTEs** ✨

• **Readability** 📖 → Makes complex queries easier to understand 🧠  
• **Reusability** ♻️ → Can reference the same CTE multiple times 🔁 in a query 📝  
• **Maintainability** 🔧 → Easier to debug 🐛 and modify 📝  
• **Recursion** 🔄 → Supports recursive queries 🌀 (we'll cover this later) 📚  
• **Organization** 🗂️ → Breaks down complex logic 🧩 into manageable chunks 📦

---

### **📐 Basic CTE Syntax** 🔤

```sql
-- 🔹 Basic CTE Structure 📋
WITH cte_name AS (
    -- 📝 Your query goes here ✍️
    SELECT column1, column2, column3
    FROM table_name
    WHERE condition  -- ⚡ Filter criteria 🔍
)
-- 🎯 Main query using the CTE 🔗
SELECT * 
FROM cte_name;
```

---

### **🔧 Example 1: Simple CTE** 🌟

```sql
-- 🎯 Find employees 👥 with salary 💰 above average 📊

WITH avg_salary_cte AS (
    -- 📊 Step 1: Calculate average salary 💵
    SELECT AVG(salary) AS avg_sal  -- 🧮 Compute average 📈
    FROM employees
)
-- 🔍 Step 2: Find employees earning above average 💪
SELECT 
    emp_id,           -- 🆔 Employee ID 
    emp_name,         -- 👤 Employee Name
    salary,           -- 💰 Salary Amount
    department        -- 🏢 Department Name
FROM employees, avg_salary_cte
WHERE salary > avg_sal;  -- ⚡ Filter condition 🎯
```

**📌 Explanation:** This CTE first calculates 🧮 the average salary 💵 across all employees 👥, then uses that value 📊 to filter 🔍 employees earning above 📈 the average ⬆️.

---

### **🔧 Example 2: Multiple CTEs** 🔗🔗

```sql
-- 🎯 Find departments 🏢 with high performers 🏆 and their total sales 💰

WITH high_performers AS (
    -- 📊 Step 1: Identify top performers 🌟
    SELECT 
        emp_id,         -- 🆔 Employee identifier
        emp_name,       -- 👤 Name of employee
        department,     -- 🏢 Department name
        performance     -- ⭐ Performance score
    FROM employees
    WHERE performance > 85  -- 🎯 Performance threshold ⚡
),
dept_sales AS (
    -- 💰 Step 2: Calculate department sales 📈
    SELECT 
        department,           -- 🏢 Department identifier
        SUM(sales) AS total   -- 💵 Aggregated sales amount 🧮
    FROM sales_data
    GROUP BY department       -- 📦 Group by department 🏢
)
-- 🔗 Step 3: Combine both CTEs for final result 🎯
SELECT 
    hp.emp_name,              -- 👤 Employee name from CTE1
    hp.department,            -- 🏢 Department name
    hp.performance,           -- ⭐ Performance rating
    ds.total AS dept_sales    -- 💰 Department sales from CTE2
FROM high_performers hp
INNER JOIN dept_sales ds      -- 🔗 Join the two CTEs together
    ON hp.department = ds.department;  -- 🔑 Join condition ⚡
```

**📌 Explanation:** This query demonstrates 🎓 using multiple CTEs 🔗 in sequence. The first CTE filters 🔍 high performers 🏆, the second calculates 🧮 department sales 💰, and the main query 📝 joins them together 🤝 for comprehensive insights 💡.

---

### **🔧 Example 3: CTE with Aggregation** 📊

```sql
-- 🎯 Find products 📦 with sales above their category average 📈

WITH category_avg AS (
    -- 📊 Calculate average sales per category 🏷️
    SELECT 
        category,                    -- 🏷️ Product category
        AVG(sales) AS avg_category   -- 🧮 Average sales amount 💰
    FROM products
    GROUP BY category                -- 📦 Group by category type
)
-- 🔍 Find products exceeding category average ⬆️
SELECT 
    p.product_id,      -- 🆔 Product identifier
    p.product_name,    -- 📦 Product name
    p.category,        -- 🏷️ Category type
    p.sales,           -- 💰 Product sales amount
    ca.avg_category    -- 📊 Category average for comparison
FROM products p
INNER JOIN category_avg ca          -- 🔗 Join with CTE
    ON p.category = ca.category     -- 🔑 Matching condition
WHERE p.sales > ca.avg_category;    -- ⚡ Filter high performers 🎯
```

**📌 Explanation:** Here we group 📦 products by category 🏷️, calculate averages 🧮 within each group, then compare individual product sales 💰 against their respective category benchmarks 📊.

---

## 🪟 **Part 2: Window Functions** 📊

### **What are Window Functions?** 🤔

**Window Functions** 🪟 perform calculations 🧮 across a set of rows 📊 that are somehow related 🔗 to the current row ➡️. Unlike aggregate functions 📦 that collapse rows ⬇️, window functions **preserve** ✅ individual rows while adding calculated columns 📈.

**Linear Explanation:** 📖 Think of a window function 🪟 as looking through a window 👁️ at neighboring rows 👥 while staying on your current row 📍. You can rank rows 🏆, calculate running totals 📊, or compare values 🔍 without losing any row details 📝. It's like having a spreadsheet 📑 where you can see formulas 🧮 that reference other cells 📱 while each cell maintains its own data 💾.

---

### **💡 Key Window Functions** 🔑

• **ROW_NUMBER()** 🔢 → Assigns unique sequential numbers 📊 to rows  
• **RANK()** 🏆 → Assigns ranks with gaps ⏭️ for ties 🤝  
• **DENSE_RANK()** 🎖️ → Assigns ranks without gaps ➡️ for ties 🤝  
• **NTILE(n)** 📦 → Divides rows into n equal buckets 🪣  
• **LEAD()** ⏩ → Accesses data from subsequent rows ⬇️  
• **LAG()** ⏪ → Accesses data from previous rows ⬆️  
• **SUM/AVG/MIN/MAX OVER()** 🧮 → Aggregate functions as window functions 📊

---

### **📐 Window Function Syntax** 🔤

```sql
-- 🔹 General Window Function Structure 📋
SELECT 
    column1,
    column2,
    FUNCTION_NAME() OVER (
        PARTITION BY partition_column  -- 📦 Optional: Divide data into groups
        ORDER BY order_column          -- 📊 Optional: Define row order
        ROWS/RANGE clause              -- 📏 Optional: Define frame
    ) AS alias_name
FROM table_name;
```

---

### **🔧 Example 4: ROW_NUMBER()** 🔢

```sql
-- 🎯 Assign unique row numbers 🔢 to employees within each department 🏢

SELECT 
    emp_id,                    -- 🆔 Employee identifier
    emp_name,                  -- 👤 Employee name
    department,                -- 🏢 Department name
    salary,                    -- 💰 Salary amount
    ROW_NUMBER() OVER (
        PARTITION BY department    -- 📦 Separate numbering per dept 🏢
        ORDER BY salary DESC       -- 📊 Order by highest salary first ⬇️
    ) AS row_num               -- 🔢 Sequential row number assigned
FROM employees;

-- 📌 Result: Each department gets its own sequence 1, 2, 3... 🔢
-- 💡 Highest paid employee in each dept gets row_num = 1 🏆
```

**📌 Explanation:** ROW_NUMBER() creates 🔢 a unique sequential number for each row 📊. PARTITION BY 📦 restarts numbering for each department 🏢, and ORDER BY 📊 determines the sequence (highest salary first ⬇️💰).

---

### **🔧 Example 5: RANK() vs DENSE_RANK()** 🏆🎖️

```sql
-- 🎯 Compare RANK() and DENSE_RANK() behavior with ties 🤝

SELECT 
    emp_name,              -- 👤 Employee name
    department,            -- 🏢 Department
    performance,           -- ⭐ Performance score
    RANK() OVER (
        PARTITION BY department       -- 📦 Rank within department
        ORDER BY performance DESC     -- 📊 Highest score first ⬇️
    ) AS rank_with_gaps,              -- 🏆 Rank (gaps for ties) ⏭️
    DENSE_RANK() OVER (
        PARTITION BY department       -- 📦 Rank within department
        ORDER BY performance DESC     -- 📊 Highest score first ⬇️
    ) AS rank_no_gaps                 -- 🎖️ Dense rank (no gaps) ➡️
FROM employees;

-- 📌 Example Output:
-- 👤 Alice   | ⭐ 95 | 🏆 Rank: 1 | 🎖️ Dense: 1
-- 👤 Bob     | ⭐ 95 | 🏆 Rank: 1 | 🎖️ Dense: 1  ← Tie 🤝
-- 👤 Charlie | ⭐ 90 | 🏆 Rank: 3 | 🎖️ Dense: 2  ← Gap vs No Gap! ⏭️
```

**📌 Explanation:** RANK() 🏆 leaves gaps ⏭️ after ties 🤝 (1, 1, 3...), while DENSE_RANK() 🎖️ continues sequentially ➡️ without gaps (1, 1, 2...). Choose based on your ranking needs 🎯!

---

### **🔧 Example 6: NTILE() for Bucketing** 📦🪣

```sql
-- 🎯 Divide employees 👥 into 4 performance quartiles 📊

SELECT 
    emp_id,                -- 🆔 Employee ID
    emp_name,              -- 👤 Name
    performance,           -- ⭐ Performance score
    NTILE(4) OVER (
        ORDER BY performance DESC    -- 📊 Order by performance ⬇️
    ) AS quartile          -- 📦 Bucket number (1-4) 🪣
FROM employees;

-- 📌 Result Groups:
-- 🪣 Quartile 1: Top 25% performers 🏆
-- 🪣 Quartile 2: Next 25% performers 📈
-- 🪣 Quartile 3: Next 25% performers 📊
-- 🪣 Quartile 4: Bottom 25% performers 📉
```

**📌 Explanation:** NTILE(n) 📦 divides rows into n equal-sized buckets 🪣. Perfect for creating percentile groups 📊 or performance tiers 🎯!

---

### **🔧 Example 7: Real-World - Top 3 Employees per Department** 🏆

```sql
-- 🎯 Find top 3 highest paid 💰 employees in each department 🏢

WITH ranked_employees AS (
    -- 📊 Step 1: Rank employees within departments 📋
    SELECT 
        emp_id,                    -- 🆔 Employee identifier
        emp_name,                  -- 👤 Employee name
        department,                -- 🏢 Department name
        salary,                    -- 💰 Salary amount
        RANK() OVER (
            PARTITION BY department    -- 📦 Separate ranking per dept
            ORDER BY salary DESC       -- 📊 Highest salary first ⬇️
        ) AS salary_rank           -- 🏆 Rank position assigned
    FROM employees
)
-- 🔍 Step 2: Filter only top 3 per department 🎯
SELECT 
    emp_id,        -- 🆔 ID
    emp_name,      -- 👤 Name
    department,    -- 🏢 Dept
    salary,        -- 💰 Amount
    salary_rank    -- 🏆 Position (1-3)
FROM ranked_employees
WHERE salary_rank <= 3      -- ⚡ Top 3 filter 🎯
ORDER BY department, salary_rank;  -- 📊 Organized output 🗂️
```

**📌 Explanation:** This combines CTEs 🔗 with window functions 🪟! First, we rank 🏆 all employees within their departments 🏢. Then, we filter 🔍 to keep only the top 3 highest earners 💰 from each department 📦.

---

### **🔧 Example 8: Real-World - Top Selling Products per Category** 📦💰

```sql
-- 🎯 Identify top 5 products 📦 by sales 💰 in each category 🏷️

WITH product_rankings AS (
    -- 📊 Rank products within categories 🏷️
    SELECT 
        product_id,               -- 🆔 Product identifier
        product_name,             -- 📦 Product name
        category,                 -- 🏷️ Category type
        total_sales,              -- 💰 Total sales amount
        ROW_NUMBER() OVER (
            PARTITION BY category      -- 📦 Separate per category
            ORDER BY total_sales DESC  -- 📊 Highest sales first ⬇️
        ) AS sales_rank           -- 🔢 Position in category 🏆
    FROM products
)
-- 🔍 Extract top 5 from each category 🎯
SELECT 
    product_name,     -- 📦 Name
    category,         -- 🏷️ Category
    total_sales,      -- 💰 Sales
    sales_rank        -- 🏆 Rank (1-5)
FROM product_rankings
WHERE sales_rank <= 5              -- ⚡ Top 5 filter 🎯
ORDER BY category, sales_rank;     -- 📊 Clean output 🗂️
```

**📌 Explanation:** Similar pattern 🔄 for product analysis 📊! We use ROW_NUMBER() 🔢 instead of RANK() 🏆 to ensure exactly 5 products 📦 per category 🏷️ (no duplicates even with ties 🤝).

---

### **🔧 Example 9: Running Totals with SUM() OVER()** 📈

```sql
-- 🎯 Calculate cumulative sales 💰 over time ⏰

SELECT 
    sale_date,                 -- 📅 Date of sale
    daily_sales,               -- 💵 Sales for that day
    SUM(daily_sales) OVER (
        ORDER BY sale_date     -- 📊 Cumulative by date order ➡️
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW  -- 📏 Frame
    ) AS cumulative_sales      -- 📈 Running total 🧮
FROM sales_data
ORDER BY sale_date;            -- 📅 Chronological order ⏰

-- 📌 Output shows progressive accumulation 📈:
-- 📅 Jan 1  | 💵 $100  | 📈 Cumulative: $100
-- 📅 Jan 2  | 💵 $150  | 📈 Cumulative: $250
-- 📅 Jan 3  | 💵 $200  | 📈 Cumulative: $450
```

**📌 Explanation:** Window aggregates 🧮 like SUM() 📊 can create running totals 📈. The ROWS BETWEEN clause 📏 defines which rows to include in the calculation 🔢 (from start to current row ➡️).

---

### **🔧 Example 10: LAG() and LEAD() for Comparisons** ⏪⏩

```sql
-- 🎯 Compare each month's sales 💰 to previous and next month 📊

SELECT 
    month,                          -- 📅 Month name
    sales,                          -- 💰 Current month sales
    LAG(sales, 1) OVER (
        ORDER BY month              -- ⏪ Previous month value
    ) AS previous_month_sales,      -- 💵 Last month's sales
    LEAD(sales, 1) OVER (
        ORDER BY month              -- ⏩ Next month value
    ) AS next_month_sales,          -- 💵 Next month's sales
    sales - LAG(sales, 1) OVER (
        ORDER BY month
    ) AS growth                     -- 📈 Month-over-month growth 📊
FROM monthly_sales
ORDER BY month;                     -- 📅 Chronological ⏰

-- 📌 Helps analyze trends 📈 and growth patterns 📊!
```

**📌 Explanation:** LAG() ⏪ accesses previous rows 📊 and LEAD() ⏩ accesses next rows. Perfect for time-series analysis 📈, trend detection 🔍, and calculating changes 📊 between periods ⏰!

---

## 🎓 **What We Learned Today** 📚

• **CTEs (Common Table Expressions)** 🔗  
◦ Temporary named result sets 📦 that improve query readability 📖 and maintainability 🔧  
◦ Use `WITH` keyword 🔑 to define reusable query blocks 🔄  
◦ Multiple CTEs 🔗🔗 can be chained together for complex logic 🧩  
◦ Perfect for breaking down complicated queries 📊 into manageable steps 🪜

• **Window Functions** 🪟  
◦ Perform calculations 🧮 across related rows without collapsing results ✅  
◦ `ROW_NUMBER()` 🔢 assigns unique sequential numbers to rows 📊  
◦ `RANK()` 🏆 and `DENSE_RANK()` 🎖️ provide ranking with different tie-handling ⏭️➡️  
◦ `NTILE(n)` 📦 divides data into equal buckets 🪣 for segmentation 📊  
◦ `PARTITION BY` 📦 creates separate window groups 🏢 for calculations 🧮  
◦ `ORDER BY` 📊 determines row sequence ➡️ within windows 🪟  
◦ Aggregate functions 🧮 with `OVER()` create running totals 📈 and moving averages 📊  
◦ `LAG()` ⏪ and `LEAD()` ⏩ enable row-to-row comparisons 🔍 for trend analysis 📈

• **Real-World Applications** 💼  
◦ Ranking top performers 🏆 (employees 👥, products 📦, sales 💰)  
◦ Finding top-N records 🔢 within categories 🏷️ or groups 📦  
◦ Calculating cumulative metrics 📈 and running totals 🧮  
◦ Comparing current values 💡 with previous/next periods ⏪⏩  
◦ Segmenting data 📊 into performance tiers 🎯 or percentiles 📦