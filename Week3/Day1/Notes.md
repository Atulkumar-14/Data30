# 📊 Day 1: Introduction to Databases 🗄️ & Basic SQL Syntax 💻

---

## 🎯 Part 1: Understanding Database Fundamentals 🏗️

### 📋 What is a Table? 🗂️

A **table** 📊 is like a spreadsheet 📄 where data 📝 is organized in a structured format. Think of it as a container 📦 that holds related information 💾.

**Example:** A `Students` 🎓 table

```
┌─────────────┬──────────────┬─────────┬────────────┐
│ StudentID 🆔│ Name 👤     │ Age ⏳ │ Major 📚   │
├─────────────┼──────────────┼─────────┼────────────┤
│ 1           │ Alice        │ 20      │ CS         │
│ 2           │ Bob          │ 22      │ Math       │
│ 3           │ Charlie      │ 21      │ Physics    │
└─────────────┴──────────────┴─────────┴────────────┘
```

---

### 📏 What are Rows? ➡️

**Rows** (also called **records** 📋 or **tuples** 🔢) are horizontal entries 🔄 in a table. Each row 🔽 represents a single item 🎯 or entity 👤.

**Example:** In the Students 🎓 table above:

- Row 1️⃣: `1, Alice, 20, CS` ← This is one complete student record 📝
- Row 2️⃣: `2, Bob, 22, Math` ← Another student record 📝

**📌 Key Point:** Each row = One complete piece of information about something specific 🎯

---

### 📊 What are Columns? ⬇️

**Columns** (also called **fields** 📝 or **attributes** 🏷️) are vertical divisions ⬆️ in a table. Each column 📐 represents a specific property 🔖 or characteristic 🎨 of the data 💾.

**Example:** In the Students 🎓 table:

- `StudentID` 🆔 column → Stores unique identification numbers 🔢
- `Name` 👤 column → Stores student names 📛
- `Age` ⏳ column → Stores ages 🎂
- `Major` 📚 column → Stores field of study 🎓

**📌 Key Point:** Each column = One type of information 📊 about all items

---

### 🏗️ What is a Schema? 📐

A **schema** 🗺️ is the blueprint 📋 or structure 🏛️ of a database 🗄️. It defines:

- What tables 📊 exist
- What columns 📏 each table has
- What data types 🔤 each column uses (text 📝, numbers 🔢, dates 📅)
- Rules ⚖️ and constraints 🔒

**Example Schema:**

```
Database: University 🎓
│
├── Table: Students 👨‍🎓
│   ├── StudentID (Integer 🔢, Primary Key 🔑)
│   ├── Name (Text 📝)
│   ├── Age (Integer 🔢)
│   └── Major (Text 📝)
│
└── Table: Courses 📚
    ├── CourseID (Integer 🔢, Primary Key 🔑)
    ├── CourseName (Text 📝)
    └── Credits (Integer 🔢)
```

**📌 Linear Explanation:** Schema is like an architectural plan 📐 for a building 🏢 - it shows what rooms exist, their purpose, and how they're organized, but it's not the actual building itself.

---

## 🔑 Part 2: Understanding Keys & Relationships 🔗

### 🔐 What is a Primary Key? 🎯

A **Primary Key** 🔑 is a unique identifier 🆔 for each row ➡️ in a table 📊. It ensures that no two rows 📋 are exactly the same.

**Rules for Primary Key:**

- ✅ Must be unique (no duplicates 🚫)
- ✅ Cannot be NULL ⛔ (must have a value)
- ✅ Never changes 🔒

**Example:**

```
Students Table 🎓
┌─────────────┬──────────────┬─────────┐
│ StudentID 🔑│ Name 👤     │ Age ⏳ │
├─────────────┼──────────────┼─────────┤
│ 101         │ Alice        │ 20      │  ← StudentID 101 is unique 🆔
│ 102         │ Bob          │ 22      │  ← StudentID 102 is unique 🆔
│ 103         │ Charlie      │ 21      │  ← StudentID 103 is unique 🆔
└─────────────┴──────────────┴─────────┘
     ↑
   Primary Key 🔑
```

**📌 Key Point:** Primary Key = Unique ID tag 🏷️ for each record 📝

---

### 🔗 What is a Foreign Key? 🌉

A **Foreign Key** 🗝️ is a column 📏 in one table 📊 that refers to 👉 the Primary Key 🔑 of another table 📋. It creates a relationship 🔗 between two tables 🤝.

**Example:**

```
Students Table 🎓                    Enrollments Table 📝
┌─────────────┬──────────┐          ┌──────────────┬─────────────┬───────────┐
│ StudentID 🔑│ Name 👤 │          │ EnrollmentID │ StudentID 🗝️│ CourseID  │
├─────────────┼──────────┤          ├──────────────┼─────────────┼───────────┤
│ 101         │ Alice    │    ┌────→│ 1            │ 101         │ CS101     │
│ 102         │ Bob      │    │     │ 2            │ 102         │ MATH201   │
│ 103         │ Charlie  │────┘     │ 3            │ 103         │ PHY301    │
└─────────────┴──────────┘          └──────────────┴─────────────┴───────────┘
                                              ↑
                                        Foreign Key 🗝️
                                    (points to Students.StudentID)
```

**📌 Linear Explanation:** Foreign Key is like a reference link 🔗 or pointer 👉 that says "this row is connected to that row in another table". It's how we maintain relationships 🤝 between different pieces of data 💾.

---

### 🤝 Types of Relationships 🔗

#### 1️⃣ One-to-Many (1:N) 📊

One record 📝 in Table A 🅰️ can relate to many records 📋 in Table B 🅱️.

**Example:** One student 👤 can enroll in many courses 📚

```
Student 👤 (1) ────→ (Many) Enrollments 📝
    Alice ────────→ CS101, MATH201, PHY301
```

#### 2️⃣ Many-to-Many (M:N) 🔄

Many records 📝 in Table A 🅰️ can relate to many records 📋 in Table B 🅱️.

**Example:** Many students 👥 can enroll in many courses 📚

```
Students 👥 ←────→ Courses 📚
(requires junction table 🔗)
```

#### 3️⃣ One-to-One (1:1) 🔗

One record 📝 in Table A 🅰️ relates to exactly one record 📋 in Table B 🅱️.

**Example:** One student 👤 has one student ID card 🆔

---

## 💻 Part 3: Basic SQL Syntax Structure ⚙️

### 🎯 The SELECT Statement 🔍

The **SELECT** statement 📋 is used to retrieve 🎣 data 💾 from a database 🗄️.

**Basic Syntax:**

```sql
-- 📝 Select specific columns from a table
SELECT column1, column2, column3  -- 🎯 Choose which columns to display
FROM table_name;                   -- 📊 Specify the table

-- 🌟 Select all columns using asterisk
SELECT * FROM Students;            -- * means "all columns" 📋
```

**Example:**

```sql
-- 🎓 Get all student names and ages
SELECT Name, Age    -- 📝 We want Name and Age columns
FROM Students;      -- 📊 From the Students table
```

**Output:**

```
┌──────────────┬─────────┐
│ Name 👤     │ Age ⏳ │
├──────────────┼─────────┤
│ Alice        │ 20      │
│ Bob          │ 22      │
│ Charlie      │ 21      │
└──────────────┴─────────┘
```

---

### 🔎 The WHERE Clause 🎯

The **WHERE** clause 🔍 filters ⚗️ rows ➡️ based on a condition ⚖️. It helps you find specific records 📝 that meet certain criteria 🎯.

**Syntax:**

```sql
SELECT column1, column2            -- 📝 Columns to display
FROM table_name                    -- 📊 Table to search
WHERE condition;                   -- 🔍 Filter condition
```

**Example:**

```sql
-- 🎯 Find students who are 21 or older
SELECT Name, Age                   -- 📝 Show name and age
FROM Students                      -- 📊 From Students table
WHERE Age >= 21;                   -- 🔍 Filter: age greater than or equal to 21
```

**Output:**

```
┌──────────────┬─────────┐
│ Name 👤     │ Age ⏳ │
├──────────────┼─────────┤
│ Bob          │ 22      │
│ Charlie      │ 21      │
└──────────────┴─────────┘
```

**Common WHERE Operators:**

- `=` ➡️ Equal to ⚖️
- `>` ➡️ Greater than 📈
- `<` ➡️ Less than 📉
- `>=` ➡️ Greater than or equal to ⬆️
- `<=` ➡️ Less than or equal to ⬇️
- `<>` or `!=` ➡️ Not equal to ❌
- `BETWEEN` ➡️ Within a range 📏
- `LIKE` ➡️ Pattern matching 🔍
- `IN` ➡️ Matches any value in a list 📋

---

### 📦 The GROUP BY Clause 🔢

The **GROUP BY** clause 📊 groups rows ➡️ that have the same values 🔄 in specified columns 📏. It's often used with aggregate functions 🧮 like COUNT(), SUM(), AVG().

**Syntax:**

```sql
SELECT column1, AGGREGATE_FUNCTION(column2)  -- 📊 Column and calculation
FROM table_name                              -- 📋 Table name
GROUP BY column1;                            -- 📦 Group by column
```

**Example:**

```sql
-- 📊 Count how many students are in each major
SELECT Major, COUNT(*) AS StudentCount  -- 📚 Major and count of students
FROM Students                           -- 🎓 From Students table
GROUP BY Major;                         -- 📦 Group by Major field
```

**Sample Data:**

```
Students Table:
┌───────┬─────────┬────────┐
│ Name  │ Age     │ Major  │
├───────┼─────────┼────────┤
│ Alice │ 20      │ CS     │
│ Bob   │ 22      │ Math   │
│ Clara │ 21      │ CS     │
│ Dave  │ 23      │ Math   │
│ Eve   │ 20      │ CS     │
└───────┴─────────┴────────┘
```

**Output:**

```
┌────────┬──────────────┐
│ Major  │ StudentCount │
├────────┼──────────────┤
│ CS     │ 3            │
│ Math   │ 2            │
└────────┴──────────────┘
```

**📌 Linear Explanation:** GROUP BY is like sorting items 📦 into boxes 🗃️ based on labels 🏷️ - all CS students go in one box, all Math students in another, then we count how many are in each box 🔢.

---

### 🎯 The HAVING Clause 🔍

The **HAVING** clause ⚗️ filters 🔎 groups 📦 created by GROUP BY. It's like WHERE but for groups, not individual rows 📋.

**Syntax:**

```sql
SELECT column1, AGGREGATE_FUNCTION(column2)  -- 📊 Columns and calculations
FROM table_name                              -- 📋 Table name
GROUP BY column1                             -- 📦 Group by column
HAVING condition;                            -- 🔍 Filter groups
```

**Example:**

```sql
-- 📊 Find majors with more than 2 students
SELECT Major, COUNT(*) AS StudentCount       -- 📚 Major and count
FROM Students                                -- 🎓 From Students table
GROUP BY Major                               -- 📦 Group by Major
HAVING COUNT(*) > 2;                         -- 🔍 Only groups with count > 2
```

**Output:**

```
┌────────┬──────────────┐
│ Major  │ StudentCount │
├────────┼──────────────┤
│ CS     │ 3            │
└────────┴──────────────┘
```

**📌 Key Difference:**

- **WHERE** 🔍 ➡️ Filters individual rows ➡️ before grouping 📦
- **HAVING** 🔍 ➡️ Filters groups 📦 after grouping

---

### 📶 The ORDER BY Clause 🔢

The **ORDER BY** clause 🎚️ sorts 📊 the result set ✨ in ascending ⬆️ (ASC) or descending ⬇️ (DESC) order.

**Syntax:**

```sql
SELECT column1, column2              -- 📝 Columns to display
FROM table_name                      -- 📊 Table name
ORDER BY column1 ASC/DESC;           -- 🔢 Sort by column (ASC=⬆️, DESC=⬇️)
```

**Example:**

```sql
-- 📊 Get all students sorted by age (oldest first ⬇️)
SELECT Name, Age                     -- 📝 Name and age columns
FROM Students                        -- 🎓 From Students table
ORDER BY Age DESC;                   -- ⬇️ Sort by age, descending (high to low)
```

**Output:**

```
┌──────────────┬─────────┐
│ Name 👤     │ Age ⏳ │
├──────────────┼─────────┤
│ Bob          │ 22      │  ⬇️ Highest age first
│ Charlie      │ 21      │
│ Alice        │ 20      │  ⬇️ Lowest age last
└──────────────┴─────────┘
```

**📌 Notes:**

- **ASC** ⬆️ = Ascending (default) = A-Z, 0-9, oldest-to-newest 📅
- **DESC** ⬇️ = Descending = Z-A, 9-0, newest-to-oldest 📅

---

## 🎓 Complete SQL Query Structure 🏗️

Here's how all clauses work together 🔗:

```sql
SELECT column1, column2, AGGREGATE_FUNCTION(column3)  -- 1️⃣ Choose columns 📝
FROM table_name                                       -- 2️⃣ Specify table 📊
WHERE condition                                       -- 3️⃣ Filter rows 🔍
GROUP BY column1, column2                             -- 4️⃣ Group rows 📦
HAVING aggregate_condition                            -- 5️⃣ Filter groups 🔎
ORDER BY column1 ASC/DESC;                            -- 6️⃣ Sort results 🔢
```

**Execution Order 🔄:**

```
FROM 📊     →    WHERE 🔍    →    GROUP BY 📦    →    HAVING 🔎    →    SELECT 📝    →    ORDER BY 🔢
(Get table)   (Filter rows)   (Group rows)    (Filter groups)   (Choose cols)   (Sort results)
```

**Complete Example:**

```sql
-- 📊 Find majors with average age > 20, show only those, sorted by avg age
SELECT Major, AVG(Age) AS AvgAge               -- 📝 Show major and average age
FROM Students                                  -- 🎓 From Students table
WHERE Age >= 18                                -- 🔍 Only adults (18+)
GROUP BY Major                                 -- 📦 Group by major
HAVING AVG(Age) > 20                           -- 🔎 Only groups where avg age > 20
ORDER BY AvgAge DESC;                          -- ⬇️ Sort by average age, high to low
```

---

## 📚 Summary: What We Learned Today 🎯

• **Tables 📊**: Structured containers 📦 for data 💾, organized in rows ➡️ and columns ⬇️, like spreadsheets 📄 with strict rules ⚖️

• **Keys 🔑**: Primary keys 🔐 uniquely identify 🆔 each row (like student IDs 👤), while foreign keys 🗝️ create links 🔗 between tables 📊 (establishing relationships 🤝)

• **Schema 🏗️**: The blueprint 📐 or architectural plan 🗺️ that defines database structure 🏛️, including tables 📊, columns 📏, data types 🔤, and rules ⚖️

• **SELECT 🔍**: Retrieves data 📥 from tables 📊 (choosing which columns 📝 to display ✨)

• **WHERE 🔎**: Filters individual rows ➡️ based on conditions 🎯 (like finding students 👥 aged 21+ ⏳)

• **GROUP BY 📦**: Organizes rows ➡️ into groups 🗃️ based on column values 🔢 (like sorting by major 📚), used with aggregate functions 🧮 (COUNT, SUM, AVG)

• **HAVING 🔍**: Filters grouped results 📦 after aggregation 🧮 (WHERE for groups, not rows 📋)

• **ORDER BY 🔢**: Sorts results ✨ in ascending ⬆️ (ASC) or descending ⬇️ (DESC) order 📊