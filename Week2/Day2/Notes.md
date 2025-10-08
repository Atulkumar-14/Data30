📊 Day 2: Pandas – Data Cleaning 🧹 & Transformation 🔄
🔍 Topic 1: Handling Missing Data 🕳️ (NA Values)
🎯 Core Concept
Missing data 📉 (NaN, None, null) appears when information is incomplete 🧩. Pandas provides powerful tools 🛠️ to detect ✅, remove ❌, and fill 📝 these gaps.

🔧 Key Functions
1️⃣ isnull() 🔎 - Detect Missing Values
Returns True ✅ where data is missing, False ❌ where present.

import pandas as pd
import numpy as np

# 📦 Create sample data with missing values
data = {'Name': ['Alice', 'Bob', None, 'David'],
        'Age': [25, np.nan, 30, 28],
        'Salary': [50000, 60000, np.nan, 55000]}
df = pd.DataFrame(data)

# 🔍 Check for missing values (returns boolean DataFrame)
print(df.isnull())
#     Name    Age  Salary
# 0  False  False   False
# 1  False   True   False  ⚠️ Age is missing
# 2   True  False    True  ⚠️ Name & Salary missing
# 3  False  False   False

# 📊 Count missing values per column
print(df.isnull().sum())
# Name      1  🕳️
# Age       1  🕳️
# Salary    1  🕳️
2️⃣ dropna() 🗑️ - Remove Missing Data
Eliminates rows ↔️ or columns ↕️ containing missing values.

# ❌ Drop rows with ANY missing value
df_clean = df.dropna()
print(df_clean)
#     Name  Age   Salary
# 0  Alice   25  50000.0  ✅ Only complete row remains

# ❌ Drop rows where ALL values are missing
df_partial = df.dropna(how='all')

# ❌ Drop rows with missing values in specific columns 🎯
df_age_clean = df.dropna(subset=['Age'])

# ⚠️ Drop columns (axis=1) with missing data
df_col_clean = df.dropna(axis=1)
3️⃣ fillna() 📝 - Fill Missing Values
Replaces missing data 🕳️ with specified values or strategies 🎲.

# 📌 Fill with a specific value
df_filled = df.fillna(0)  # Replace NaN with 0️⃣

# 📊 Fill with column mean (for numerical data)
df['Age'] = df['Age'].fillna(df['Age'].mean())

# 🔄 Forward fill - use previous valid value
df_ffill = df.fillna(method='ffill')

# 🔙 Backward fill - use next valid value
df_bfill = df.fillna(method='bfill')

# 📖 Fill different columns with different values
df_custom = df.fillna({'Name': 'Unknown', 'Age': 0, 'Salary': df['Salary'].median()})
🎯 Topic 2: Data Filtering 🔎 (Boolean Indexing)
🎯 Core Concept
Filtering 🔍 means selecting specific rows 📋 based on conditions ⚖️. Boolean indexing uses True/False ✅❌ masks to extract data.

# 📦 Sample data
data = {'Product': ['Laptop', 'Phone', 'Tablet', 'Monitor', 'Keyboard'],
        'Price': [1000, 800, 400, 300, 50],
        'Stock': [15, 30, 0, 10, 100],
        'Rating': [4.5, 4.8, 4.2, 4.0, 3.8]}
df = pd.DataFrame(data)

# 🔍 Single condition - Products over $500 💰
expensive = df[df['Price'] > 500]
print(expensive)
#   Product  Price  Stock  Rating
# 0  Laptop   1000     15     4.5  💻
# 1   Phone    800     30     4.8  📱

# 🔗 Multiple conditions with AND (&) operator
# Products > $300 AND Stock > 0 📦✅
available_expensive = df[(df['Price'] > 300) & (df['Stock'] > 0)]

# 🔗 Multiple conditions with OR (|) operator  
# Price < $100 OR Rating > 4.5 ⭐
cheap_or_rated = df[(df['Price'] < 100) | (df['Rating'] > 4.5)]

# 🚫 NOT condition with ~ operator
# Products NOT out of stock ❌📦
in_stock = df[~(df['Stock'] == 0)]

# 📋 Using isin() for multiple value matching 🎯
selected = df[df['Product'].isin(['Laptop', 'Phone', 'Monitor'])]

# 🔤 String filtering with str methods
phones = df[df['Product'].str.contains('Phone')]  # Contains "Phone" 📱
📊 Topic 3: Sorting 🔢 & Ranking 🏆
🎯 Core Concept
Sorting 📈📉 arranges data in ascending ⬆️ or descending ⬇️ order. Ranking 🥇🥈🥉 assigns positions based on values.

1️⃣ sort_values() 🔄 - Sort DataFrame
# 📦 Sample data
data = {'Student': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
        'Math': [85, 92, 78, 92, 88],
        'Science': [90, 85, 95, 80, 92]}
df = pd.DataFrame(data)

# ⬆️ Sort by single column (ascending by default)
df_sorted = df.sort_values('Math')
print(df_sorted)
#    Student  Math  Science
# 2  Charlie    78       95  📊 Lowest
# 0    Alice    85       90
# 4      Eve    88       92
# 1      Bob    92       85  📈 Tied highest
# 3    David    92       80  📈 Tied highest

# ⬇️ Sort in descending order
df_desc = df.sort_values('Math', ascending=False)

# 🔗 Sort by multiple columns 📋
# First by Math ⬇️, then by Science ⬇️ for ties
df_multi = df.sort_values(['Math', 'Science'], ascending=[False, False])

# 🔄 Sort index instead of values
df_index_sorted = df.sort_index()
2️⃣ rank() 🏆 - Assign Ranks
# 🥇 Assign ranks (1 = highest by default for ascending)
df['Math_Rank'] = df['Math'].rank(ascending=False)
print(df)
#    Student  Math  Science  Math_Rank
# 0    Alice    85       90        4.0  🥉
# 1      Bob    92       85        1.5  🥇 (tied)
# 2  Charlie    78       95        5.0  📊
# 3    David    92       80        1.5  🥇 (tied)
# 4      Eve    88       92        3.0  🥈

# 🎯 Handle ties differently
df['Rank_Min'] = df['Math'].rank(method='min', ascending=False)      # Both get 1 🥇🥇
df['Rank_Dense'] = df['Math'].rank(method='dense', ascending=False)  # 1, 2, 3 (no gaps) 📊
df['Rank_First'] = df['Math'].rank(method='first', ascending=False)  # Order by appearance 🔢
🔤 Topic 4: String Functions 📝 (Text Manipulation)
🎯 Core Concept
The .str accessor provides methods 🛠️ to manipulate text 📄 in DataFrame columns, similar to Python 🐍 string methods.

# 📦 Sample data with text
data = {'Email': ['alice@GMAIL.com', 'bob@yahoo.com', 'charlie@OUTLOOK.com'],
        'Name': ['  Alice  ', 'Bob', 'Charlie  '],
        'Code': ['US-001', 'UK-002', 'IN-003']}
df = pd.DataFrame(data)

# 🔡 Convert to lowercase ⬇️
df['Email_Lower'] = df['Email'].str.lower()
# Result: 'alice@gmail.com' ✅

# 🔠 Convert to uppercase ⬆️
df['Email_Upper'] = df['Email'].str.upper()

# ✂️ Remove whitespace (leading/trailing spaces)
df['Name_Clean'] = df['Name'].str.strip()
# '  Alice  ' ➡️ 'Alice' ✨

# 🔍 Check if contains substring 🔎
df['Is_Gmail'] = df['Email'].str.contains('gmail', case=False)
# True ✅ if email contains 'gmail'

# 📍 Check if starts/ends with substring
df['Starts_US'] = df['Code'].str.startswith('US')  # True/False ✅❌
df['Ends_003'] = df['Code'].str.endswith('003')

# ✂️ Split strings and extract parts 🧩
df['Country'] = df['Code'].str.split('-').str[0]  # Extract 'US', 'UK', 'IN' 🌍
df['Number'] = df['Code'].str.split('-').str[1]   # Extract '001', '002', '003' 🔢

# 🔄 Replace text 🔁
df['Email_Fixed'] = df['Email'].str.replace('GMAIL', 'gmail')

# 📏 Get string length 📐
df['Email_Length'] = df['Email'].str.len()

# 🔤 Extract with regex (regular expressions) 🎯
df['Domain'] = df['Email'].str.extract(r'@(.+)\.com')  # Extract domain name 🌐
🔄 Topic 5: Data Transformation 🎭 (apply, map, lambda)
🎯 Core Concept
Transformation 🔄 means applying functions 🧮 to modify data. Three main approaches: apply() 🎯, map() 🗺️, and lambda ⚡ functions.

1️⃣ lambda ⚡ - Anonymous Functions
# ⚡ Lambda syntax: lambda parameters: expression
# Create quick one-line functions without 'def' 📝

# Example: Square a number 🔢²
square = lambda x: x ** 2
print(square(5))  # Output: 25 ✅

# Example: Add two numbers ➕
add = lambda x, y: x + y
print(add(3, 4))  # Output: 7 ✅
2️⃣ apply() 🎯 - Apply Functions to Rows/Columns
# 📦 Sample data
data = {'Price': [100, 200, 150, 300],
        'Quantity': [2, 1, 3, 2]}
df = pd.DataFrame(data)

# 🎯 Apply to single column (Series) 📊
# Add 10% tax 💰
df['Price_With_Tax'] = df['Price'].apply(lambda x: x * 1.10)

# 🎯 Apply to multiple columns (axis=1 means row-wise ↔️)
# Calculate total cost 🧮
df['Total'] = df.apply(lambda row: row['Price'] * row['Quantity'], axis=1)

# 🔧 Using custom function instead of lambda
def categorize_price(price):
    """📊 Categorize price into budget ranges 💵"""
    if price < 150:
        return 'Cheap 💰'  
    elif price < 250:
        return 'Medium 💵'
    else:
        return 'Expensive 💎'

df['Category'] = df['Price'].apply(categorize_price)

# 🎯 Apply with multiple return values (returns Series)
def price_analysis(price):
    """🔍 Analyze price and return multiple metrics 📈"""
    return pd.Series({
        'Discounted': price * 0.9,      # 10% off 🏷️
        'Premium': price * 1.2          # 20% markup 💎
    })

df[['Discounted', 'Premium']] = df['Price'].apply(price_analysis)
3️⃣ map() 🗺️ - Map Values Using Dictionary or Function
# 📦 Sample data
data = {'Grade': ['A', 'B', 'C', 'A', 'B'],
        'Score': [85, 70, 60, 90, 75]}
df = pd.DataFrame(data)

# 🗺️ Map using dictionary 📖
grade_mapping = {'A': 'Excellent 🌟', 'B': 'Good 👍', 'C': 'Average 📊'}
df['Performance'] = df['Grade'].map(grade_mapping)

# 🗺️ Map using function ⚙️
df['Score_Category'] = df['Score'].map(lambda x: 'Pass ✅' if x >= 60 else 'Fail ❌')

# ⚠️ Note: map() only works on Series (single column)
# For DataFrame operations, use apply() or applymap() 🎯
📊 Topic 6: Aggregation 🧮 & Grouping 👥 (groupby)
🎯 Core Concept
Grouping 👥 splits data into categories 🏷️, then aggregation 🧮 calculates statistics 📈 (sum ➕, mean 📊, count 🔢) for each group.

groupby() 👥 - Split-Apply-Combine
# 📦 Sample sales data
data = {'Region': ['North', 'South', 'North', 'East', 'South', 'East', 'North'],
        'Product': ['Laptop', 'Phone', 'Tablet', 'Laptop', 'Phone', 'Tablet', 'Phone'],
        'Sales': [1000, 1500, 800, 1200, 1600, 900, 1100],
        'Quantity': [2, 3, 1, 2, 4, 2, 2]}
df = pd.DataFrame(data)

# 👥 Group by single column and aggregate 🧮
region_sales = df.groupby('Region')['Sales'].sum()
print(region_sales)
# Region
# East     2100 💰
# North    2900 💰
# South    3100 💰 (highest sales) 🏆

# 📊 Multiple aggregations on grouped data
region_stats = df.groupby('Region').agg({
    'Sales': ['sum', 'mean', 'count'],     # Total ➕, Average 📊, Count 🔢
    'Quantity': ['sum', 'max']              # Total 📦, Maximum 🔝
})

# 👥👥 Group by multiple columns 🔗
region_product = df.groupby(['Region', 'Product'])['Sales'].sum()
print(region_product)
# Region  Product
# East    Laptop     1200 💻
#         Tablet      900 📱
# North   Laptop     1000 💻
#         Phone      1100 📱
#         Tablet      800 📱
# South   Phone      3100 📱 (highest) 🏆

# 🧮 Common aggregation methods 📈
grouped = df.groupby('Region')
print(grouped['Sales'].mean())    # Average 📊
print(grouped['Sales'].min())     # Minimum 📉
print(grouped['Sales'].max())     # Maximum 📈
print(grouped['Sales'].count())   # Count 🔢
print(grouped['Sales'].std())     # Standard deviation 📏

# 🎯 Apply custom aggregation function ⚙️
def sales_range(x):
    """📊 Calculate range (max - min) 📏"""
    return x.max() - x.min()

print(df.groupby('Region')['Sales'].agg(sales_range))

# 🔄 Reset index after grouping to get DataFrame 📋
result = df.groupby('Region')['Sales'].sum().reset_index()
#   Region  Sales
# 0   East   2100
# 1  North   2900
# 2  South   3100

# 🎭 Transform: Keep original DataFrame size 📐
# Add column showing group mean 📊 for each row
df['Region_Avg'] = df.groupby('Region')['Sales'].transform('mean')
🎓 Topics Learned from Day 9 📚
• Missing Data Management 🕳️🔧 – Detecting gaps with isnull() 🔍, removing with dropna() 🗑️, and filling with fillna() 📝 using various strategies (mean 📊, forward-fill ➡️, custom values 🎯)

• Boolean Indexing & Filtering 🔎⚖️ – Selecting specific rows using conditions with & (AND), | (OR), ~ (NOT) operators, plus isin() 🎯 and string matching 🔤 for precise data extraction

• Sorting & Ranking Operations 📊🏆 – Organizing data with sort_values() 🔢 (single/multiple columns ⬆️⬇️) and assigning competitive positions with rank() 🥇🥈🥉 (handling ties with various methods)

• String Manipulation Tools 🔤✂️ – Using .str accessor methods for text processing 📝: case conversion 🔠🔡, stripping whitespace ✨, splitting 🧩, pattern matching 🔍, and regex extraction 🎯

• Function Application Techniques 🔄⚡ – Transforming data with apply() 🎯 (row/column-wise operations ↔️↕️), map() 🗺️ (dictionary/function mapping 📖), and lambda ⚡ (anonymous inline functions)

• Grouping & Aggregation 👥🧮 – Splitting data by categories with groupby() 🏷️, calculating statistics 📈 (sum ➕, mean 📊, count 🔢, max 🔝, min 📉), and using custom aggregation functions for complex analysis 📊