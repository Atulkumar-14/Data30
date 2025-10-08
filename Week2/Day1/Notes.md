Day 1: Pandas – Basics 🐼
🎯 Introduction – What is Pandas?
Pandas 🐼 is a powerful Python library 📚 used for data manipulation 🔧 and analysis 📈. It provides easy-to-use data structures and data analysis tools that make working with structured data fast ⚡, flexible 🤸, and expressive 💬.

🤔 Why is Pandas Essential?
Feature 🎨	Description 📝
Data Handling 📦	Efficiently handles large datasets 📊 with millions of rows
Data Cleaning 🧹	Easy removal of missing/duplicate data 🗑️
Data Analysis 🔍	Quick statistical analysis 📊 and aggregation 🔢
File Operations 📂	Read/Write multiple formats (CSV 📄, Excel 📗, JSON 🗂️)
Integration 🔗	Works seamlessly with NumPy, Matplotlib, Scikit-learn 🤝
🎯 Linear Explanation: Think of Pandas as Excel 📊 on steroids 💪! It lets you load data from files, clean it up, analyze patterns, and export results—all through simple Python code 💻 instead of clicking through menus 🖱️.

📥 Installing Pandas
To install Pandas 🐼, simply run this command in your terminal 💻:

pip install pandas
✅ Verification: After installation, verify it works:

import pandas as pd  # 📦 Import pandas library with alias 'pd'
print(pd.__version__)  # 🔍 Check installed version
🏗️ Data Structures in Pandas
Pandas provides two primary data structures 📊:

1️⃣ Series (1-D Array) 📏
A Series is a one-dimensional 📏 labeled array that can hold any data type 🔢📝.

import pandas as pd  # 📦 Import pandas

# 🎨 Creating a Series from a list
data = [10, 20, 30, 40, 50]  # 📋 List of numbers
series = pd.Series(data)  # 🔄 Convert to Series
print(series)  # 🖨️ Display Series

# Output:
# 0    10  ← Index 0️⃣
# 1    20  ← Index 1️⃣
# 2    30  ← Index 2️⃣
# 3    40  ← Index 3️⃣
# 4    50  ← Index 4️⃣
# dtype: int64  ← Data type 🔢

# 🏷️ Creating Series with custom index
fruits_series = pd.Series([5, 10, 15], index=['🍎 Apple', '🍌 Banana', '🍊 Orange'])
print(fruits_series)

# Output:
# 🍎 Apple      5
# 🍌 Banana    10
# 🍊 Orange    15
🎯 Linear Explanation: A Series 📏 is like a single column in Excel 📊 with row labels 🏷️. Each value has an index (like row numbers) that you can customize.

2️⃣ DataFrame (2-D Table) 📊
A DataFrame 📊 is a two-dimensional labeled data structure with columns of potentially different types. Think of it as a table 🗂️ or spreadsheet 📄.

import pandas as pd  # 📦 Import pandas

# 🎨 Creating a DataFrame from a dictionary
data = {
    '🏷️ Name': ['Alice', 'Bob', 'Charlie', 'Diana'],  # 📝 Names column
    '🎂 Age': [25, 30, 35, 28],  # 🔢 Ages column
    '🌆 City': ['New York', 'Paris', 'London', 'Tokyo']  # 🗺️ Cities column
}

df = pd.DataFrame(data)  # 🔄 Convert dict to DataFrame
print(df)  # 🖨️ Display DataFrame

# Output:
#    🏷️ Name  🎂 Age      🌆 City
# 0     Alice     25  New York  ← Row 0️⃣
# 1       Bob     30     Paris  ← Row 1️⃣
# 2   Charlie     35    London  ← Row 2️⃣
# 3     Diana     28     Tokyo  ← Row 3️⃣
🎯 Linear Explanation: A DataFrame 📊 is like a complete Excel sheet 📄 with multiple columns. Each column can have different data types (numbers 🔢, text 📝, dates 📅), and rows are labeled with an index.

🛠️ Creating DataFrames
Method 1️⃣: From Lists 📋
import pandas as pd  # 📦 Import library

# 📋 Creating DataFrame from list of lists
data = [
    ['Alice', 25, 'New York'],  # 🧑 Row 1
    ['Bob', 30, 'Paris'],       # 🧑 Row 2
    ['Charlie', 35, 'London']   # 🧑 Row 3
]

df = pd.DataFrame(data, columns=['🏷️ Name', '🎂 Age', '🌆 City'])  # 🏷️ Add column names
print(df)  # 🖨️ Display
Method 2️⃣: From Dictionary 📖
import pandas as pd  # 📦 Import

# 📖 Dictionary where keys = column names
data = {
    '📦 Product': ['Laptop', 'Mouse', 'Keyboard'],  # 🛒 Products
    '💰 Price': [1000, 25, 75],  # 💵 Prices
    '📊 Stock': [50, 200, 150]  # 📦 Stock quantity
}

df = pd.DataFrame(data)  # 🔄 Convert
print(df)  # 🖨️ Display

# Output:
#   📦 Product  💰 Price  📊 Stock
# 0     Laptop      1000        50
# 1      Mouse        25       200
# 2   Keyboard        75       150
🎯 Linear Explanation: Dictionaries 📖 are the most common way to create DataFrames. Each key becomes a column name 🏷️, and the list of values becomes that column's data 📊.

Method 3️⃣: From NumPy Arrays 🔢
import pandas as pd  # 📦 Import pandas
import numpy as np  # 🔢 Import numpy

# 🎲 Create random data using NumPy
data = np.random.randint(0, 100, size=(4, 3))  # 🎲 4 rows, 3 columns, random numbers 0-99
df = pd.DataFrame(data, columns=['📊 Score1', '📊 Score2', '📊 Score3'])  # 🏷️ Name columns
print(df)  # 🖨️ Display

# Output (random):
#    📊 Score1  📊 Score2  📊 Score3
# 0         45         67         89
# 1         12         34         56
# 2         78         90         23
# 3         45         67         12
Method 4️⃣: From CSV Files 📄
import pandas as pd  # 📦 Import

# 📂 Reading CSV file
df = pd.read_csv('data.csv')  # 📥 Load CSV file into DataFrame
print(df)  # 🖨️ Display

# 📝 Note: 'data.csv' should exist in your working directory
🎯 Linear Explanation: CSV files 📄 (Comma Separated Values) are the most common format for storing tabular data. Pandas can read them in just one line 📥 and convert them into a DataFrame 📊.

📂 Reading and Writing Data
📥 Reading CSV Files
import pandas as pd  # 📦 Import

# 📖 Read CSV with various options
df = pd.read_csv(
    'sales_data.csv',  # 📂 File name
    sep=',',  # 🔗 Column separator (comma)
    header=0,  # 🏷️ First row is column names
    index_col=0,  # 🔢 Use first column as index
    na_values=['NA', 'null', '']  # ❌ Treat these as missing values
)
print(df.head())  # 🔍 Preview first 5 rows
📤 Writing to CSV Files
import pandas as pd  # 📦 Import

# 🎨 Create sample DataFrame
data = {
    '🏷️ Name': ['Alice', 'Bob', 'Charlie'],  # 📝 Names
    '💰 Salary': [50000, 60000, 70000]  # 💵 Salaries
}
df = pd.DataFrame(data)  # 🔄 Create DataFrame

# 💾 Save to CSV
df.to_csv(
    'output.csv',  # 📂 Output file name
    index=False,  # 🚫 Don't write row index
    sep=',',  # 🔗 Use comma separator
    encoding='utf-8'  # 📝 Character encoding
)
print("✅ File saved successfully!")  # ✔️ Confirmation
📊 Other File Formats
# 📗 Excel Files
df = pd.read_excel('data.xlsx', sheet_name='Sheet1')  # 📥 Read Excel
df.to_excel('output.xlsx', sheet_name='Results', index=False)  # 📤 Write Excel

# 🗂️ JSON Files
df = pd.read_json('data.json')  # 📥 Read JSON
df.to_json('output.json', orient='records')  # 📤 Write JSON

# 📊 SQL Database
import sqlite3  # 🗄️ Import SQL library
conn = sqlite3.connect('database.db')  # 🔗 Connect to database
df = pd.read_sql('SELECT * FROM table_name', conn)  # 📥 Query database
df.to_sql('new_table', conn, if_exists='replace')  # 📤 Save to database
🎯 Linear Explanation: Pandas supports multiple file formats 📂. The pattern is always similar: read_* to load data 📥 and to_* to save data 📤. This makes it easy to convert between formats 🔄.

🔍 Inspecting Data
👀 Quick Preview Methods
import pandas as pd  # 📦 Import

# 🎨 Sample DataFrame
df = pd.read_csv('large_dataset.csv')  # 📂 Load data

# 🔝 View first 5 rows (default)
print(df.head())  # 👁️ Preview top

# 🔝 View first N rows
print(df.head(10))  # 👁️ Top 10 rows

# 🔽 View last 5 rows (default)
print(df.tail())  # 👁️ Preview bottom

# 🔽 View last N rows
print(df.tail(3))  # 👁️ Bottom 3 rows
ℹ️ DataFrame Information
# 📋 Get detailed information about DataFrame
print(df.info())  # ℹ️ Display info

# Output shows:
# 🔢 Number of rows and columns
# 🏷️ Column names
# 📊 Data types of each column
# 💾 Memory usage
# ❓ Non-null counts (missing values)

# Example output:
# <class 'pandas.core.frame.DataFrame'>
# RangeIndex: 1000 entries, 0 to 999  ← 1000 rows 📏
# Data columns (total 5 columns):  ← 5 columns 📊
#  #   Column   Non-Null Count  Dtype   
# ---  ------   --------------  -----   
#  0   Name     1000 non-null   object  ← Text column 📝
#  1   Age      995 non-null    float64 ← 5 missing values ❌
#  2   Salary   1000 non-null   int64   ← Numbers 🔢
# dtypes: float64(1), int64(1), object(1)
# memory usage: 39.2+ KB  ← Memory size 💾
📊 Statistical Summary
# 📈 Get statistical summary of numerical columns
print(df.describe())  # 📊 Statistics

# Output shows:
# 🔢 count - Number of non-null values
# 📊 mean - Average value
# 📏 std - Standard deviation (spread)
# 🔽 min - Minimum value
# 📊 25% - First quartile
# 📊 50% - Median (middle value)
# 📊 75% - Third quartile
# 🔼 max - Maximum value

# 📝 Include all columns (including text)
print(df.describe(include='all'))  # 📊 All columns

# Output for text columns:
# 🔢 count - Number of values
# 🏆 unique - Number of unique values
# 🔝 top - Most common value
# 📊 freq - Frequency of top value
🎯 Other Inspection Methods
# 📐 Get DataFrame shape (rows, columns)
print(df.shape)  # 📏 (1000, 5) means 1000 rows, 5 columns

# 🏷️ Get column names
print(df.columns)  # 🏷️ List all column names

# 🔢 Get index (row labels)
print(df.index)  # 🔢 Row index

# 📊 Get data types
print(df.dtypes)  # 📊 Data type of each column

# 🔢 Count non-null values
print(df.count())  # 🔢 Non-null count per column

# ❓ Check for missing values
print(df.isnull().sum())  # ❌ Count nulls per column
print(df.isna().sum())  # ❌ Same as isnull()
🎯 Linear Explanation: Inspection methods 🔍 help you understand your data before analysis 📊. Always start with head(), info(), and describe() to get a quick overview 👀 of structure, types, and statistics.

🎯 Selecting Data – Indexing & Slicing
🔤 Selecting Columns
import pandas as pd  # 📦 Import

# 🎨 Sample DataFrame
data = {
    '🏷️ Name': ['Alice', 'Bob', 'Charlie'],
    '🎂 Age': [25, 30, 35],
    '💰 Salary': [50000, 60000, 70000],
    '🌆 City': ['NY', 'LA', 'Chicago']
}
df = pd.DataFrame(data)

# 1️⃣ Select single column (returns Series 📏)
names = df['🏷️ Name']  # 📝 Get Name column
print(names)

# 2️⃣ Select single column (alternate syntax)
ages = df.Age  # ⚠️ Works only if column name has no spaces
print(ages)

# 3️⃣ Select multiple columns (returns DataFrame 📊)
subset = df[['🏷️ Name', '💰 Salary']]  # 📋 Select 2 columns
print(subset)
📍 Using loc[] - Label-Based Selection
loc[] selects data using labels 🏷️ (row/column names).

# 📐 Syntax: df.loc[row_label, column_label]

# 1️⃣ Select single row by index label
row = df.loc[0]  # 🔢 Get row at index 0
print(row)

# 2️⃣ Select specific cell
cell = df.loc[0, '🏷️ Name']  # 📍 Row 0, Name column
print(cell)  # Output: Alice 👤

# 3️⃣ Select multiple rows
rows = df.loc[0:2]  # 📏 Rows 0, 1, 2 (inclusive!)
print(rows)

# 4️⃣ Select specific rows and columns
subset = df.loc[0:1, ['🏷️ Name', '💰 Salary']]  # 📊 Rows 0-1, 2 columns
print(subset)

# 5️⃣ Select all rows, specific columns
subset = df.loc[:, ['🏷️ Name', '🎂 Age']]  # 📋 All rows, 2 columns
print(subset)

# 6️⃣ Boolean indexing (conditional selection)
high_earners = df.loc[df['💰 Salary'] > 55000]  # 💰 Salary > 55k
print(high_earners)
🎯 Linear Explanation: loc[] uses actual labels 🏷️ for selection. When slicing rows with loc[0:2], it includes the end point (row 2) ✅, unlike Python's normal slicing.

🔢 Using iloc[] - Position-Based Selection
iloc[] selects data using integer positions 🔢 (like Python lists).

# 📐 Syntax: df.iloc[row_position, column_position]

# 1️⃣ Select single row by position
row = df.iloc[0]  # 🔢 First row (position 0)
print(row)

# 2️⃣ Select specific cell
cell = df.iloc[0, 1]  # 📍 Row 0, Column 1 (Age)
print(cell)  # Output: 25 🎂

# 3️⃣ Select multiple rows
rows = df.iloc[0:2]  # 📏 Rows 0, 1 (excludes 2!)
print(rows)

# 4️⃣ Select specific rows and columns by position
subset = df.iloc[0:2, [0, 2]]  # 📊 Rows 0-1, Columns 0 & 2
print(subset)

# 5️⃣ Select all rows, specific columns
subset = df.iloc[:, 0:2]  # 📋 All rows, first 2 columns
print(subset)

# 6️⃣ Select last row
last_row = df.iloc[-1]  # 🔽 Last row
print(last_row)

# 7️⃣ Select with step
every_other = df.iloc[::2]  # 📊 Every 2nd row (0, 2, 4...)
print(every_other)
🎯 Linear Explanation: iloc[] works with positions 🔢 (0, 1, 2...) regardless of actual labels. Slicing with iloc[0:2] excludes the end point (row 2) ❌, just like Python lists.

📋 Comparison: loc[] vs iloc[]
Feature 🎨	loc[] 🏷️	iloc[] 🔢
Selection Method 🔍	Label-based (names)	Position-based (integers)
Row Slicing 📏	loc[0:2] → includes 0,1,2 ✅	iloc[0:2] → includes 0,1 only ❌
Use Case 🎯	Known column/row names	Positional access
Example 💡	df.loc[:, 'Age']	df.iloc[:, 1]
# 🎨 Practical Examples

# ✅ When to use loc[]
# - You know column names: df.loc[:, 'Salary']
# - Conditional selection: df.loc[df['Age'] > 30]
# - Working with named indices

# ✅ When to use iloc[]
# - Positional access: df.iloc[0:5, 0:3]  (first 5 rows, first 3 columns)
# - Don't know/care about labels
# - Numerical slicing operations
🎓 Summary: What We Learned
🐼 Pandas Fundamentals
📚 Pandas is Python's powerhouse library for data manipulation and analysis
🔧 Enables efficient handling of large datasets with intuitive operations
📦 Two core structures: Series (1-D) and DataFrame (2-D tables)
🏗️ Data Structures Mastery
📏 Series: One-dimensional labeled arrays for single-column data
📊 DataFrame: Two-dimensional tables with rows and columns (like Excel spreadsheets)
🎨 Multiple creation methods: lists, dictionaries, NumPy arrays, and files
📂 Data I/O Operations
📥 Read data from multiple formats: CSV, Excel, JSON, SQL databases
📤 Export processed data with to_csv(), to_excel(), to_json()
🔄 Seamless conversion between different file formats
🔍 Data Inspection Techniques
👀 Quick previews with head() and tail() methods
ℹ️ Detailed insights using info() (structure, types, memory)
📊 Statistical summaries via describe() (mean, median, min, max)
❓ Missing value detection with isnull() and isna()
🎯 Data Selection & Slicing
🏷️ loc[]: Label-based indexing (uses column/row names, inclusive slicing)
🔢 iloc[]: Position-based indexing (uses integer positions, exclusive slicing)
📋 Column selection: single columns (Series) or multiple columns (DataFrame)
🔍 Boolean indexing for conditional filtering of data
🎉 Congratulations! You've mastered Pandas Basics! 🐼✨