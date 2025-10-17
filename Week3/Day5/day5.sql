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