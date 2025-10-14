# 📘 Day 2: SQL Commands 🔑, Keys 🗝️, and Keywords 🎯

---

## 📌 Overview: SQL Command Architecture 🏗️

SQL (Structured Query Language) commands are organized into **five major categories** 🗂️, each serving a distinct purpose in database management. Think of these categories as different **tools 🛠️ in a toolbox** - each designed for specific tasks.

---

## 🎨 SQL Command Classification Tree 🌳

```
                        SQL COMMANDS 💻
                              |
        ┌─────────────┬───────┴───────┬─────────────┬─────────────┐
        |             |               |             |             |
       DDL 🏗️        DML ✏️          DQL 🔍        DCL 🔐        TCL 🔄
    (Define)      (Manipulate)     (Query)      (Control)    (Transaction)
        |             |               |             |             |
    CREATE 🆕      INSERT ➕       SELECT 📋      GRANT ✅      COMMIT ✔️
    ALTER 🔧       UPDATE 🔄       (only)       REVOKE ❌     ROLLBACK ↩️
    DROP 🗑️        DELETE ❌                                 SAVEPOINT 💾
    TRUNCATE ⚡    (more)
```

---

## 1️⃣ DDL (Data Definition Language) 🏗️📐

**Purpose 🎯:** Define and modify the **structure** of database objects (tables 📊, schemas 🗂️, indexes 📇)

### 🆕 CREATE - Building New Structures

**Linear Explanation:** CREATE command builds new database objects from scratch, like constructing a new building with specific rooms and features.

```python
# 🆕 CREATE TABLE - Define a new table structure
CREATE TABLE students 👨‍🎓 (
    student_id INT PRIMARY KEY 🔑,        -- Unique identifier 🆔
    name VARCHAR(100) NOT NULL 📝,        -- Student name (required ⚠️)
    age INT ⏳,                            -- Age in years
    email VARCHAR(100) UNIQUE 📧,         -- Unique email address
    enrollment_date DATE 📅               -- Date joined 🗓️
);

# 🆕 CREATE DATABASE - Build a new database container
CREATE DATABASE school_management 🏫;

# 🆕 CREATE INDEX - Speed up data retrieval ⚡
CREATE INDEX idx_student_name 📇          -- Index name
ON students(name) 📝;                     -- On which column
```

**Key Points 🔑:**

- **CREATE** = Build something **NEW** ✨
- Defines **structure only** 🏗️, not data
- Cannot create if name already exists ❌🔄

---

### 🔧 ALTER - Modifying Existing Structures

**Linear Explanation:** ALTER is like renovating an existing building - you can add new rooms, remove walls, or change room sizes without demolishing the entire structure.

```python
# ➕ ADD COLUMN - Add a new field to existing table
ALTER TABLE students 👨‍🎓
ADD COLUMN phone_number VARCHAR(15) 📱;   -- New column added 🆕

# 🔄 MODIFY COLUMN - Change column properties
ALTER TABLE students 👨‍🎓
MODIFY COLUMN age INT NOT NULL ⚠️;        -- Make age mandatory

# 🗑️ DROP COLUMN - Remove a column permanently
ALTER TABLE students 👨‍🎓
DROP COLUMN phone_number 📱;              -- Column deleted ❌

# 🔄 RENAME COLUMN - Change column name
ALTER TABLE students 👨‍🎓
RENAME COLUMN name TO full_name 📝;       -- Column renamed 🔄
```

**Key Points 🔑:**

- **ALTER** = Modify **EXISTING** structures 🔧
- Can add ➕, remove ➖, or change 🔄 columns
- Table data remains intact 💾✅
- When changing a column to **NOT NULL**, existing rows **must not contain NULLs**, or the change fails.
- When changing a column’s **datatype**, all existing values **must be convertible** to the new type, or the change fails.

---

### 🗑️ DROP - Permanent Deletion

**Linear Explanation:** DROP is the demolition command - it completely removes database objects and ALL their data, like tearing down an entire building.

```python
# 🗑️ DROP TABLE - Delete entire table and data
DROP TABLE students 👨‍🎓;                 -- Table removed permanently ⚠️

# 🗑️ DROP DATABASE - Delete entire database
DROP DATABASE school_management 🏫;       -- Database destroyed ❌💥

# 🗑️ DROP INDEX - Remove index
DROP INDEX idx_student_name 📇;           -- Index deleted 🗑️
```

**⚠️ Warning Points:**

- **IRREVERSIBLE** ↩️❌ - No undo option!
- Deletes **structure + data** 🏗️💾
- Use with **extreme caution** ⚠️🚨

---

### ⚡ TRUNCATE - Fast Data Removal

**Linear Explanation:** TRUNCATE empties a table quickly, like clearing all items from a room but keeping the room itself intact - faster than removing items one by one.

```python
# ⚡ TRUNCATE TABLE - Remove all rows quickly
TRUNCATE TABLE students 👨‍🎓;             -- All data erased ⚡🗑️
                                          -- Structure remains 🏗️✅
```

**TRUNCATE vs DELETE Comparison 🆚:**

|Feature 📋|TRUNCATE ⚡|DELETE ❌|
|---|---|---|
|**Speed 🏃**|Very Fast ⚡⚡⚡|Slower 🐌|
|**Structure 🏗️**|Kept ✅|Kept ✅|
|**Data 💾**|All removed 🗑️|Can be selective 🎯|
|**Rollback ↩️**|Not possible ❌|Possible ✅|
|**WHERE clause 🔍**|Not allowed ❌|Allowed ✅|

---

## 2️⃣ DML (Data Manipulation Language) ✏️📝

**Purpose 🎯:** Manipulate (add ➕, modify 🔄, delete ❌) the **actual data** inside tables

### ➕ INSERT - Adding New Data

**Linear Explanation:** INSERT adds new records to a table, like adding new entries to a guest book or inventory list.

```python
# ➕ INSERT single row - Add one record
INSERT INTO students 👨‍🎓 (student_id 🆔, name 📝, age ⏳, email 📧)
VALUES (1, 'Alice Johnson' 👩, 20, 'alice@email.com' 📧);

# ➕ INSERT multiple rows - Add several records at once
INSERT INTO students 👨‍🎓 (student_id 🆔, name 📝, age ⏳, email 📧)
VALUES 
    (2, 'Bob Smith' 👨, 22, 'bob@email.com' 📧),
    (3, 'Carol White' 👩, 21, 'carol@email.com' 📧),
    (4, 'David Brown' 👨, 23, 'david@email.com' 📧);

# ➕ INSERT with partial columns - Some fields optional
INSERT INTO students 👨‍🎓 (student_id 🆔, name 📝)
VALUES (5, 'Eve Davis' 👩);               -- age & email = NULL 🈳
```

**Key Points 🔑:**

- Adds **NEW rows** ➕ to table
- Must provide values for **required fields** ⚠️
- Optional fields get **NULL** 🈳 if not provided

---

### 🔄 UPDATE - Modifying Existing Data

**Linear Explanation:** UPDATE changes existing records, like editing entries in a notebook - you can modify specific information while keeping the rest unchanged.

```python
# 🔄 UPDATE single record - Change one student's data
UPDATE students 👨‍🎓
SET age ⏳ = 21, email 📧 = 'alice.new@email.com' 📧
WHERE student_id 🆔 = 1;                  -- Only Alice's record 🎯

# 🔄 UPDATE multiple records - Change many at once
UPDATE students 👨‍🎓
SET enrollment_date 📅 = '2024-01-15' 🗓️
WHERE age ⏳ >= 21;                        -- All students 21+ years 👥

# ⚠️ UPDATE without WHERE - Changes ALL rows (dangerous! 🚨)
UPDATE students 👨‍🎓
SET enrollment_date 📅 = '2024-01-01' 🗓️; -- Every single student ⚠️
```

**⚠️ Critical Warning:**

- **ALWAYS use WHERE clause** 🎯 to target specific rows
- Without WHERE = **ALL rows affected** 🌍💥
- Double-check ✅✅ before executing!

---

### ❌ DELETE - Removing Data

**Linear Explanation:** DELETE removes specific records from a table, like erasing selected entries from a list while keeping the list structure intact.

```python
# ❌ DELETE specific record - Remove one student
DELETE FROM students 👨‍🎓
WHERE student_id 🆔 = 5;                  -- Delete Eve's record 🗑️

# ❌ DELETE multiple records - Remove several students
DELETE FROM students 👨‍🎓
WHERE age ⏳ < 20;                         -- Delete all under 20 ⚠️

# 🚨 DELETE without WHERE - Removes ALL rows (DANGER! 💥)
DELETE FROM students 👨‍🎓;                -- Every record gone ⚠️⚠️
```

**Key Points 🔑:**

- Removes **rows permanently** 🗑️
- Can be **rolled back** ↩️ (if in transaction 🔄)
- Use **WHERE clause** 🎯 for safety ✅

---

## 3️⃣ DQL (Data Query Language) 🔍📊

**Purpose 🎯:** Retrieve and query data from database tables

### 📋 SELECT - The Power Query Command

**Linear Explanation:** SELECT is the most frequently used SQL command - it fetches data from tables like using a search tool to find and display specific information.

```python
# 📋 SELECT all columns - Get everything
SELECT * 🌟                               -- Asterisk = all columns 📊
FROM students 👨‍🎓;

# 📋 SELECT specific columns - Get only what you need
SELECT name 📝, age ⏳, email 📧          -- Only 3 columns 🎯
FROM students 👨‍🎓;

# 🔍 SELECT with WHERE - Filter results
SELECT name 📝, age ⏳
FROM students 👨‍🎓
WHERE age ⏳ > 20;                         -- Only students over 20 🎯

# 🔢 SELECT with calculations - Computed columns
SELECT name 📝, 
       age ⏳, 
       age + 5 AS future_age 🔮           -- Calculate future age ➕
FROM students 👨‍🎓;

# 📊 SELECT with ORDER BY - Sort results
SELECT name 📝, age ⏳
FROM students 👨‍🎓
ORDER BY age ⏳ DESC;                      -- Descending order ⬇️

# 🔢 SELECT with aggregate functions - Summary data
SELECT COUNT(*) 🔢 AS total_students,     -- Count all students
       AVG(age) 📊 AS average_age,        -- Average age calculation
       MAX(age) ⬆️ AS oldest_age,         -- Maximum age
       MIN(age) ⬇️ AS youngest_age        -- Minimum age
FROM students 👨‍🎓;
```

**Key Points 🔑:**

- **Most used** SQL command 🏆
- **READ-ONLY** operation 👀 (doesn't change data)
- Can be simple or very **complex** 🧩

---

## 4️⃣ DCL (Data Control Language) 🔐🛡️

**Purpose 🎯:** Control access permissions and security for database users

### ✅ GRANT - Giving Permissions

**Linear Explanation:** GRANT gives users specific permissions to access or modify database objects, like giving someone keys to certain rooms in a building.

```python
# ✅ GRANT SELECT - Give read permission
GRANT SELECT 👁️                           -- Permission to view data
ON students 👨‍🎓                            -- On students table
TO user_john 👤;                          -- To specific user

# ✅ GRANT multiple privileges - Give several permissions
GRANT SELECT 👁️, INSERT ➕, UPDATE 🔄   -- Multiple operations
ON students 👨‍🎓
TO user_admin 👨‍💼;                        -- To admin user

# ✅ GRANT ALL - Give full access
GRANT ALL PRIVILEGES 🔓                   -- Every permission ⭐
ON school_management.* 🏫                 -- On entire database
TO user_superadmin 👑;                    -- To super admin
```

---

### ❌ REVOKE - Taking Away Permissions

**Linear Explanation:** REVOKE removes previously granted permissions, like taking back keys from someone who no longer needs access.

```python
# ❌ REVOKE SELECT - Remove read permission
REVOKE SELECT 👁️                         -- Take away view permission
ON students 👨‍🎓
FROM user_john 👤;                        -- From specific user

# ❌ REVOKE multiple privileges - Remove several permissions
REVOKE INSERT ➕, UPDATE 🔄              -- Remove write permissions
ON students 👨‍🎓
FROM user_admin 👨‍💼;                      -- From admin user

# ❌ REVOKE ALL - Remove all access
REVOKE ALL PRIVILEGES 🔒                  -- Every permission removed
ON school_management.* 🏫
FROM user_john 👤;                        -- Complete access removal
```

**Key Points 🔑:**

- Controls **WHO** 👤 can do **WHAT** 🛠️
- Essential for **security** 🛡️
- Managed by **database administrator** 👨‍💼

---

## 5️⃣ TCL (Transaction Control Language) 🔄💾

**Purpose 🎯:** Manage database transactions and ensure data integrity

**What is a Transaction? 💭:** A transaction is a **group of SQL operations** that must all succeed together or all fail together - like a bank transfer where money must leave one account AND enter another, not just one or the other.

### ✔️ COMMIT - Permanent Save

**Linear Explanation:** COMMIT permanently saves all changes made in the current transaction, like hitting the "Save" button on a document - once committed, changes cannot be undone.

```python
# 🔄 Transaction example with COMMIT
BEGIN TRANSACTION 🚀;                     -- Start transaction

    # ➕ Add new student
    INSERT INTO students 👨‍🎓 (student_id 🆔, name 📝, age ⏳)
    VALUES (10, 'Frank Miller' 👨, 24);
    
    # 🔄 Update another student
    UPDATE students 👨‍🎓
    SET age ⏳ = 25
    WHERE student_id 🆔 = 1;

COMMIT ✔️;                                -- Save all changes permanently 💾
```

---

### ↩️ ROLLBACK - Undo Changes

**Linear Explanation:** ROLLBACK cancels all changes made in the current transaction, like pressing "Undo" - returns the database to its state before the transaction started.

```python
# 🔄 Transaction example with ROLLBACK
BEGIN TRANSACTION 🚀;                     -- Start transaction

    # ❌ Delete a student
    DELETE FROM students 👨‍🎓
    WHERE student_id 🆔 = 10;
    
    # 🔍 Check if deletion was correct
    -- Oops! Wrong student deleted! 😱

ROLLBACK ↩️;                              -- Undo all changes ❌🔄
                                          -- Student 10 restored ✅
```

---

### 💾 SAVEPOINT - Partial Rollback Points

**Linear Explanation:** SAVEPOINT creates checkpoints within a transaction, like saving progress in a video game - you can roll back to a savepoint instead of starting over from the beginning.

```python
# 🔄 Transaction with multiple SAVEPOINTS
BEGIN TRANSACTION 🚀;                     -- Start transaction

    # ➕ Operation 1
    INSERT INTO students 👨‍🎓 (student_id 🆔, name 📝, age ⏳)
    VALUES (11, 'Grace Lee' 👩, 22);
    
    SAVEPOINT sp1 💾;                     -- Checkpoint 1 🚩
    
    # 🔄 Operation 2
    UPDATE students 👨‍🎓
    SET age ⏳ = 23
    WHERE student_id 🆔 = 11;
    
    SAVEPOINT sp2 💾;                     -- Checkpoint 2 🚩
    
    # ❌ Operation 3
    DELETE FROM students 👨‍🎓
    WHERE student_id 🆔 = 5;
    
    # 😱 Oops! Didn't want to delete that!
    
    ROLLBACK TO SAVEPOINT sp2 ↩️💾;       -- Go back to checkpoint 2 🔙
                                           -- Operation 3 undone ❌
                                           -- Operations 1 & 2 kept ✅

COMMIT ✔️;                                 -- Save remaining changes 💾
```

**Transaction Control Comparison 🆚:**

|Command 📋|Effect 🎯|Use Case 💡|
|---|---|---|
|**COMMIT** ✔️|Save all changes|Work completed successfully ✅|
|**ROLLBACK** ↩️|Undo all changes|Error occurred, abort 🚨|
|**SAVEPOINT** 💾|Create checkpoint|Complex operations, partial undo 🎮|

---

## 🎯 Important SQL Keywords - The Essential Toolkit

### 🎨 DISTINCT - Remove Duplicates

**Linear Explanation:** DISTINCT eliminates duplicate values from query results, showing each unique value only once - like removing repeated names from a list.

```python
# 🎨 Without DISTINCT - Shows duplicates
SELECT age ⏳ FROM students 👨‍🎓;
# Result: 20, 22, 21, 22, 20, 23 ❌ (duplicates present)

# ✨ With DISTINCT - Only unique values
SELECT DISTINCT age ⏳ FROM students 👨‍🎓;
# Result: 20, 21, 22, 23 ✅ (duplicates removed)

# 🎨 DISTINCT on multiple columns
SELECT DISTINCT age ⏳, enrollment_date 📅
FROM students 👨‍🎓;                        -- Unique combinations only ✨
```

---

### 🏷️ AS - Creating Aliases

**Linear Explanation:** AS renames columns or tables temporarily in query results, making output more readable - like giving someone a nickname that's easier to use.

```python
# 🏷️ Column alias - Rename output column
SELECT name 📝 AS student_name 👨‍🎓,      -- 'name' → 'student_name'
       age ⏳ AS years_old 🎂,            -- 'age' → 'years_old'
       email 📧 AS contact_email 📬      -- 'email' → 'contact_email'
FROM students 👨‍🎓;

# 🏷️ Table alias - Shorten table name
SELECT s.name 📝, s.age ⏳               -- 's' = students table
FROM students AS s 👨‍🎓;                 -- Short alias 's' ⚡

# 🔢 Calculated field with alias
SELECT name 📝,
       age ⏳,
       age * 365 AS age_in_days 📅       -- New calculated column 🧮
FROM students 👨‍🎓;
```

---

### 🔍 LIKE - Pattern Matching

**Linear Explanation:** LIKE searches for patterns in text data using wildcards - like using a search box where you only remember part of what you're looking for.

**Wildcards 🃏:**

- **%** = Any sequence of characters (0 or more) 🌟
- **_** = Exactly one character 1️⃣

```python
# 🔍 LIKE with % wildcard - Starts with 'A'
SELECT name 📝 FROM students 👨‍🎓
WHERE name 📝 LIKE 'A%' 🔤;               -- Alice, Adam, Amanda ✅

# 🔍 LIKE - Ends with 'son'
SELECT name 📝 FROM students 👨‍🎓
WHERE name 📝 LIKE '%son' 🔤;             -- Johnson, Wilson, Peterson ✅

# 🔍 LIKE - Contains 'an' anywhere
SELECT name 📝 FROM students 👨‍🎓
WHERE name 📝 LIKE '%an%' 🔤;             -- Daniel, Anna, Brandon ✅

# 🔍 LIKE with _ wildcard - Exactly 5 characters
SELECT name 📝 FROM students 👨‍🎓
WHERE name 📝 LIKE '_____' 🔤;            -- Alice, David (5 letters) ✅

# 🔍 Complex pattern - 2nd character is 'a'
SELECT name 📝 FROM students 👨‍🎓
WHERE name 📝 LIKE '_a%' 🔤;              -- David, Carol, Barbara ✅
```

**LIKE Pattern Examples 📚:**

|Pattern 🔤|Matches ✅|Examples 💡|
|---|---|---|
|`'A%'`|Starts with A|Alice, Andrew, Amy|
|`'%a'`|Ends with a|Sara, Diana, Maria|
|`'%abc%'`|Contains abc|Tabcde, Xabcyz|
|`'_a%'`|2nd char is a|David, Carol|
|`'___'`|Exactly 3 chars|Tom, Sam, Joe|

---

### 📥 IN - Multiple Value Check

**Linear Explanation:** IN checks if a value matches any value in a list, like checking if someone's name appears on a guest list - more concise than multiple OR conditions.

```python
# 📥 IN operator - Check multiple values
SELECT name 📝, age ⏳
FROM students 👨‍🎓
WHERE age ⏳ IN (20, 22, 25) 🔢;          -- Ages 20 OR 22 OR 25 ✅

# 📥 IN with strings - Text values
SELECT name 📝, email 📧
FROM students 👨‍🎓
WHERE name 📝 IN ('Alice', 'Bob', 'Carol') 👥; -- Specific names 🎯

# ❌ NOT IN - Exclude values
SELECT name 📝, age ⏳
FROM students 👨‍🎓
WHERE age ⏳ NOT IN (20, 21) 🚫;          -- Exclude ages 20 & 21 ❌

# 📥 IN with subquery - Dynamic list
SELECT name 📝
FROM students 👨‍🎓
WHERE student_id 🆔 IN (                  -- From another query 🔄
    SELECT student_id FROM enrollments 📚
    WHERE course = 'Math' ➗
);
```

**IN vs OR Comparison 🆚:**

```python
# ❌ Using OR - Verbose and repetitive
WHERE age = 20 OR age = 22 OR age = 25

# ✅ Using IN - Clean and concise
WHERE age IN (20, 22, 25)
```

---

### 📏 BETWEEN - Range Check

**Linear Explanation:** BETWEEN checks if a value falls within a range (inclusive), like checking if someone's age is between 18 and 25 - simpler than using >= and <=.

```python
# 📏 BETWEEN with numbers - Age range
SELECT name 📝, age ⏳
FROM students 👨‍🎓
WHERE age ⏳ BETWEEN 20 AND 25 📊;        -- 20 ≤ age ≤ 25 ✅

# 📏 BETWEEN with dates - Date range
SELECT name 📝, enrollment_date 📅
FROM students 👨‍🎓
WHERE enrollment_date 📅 
      BETWEEN '2024-01-01' AND '2024-12-31' 🗓️; -- Year 2024 📆

# 📏 BETWEEN with strings - Alphabetical range
SELECT name 📝
FROM students 👨‍🎓
WHERE name 📝 BETWEEN 'A' AND 'M' 🔤;     -- Names A-M ✅

# ❌ NOT BETWEEN - Outside range
SELECT name 📝, age ⏳
FROM students 👨‍🎓
WHERE age ⏳ NOT BETWEEN 20 AND 25 🚫;    -- age < 20 OR age > 25 ❌
```

**BETWEEN vs Comparison Operators 🆚:**

```python
# ❌ Using AND - More verbose
WHERE age >= 20 AND age <= 25

# ✅ Using BETWEEN - More readable
WHERE age BETWEEN 20 AND 25
```

**⚠️ Important Notes:**

- BETWEEN is **inclusive** 📥 (includes both endpoints)
- Works with **numbers 🔢, dates 📅, and strings 🔤**

---

### 🈳 IS NULL - Checking for Missing Data

**Linear Explanation:** IS NULL checks if a field has no value (NULL), like checking if a form field was left blank - cannot use = NULL because NULL represents unknown.

```python
# 🈳 IS NULL - Find missing values
SELECT name 📝, email 📧
FROM students 👨‍🎓
WHERE email 📧 IS NULL 🈳;                -- Students without email ❌

# ✅ IS NOT NULL - Find existing values
SELECT name 📝, phone_number 📱
FROM students 👨‍🎓
WHERE phone_number 📱 IS NOT NULL ✅;     -- Students with phone 📞

# 🔍 Multiple NULL checks
SELECT name 📝
FROM students 👨‍🎓
WHERE email 📧 IS NULL 🈳                -- No email AND
  AND phone_number 📱 IS NULL 🈳;         -- No phone ⚠️

# 🔄 Combining IS NULL with other conditions
SELECT name 📝, age ⏳
FROM students 👨‍🎓
WHERE age ⏳ > 20                         -- Age over 20
  AND email 📧 IS NOT NULL ✅;           -- Has email ✅
```

**❌ Common Mistake:**

```python
# ❌ WRONG - Cannot use = with NULL
WHERE email = NULL                       -- This doesn't work! ⚠️

# ✅ CORRECT - Must use IS NULL
WHERE email IS NULL                      -- This works! ✅
```

**Why IS NULL? 💭:**

- **NULL** means **"unknown"** ❓
- You cannot **compare** with unknown ≠
- NULL ≠ NULL (two unknowns aren't equal) 🤔

---

## 📊 Combining Keywords - Power Queries

```python
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
```

---

## 🎓 Summary: What We Learned Today

**🏗️ DDL (Data Definition Language) - Structure Builders:**

- `CREATE` 🆕 → Build new database objects (tables, databases, indexes) from scratch
- `ALTER` 🔧 → Modify existing structures by adding, changing, or removing columns
- `DROP` 🗑️ → Permanently delete database objects and all their data (⚠️ irreversible)
- `TRUNCATE` ⚡ → Quickly remove all data while keeping table structure intact

**✏️ DML (Data Manipulation Language) - Data Operators:**

- `INSERT` ➕ → Add new records (rows) into tables with specified values
- `UPDATE` 🔄 → Modify existing records using SET and WHERE clauses for targeting
- `DELETE` ❌ → Remove specific records permanently (can be rolled back in transactions)

**🔍 DQL (Data Query Language) - Information Retriever:**

- `SELECT` 📋 → Retrieve and display data from tables (most frequently used SQL command 🏆)

**🔐 DCL (Data Control Language) - Security Guards:**

- `GRANT` ✅ → Give users specific permissions to access or modify database objects
- `REVOKE` ❌ → Remove previously granted permissions from users for security control

**🔄 TCL (Transaction Control Language) - Data Integrity Managers:**

- `COMMIT` ✔️ → Permanently save all changes made in current transaction (no undo 💾)
- `ROLLBACK` ↩️ → Undo all changes and return database to pre-transaction state
- `SAVEPOINT` 💾 → Create checkpoints within transactions for partial rollback capability

**🎯 Essential SQL Keywords - Query Enhancers:**

- `DISTINCT` ✨ → Remove duplicate values from results, showing only unique entries
- `AS` 🏷️ → Create aliases for columns/tables to make queries more readable and concise
- `LIKE` 🔍 → Pattern matching with wildcards (% = any chars, _ = single char)
- `IN` 📥 → Check if value matches any item in a list (cleaner than multiple OR)
- `BETWEEN` 📏 → Check if value falls within inclusive range (cleaner than >= AND <=)
- `IS NULL` 🈳 → Check for missing/empty values (⚠️ cannot use = NULL)