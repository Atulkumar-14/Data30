# 🎯 Complex query using multiple keywords
SELECT DISTINCT                           -- No duplicates ✨
       s.name 📝 AS student_name 🏷️,     -- Alias for readability
       s.age ⏳ AS current_age 🎂,
       s.email 📧 AS contact 📬
FROM students AS s 👨‍🎓                   -- Table alias 's' ⚡
WHERE s.age ⏳ BETWEEN 20 AND 25 📏       -- Age range filter
  AND s.name 📝 LIKE 'A%' 🔍             -- Names starting with A
  AND s.email 📧 IS NOT NULL ✅          -- Must have email
  AND s.student_id 🆔 IN (1, 2, 3, 4) 📥 -- Specific IDs only
ORDER BY s.age ⏳ DESC ⬇️;               -- Oldest first

# 🚀 Result: Filtered, sorted, unique records with readable column names