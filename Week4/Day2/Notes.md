# 📊 Day 2: Data Cleaning & Preprocessing 🧹✨

---

## 🎯 Introduction: Why Clean Data? 💭

Imagine you're a chef 👨‍🍳 preparing a meal 🍽️. You wouldn't use rotten vegetables 🥬❌ or unwashed ingredients 🧼❓, right? Similarly, **raw data** 📊 is messy 🌪️, incomplete 🕳️, and inconsistent ⚠️. **Data cleaning** 🧹 is the process of preparing your data "ingredients" 🥘 before cooking up insights 💡✨.

> **Real-life analogy** 🌍: Your contact list 📱 might have duplicate entries 👥👥, missing phone numbers ☎️❓, or names in different formats (John vs. JOHN 🔤). Cleaning ensures consistency ✅!

---

## 🔍 1. Identifying & Handling Missing Data 🕳️❌

### 🧐 What is Missing Data?

**Missing data** = **empty cells** 📭 in your dataset 📊 where values should exist ✅.

**Types of Missing Data:** 🗂️

- ❌ **Completely Missing** → No value at all (`NaN`, `None`, `NULL`)
- ⚠️ **Placeholder Values** → `-999`, `0`, `"Unknown"` used as fillers 🔢
- 🎭 **Hidden Missing** → Spaces `" "`, empty strings `""`

---

### 🛠️ Detection Methods 🔎🔬

```python
import pandas as pd  # 📚 Pandas library
import numpy as np   # 🔢 NumPy for numerical operations

# 📂 Sample dataset with missing values 🕳️
data = {
    'Name': ['Alice', 'Bob', None, 'David', 'Eve'],          # ❓ Missing name
    'Age': [25, np.nan, 35, 40, 28],                         # ❓ Missing age  
    'Salary': [50000, 60000, 75000, np.nan, 52000],         # 💰❓ Missing salary
    'Department': ['HR', 'IT', 'Finance', 'IT', None]        # 🏢❓ Missing dept
}

df = pd.DataFrame(data)  # 📊 Create DataFrame

# 🔍 Method 1: Check for missing values (returns True/False) ✅❌
print(df.isnull())  

# 🔍 Method 2: Count missing values per column 🔢
print(df.isnull().sum())  # 📊 Shows: Name(1), Age(1), Salary(1), Department(1)

# 🔍 Method 3: Percentage of missing data 📊📈
print((df.isnull().sum() / len(df)) * 100)  # 🎯 Each column has 20% missing

# 🔍 Method 4: Visual representation 🖼️
import missingno as msno  # 📊 Visualization library
msno.matrix(df)  # 🎨 Shows missing data pattern
```

**Linear Explanation** 📝: We use `.isnull()` to detect missing values ❓. It returns `True` ✅ for missing cells and `False` ❌ for filled ones. Summing gives us the count 🔢 of missing values per column 📊.

---

### 🎯 Handling Strategies 🛠️

#### **Strategy 1️⃣: Deletion** 🗑️❌
 
**When to use** ⏰: When missing data is < 5% 📉 of total data.

```python
# 🗑️ Remove rows with ANY missing value
df_cleaned = df.dropna()  # ❌ Removes all incomplete rows

# 🗑️ Remove rows where SPECIFIC column is missing
df_cleaned = df.dropna(subset=['Age'])  # ❌ Only removes rows with missing Age

# 🗑️ Remove columns with missing values 📊❌
df_cleaned = df.dropna(axis=1)  # ⚠️ Removes entire columns (be careful!)

# ⚠️ Remove rows with more than 50% missing data
threshold = len(df.columns) * 0.5  # 🎯 Calculate threshold
df_cleaned = df.dropna(thresh=threshold)  
```

**⚠️ Warning**: Deletion can lose valuable information 📉💔!

---

#### **Strategy 2️⃣: Imputation (Filling)** 🔧✨

**When to use** ⏰: When missing data is 5-40% 📊 and you want to preserve data 💾.

```python
# 📝 Method 1: Fill with a constant value 🔢
df['Department'].fillna('Unknown', inplace=True)  # 🏢❓ → 🏢"Unknown"

# 📊 Method 2: Fill with mean (for numerical data) 📈
mean_age = df['Age'].mean()  # 🧮 Calculate average age
df['Age'].fillna(mean_age, inplace=True)  # 📊 Replace missing with average

# 📊 Method 3: Fill with median (better for outliers) 📉
median_salary = df['Salary'].median()  # 🎯 Middle value
df['Salary'].fillna(median_salary, inplace=True)  # 💰 Robust to outliers

# 📊 Method 4: Fill with mode (most frequent value) 🔝
mode_dept = df['Department'].mode()[0]  # 🏆 Most common department
df['Department'].fillna(mode_dept, inplace=True)  

# 🔄 Method 5: Forward Fill (use previous value) ⬇️
df.fillna(method='ffill', inplace=True)  # 📋 Copies value from above

# 🔄 Method 6: Backward Fill (use next value) ⬆️
df.fillna(method='bfill', inplace=True)  # 📋 Copies value from below

# 🤖 Method 7: Advanced - Use machine learning prediction 🧠
from sklearn.impute import KNNImputer  # 🎯 K-Nearest Neighbors

imputer = KNNImputer(n_neighbors=3)  # 👥 Use 3 nearest neighbors
df_imputed = pd.DataFrame(imputer.fit_transform(df.select_dtypes(include=[np.number])))
# 🔬 Predicts missing values based on similar rows
```

**Real-life example** 🌍: If a student 👨‍🎓 misses one exam 📝❓, you might fill it with their average score 📊 (mean imputation) rather than failing them ❌.

---

## 🔄 2. Handling Duplicate Data 👥👥

### 🧐 What are Duplicates?

**Duplicate rows** = identical entries 📋📋 that appear multiple times ×2, ×3, ×4...

```python
# 📊 Sample data with duplicates 👥
data = {
    'ID': [1, 2, 3, 2, 4, 3],              # 🆔 IDs (2 and 3 repeated!)
    'Name': ['Alice', 'Bob', 'Charlie', 'Bob', 'David', 'Charlie'],
    'Score': [85, 90, 78, 90, 92, 78]     # 📈 Scores
}

df = pd.DataFrame(data)

# 🔍 Check for duplicates (returns True/False) ✅❌
print(df.duplicated())  # 🎯 Shows which rows are duplicates

# 🔢 Count total duplicates
print(df.duplicated().sum())  # 📊 Result: 2 duplicates found

# 🔍 Find duplicate rows (show actual data) 👀
print(df[df.duplicated()])  # 📋 Displays: Bob's and Charlie's duplicate entries

# 🗑️ Remove duplicates (keep first occurrence) ✂️
df_unique = df.drop_duplicates()  # ✅ Keeps first, removes rest

# 🗑️ Remove duplicates (keep last occurrence) 🔄
df_unique = df.drop_duplicates(keep='last')  # ✅ Keeps last, removes earlier

# 🎯 Remove duplicates based on specific columns only 📊
df_unique = df.drop_duplicates(subset=['Name'])  # 🔍 Only checks Name column

# ⚠️ Remove ALL occurrences of duplicates (keep none!) ❌
df_unique = df.drop_duplicates(keep=False)  
```

**Real-life example** 🌍: Your email inbox 📧 might receive the same message twice ×2. You'd delete one copy 🗑️ to avoid confusion!

---

## ⚖️ 3. Handling Inconsistent Data 🔀⚠️

### 🧐 What is Inconsistent Data?

**Inconsistent data** = same information 📊 represented differently 🔄.

**Examples** 📝:

- 🇺🇸 "USA" vs "United States" vs "US" vs "U.S.A"
- 📅 "01/12/2023" vs "2023-12-01" vs "Dec 1, 2023"
- 🔤 "john" vs "John" vs "JOHN" vs " John "

```python
# 📊 Sample inconsistent data ⚠️
data = {
    'Country': ['USA', 'usa', 'U.S.A', 'United States', 'US'],  # 🇺🇸 Different formats
    'Date': ['01-12-2023', '2023/12/01', 'Dec 1 2023', '1/12/23', '2023-12-01'],  # 📅
    'Price': ['$100', '100 USD', '100', '$100.00', '100.0']     # 💰 Different formats
}

df = pd.DataFrame(data)

# 🔧 Solution 1: Standardize text (lowercase) 🔤⬇️
df['Country'] = df['Country'].str.lower()  # 🇺🇸 All become "usa"

# 🔧 Solution 2: Replace variations with standard value 🔄
country_mapping = {
    'usa': 'United States',
    'u.s.a': 'United States',
    'us': 'United States',
    'united states': 'United States'
}
df['Country'] = df['Country'].str.lower().replace(country_mapping)  # ✅ All → United States

# 🔧 Solution 3: Remove whitespace ✂️
df['Country'] = df['Country'].str.strip()  # 🧹 "  USA  " → "USA"

# 📅 Solution 4: Standardize dates ⏰
df['Date'] = pd.to_datetime(df['Date'])  # 🔄 Converts all to datetime format

# 💰 Solution 5: Clean currency (remove symbols $) 💵
df['Price'] = df['Price'].str.replace('$', '').str.replace('USD', '').str.strip()
df['Price'] = pd.to_numeric(df['Price'])  # 🔢 Convert to numbers

# 🔤 Solution 6: Capitalize consistently (Title Case) ✨
df['Name'] = df['Name'].str.title()  # "john" → "John", "JOHN" → "John"
```

**Linear Explanation** 📝: We use string methods 🔤 (`.str.lower()`, `.str.replace()`) to standardize text ✅. This ensures "USA" 🇺🇸, "usa", and "U.S.A" all become one consistent value 🎯.

---

## 📏 4. Data Transformation: Scaling 📊⚖️

### 🧐 Why Scale Data?

**Scaling** 📏 brings different features 📊 to the same range 🎯, preventing large values 📈 from dominating small ones 📉.

**Real-life example** 🌍: Comparing salaries 💰 ($50,000-$200,000) with ages 👶👴 (20-65). Without scaling, salary dominates! ⚖️❌

---

### 🛠️ Scaling Techniques 🔧

#### **Technique 1️⃣: Normalization (Min-Max Scaling)** 📊

**Formula** 📐: `(X - X_min) / (X_max - X_min)` → Scales to [0, 1] 🎯

```python
from sklearn.preprocessing import MinMaxScaler  # 📦 Import scaler

# 📊 Sample data
data = {
    'Age': [25, 35, 45, 55, 65],           # 👶👴 Range: 25-65
    'Salary': [50000, 75000, 100000, 150000, 200000]  # 💰 Range: 50k-200k
}

df = pd.DataFrame(data)

# 🔧 Apply Min-Max Scaling ⚖️
scaler = MinMaxScaler()  # 🛠️ Create scaler object
df_scaled = pd.DataFrame(
    scaler.fit_transform(df),  # 🔄 Transform data to [0,1]
    columns=df.columns
)

print(df_scaled)  # ✅ All values now between 0 and 1
# Age: 25→0.0, 65→1.0 | Salary: 50k→0.0, 200k→1.0
```

**When to use** ⏰: Neural networks 🧠, image processing 🖼️, when you need [0,1] range 📊.

---

#### **Technique 2️⃣: Standardization (Z-Score Scaling)** 📈

**Formula** 📐: `(X - mean) / std_dev` → Mean=0 🎯, Std=1 📊

```python
from sklearn.preprocessing import StandardScaler  # 📦 Import scaler

# 🔧 Apply Standardization 📊
scaler = StandardScaler()  # 🛠️ Create scaler object
df_standardized = pd.DataFrame(
    scaler.fit_transform(df),  # 🔄 Transform: mean=0, std=1
    columns=df.columns
)

print(df_standardized)  # ✅ Mean ≈ 0, Std ≈ 1
# Values can be negative ➖ or positive ➕
```

**When to use** ⏰: Machine learning algorithms 🤖 (SVM, KNN, Linear Regression), when features have different units 📏.

---

#### **Technique 3️⃣: Robust Scaling** 💪

Uses **median** 📊 and **IQR** 📉 (Interquartile Range) → Robust to outliers 🎯!

```python
from sklearn.preprocessing import RobustScaler  # 📦 Import robust scaler

# 🔧 Apply Robust Scaling (handles outliers better) 💪
scaler = RobustScaler()  # 🛠️ Create scaler
df_robust = pd.DataFrame(
    scaler.fit_transform(df),  # 🔄 Uses median & IQR
    columns=df.columns
)

# ✅ Works well even with extreme values 📈📉!
```

**When to use** ⏰: When data has **outliers** ⚡ (extreme values that would distort mean/std).

---

## 🏷️ 5. Encoding Categorical Variables 🔤➡️🔢

### 🧐 What is Encoding?

**Encoding** 🔄 converts **text categories** 🔤 (like "Red" 🔴, "Blue" 🔵) into **numbers** 🔢 that machines 🤖 can understand.

**Why needed?** 🤔: Machine learning algorithms 🧠 only understand numbers 🔢, not text 🔤!

---

### 🛠️ Encoding Techniques 🏷️

#### **Technique 1️⃣: Label Encoding** 🏷️🔢

Assigns each category a **unique number** 🔢 (0, 1, 2, 3...).

```python
from sklearn.preprocessing import LabelEncoder  # 📦 Import encoder

# 📊 Sample data with categories 🏷️
data = {
    'Color': ['Red', 'Blue', 'Green', 'Blue', 'Red', 'Green'],  # 🎨 Colors
    'Size': ['S', 'M', 'L', 'M', 'S', 'L']                      # 📏 Sizes
}

df = pd.DataFrame(data)

# 🔧 Apply Label Encoding 🔢
encoder = LabelEncoder()  # 🛠️ Create encoder
df['Color_Encoded'] = encoder.fit_transform(df['Color'])
# 🔴Red→0, 🔵Blue→1, 🟢Green→2

df['Size_Encoded'] = encoder.fit_transform(df['Size'])
# S→0, M→1, L→2

print(df)  # ✅ New columns with numeric codes
```

**⚠️ Warning**: Creates **ordinal relationship** 📊 (0 < 1 < 2). Use only when order matters 📈!

**When to use** ⏰: Tree-based models 🌲 (Decision Trees, Random Forest), ordinal categories 📊 (Low < Medium < High).

---

#### **Technique 2️⃣: One-Hot Encoding** 🔥1️⃣0️⃣

Creates **binary columns** 1️⃣0️⃣ for each category (1=Yes ✅, 0=No ❌).

```python
# 🔧 Apply One-Hot Encoding 🔥
df_encoded = pd.get_dummies(df, columns=['Color', 'Size'])
# 🎨 Creates: Color_Red, Color_Blue, Color_Green
# 📏 Creates: Size_S, Size_M, Size_L

print(df_encoded)  
# ✅ Each category becomes a separate column (0 or 1)
# Example: Red → Color_Red=1, Color_Blue=0, Color_Green=0

# 🔧 Alternative: Using sklearn 📦
from sklearn.preprocessing import OneHotEncoder

encoder = OneHotEncoder(sparse=False)  # 🛠️ sparse=False gives array
encoded_array = encoder.fit_transform(df[['Color', 'Size']])
# 🔄 Returns numpy array with binary columns
```

**When to use** ⏰: **Nominal categories** 🏷️ (no order: Red, Blue, Green), linear models 📈 (Logistic Regression), neural networks 🧠.

---

#### **Technique 3️⃣: Binary Encoding** 0️⃣1️⃣

Converts categories to **binary numbers** 💻 (0s and 1s) → Saves space 💾!

```python
import category_encoders as ce  # 📦 Import category encoders library

# 🔧 Apply Binary Encoding 0️⃣1️⃣
encoder = ce.BinaryEncoder(cols=['Color'])  # 🛠️ Specify columns
df_binary = encoder.fit_transform(df)

# 🎨 Red→001, Blue→010, Green→011 (in binary columns)
# ✅ Uses fewer columns than One-Hot! 📊💾
```

**When to use** ⏰: Many categories 📚 (100+ levels), memory constraints 💾.

---

#### **Technique 4️⃣: Target/Mean Encoding** 🎯📊

Replaces category with **average target value** 📈 for that category.

```python
# 📊 Example: Customer satisfaction by product 🛍️
data = {
    'Product': ['Phone', 'Laptop', 'Tablet', 'Phone', 'Laptop', 'Tablet'],  # 📱💻
    'Satisfaction': [4.5, 4.8, 3.9, 4.3, 4.9, 4.0]  # ⭐ Rating
}

df = pd.DataFrame(data)

# 🔧 Calculate mean satisfaction per product 📊
target_encoding = df.groupby('Product')['Satisfaction'].mean()
# 📱Phone → 4.4, 💻Laptop → 4.85, Tablet → 3.95

# 🔄 Replace categories with their mean values 🎯
df['Product_Encoded'] = df['Product'].map(target_encoding)

print(df)  # ✅ Products replaced with average satisfaction
```

**⚠️ Warning**: Risk of **data leakage** 💧! Use carefully with cross-validation 🔄.

**When to use** ⏰: High-cardinality categories 📚 (many unique values), tree-based models 🌲.

---

## 🎯 6. Outlier Detection 📊⚡

### 🧐 What are Outliers?

**Outliers** ⚡ = extreme values 📈📉 that are **far away** 🚀 from other data points 📊.

**Real-life example** 🌍: In a class of students 👨‍🎓 earning $30k-$60k internships 💰, one gets $500k 💸! That's an outlier ⚡!

---

### 🛠️ Detection Methods 🔍

#### **Method 1️⃣: IQR (Interquartile Range)** 📊📦

**IQR** = Q3 - Q1 (difference between 75th and 25th percentiles 📊)

**Outliers** ⚡ = Values **below Q1 - 1.5×IQR** ⬇️ or **above Q3 + 1.5×IQR** ⬆️

```python
import numpy as np
import pandas as pd

# 📊 Sample data with outliers ⚡
data = {
    'Salary': [50000, 55000, 52000, 60000, 58000, 300000, 54000, 57000]
    # 💰 Notice: 300000 is way higher! ⚡
}

df = pd.DataFrame(data)

# 🔢 Calculate Q1, Q3, and IQR 📊
Q1 = df['Salary'].quantile(0.25)  # 📉 25th percentile
Q3 = df['Salary'].quantile(0.75)  # 📈 75th percentile
IQR = Q3 - Q1  # 📦 Interquartile Range

# 🎯 Define outlier boundaries 🚧
lower_bound = Q1 - 1.5 * IQR  # ⬇️ Lower fence
upper_bound = Q3 + 1.5 * IQR  # ⬆️ Upper fence

# 🔍 Identify outliers ⚡
outliers = df[(df['Salary'] < lower_bound) | (df['Salary'] > upper_bound)]
print(f"Outliers found ⚡: \n{outliers}")  # 💰 300000 detected!

# 🗑️ Remove outliers ✂️
df_clean = df[(df['Salary'] >= lower_bound) & (df['Salary'] <= upper_bound)]
print(f"Clean data ✅: \n{df_clean}")

# 📊 Visual check: Boxplot 📦
import matplotlib.pyplot as plt
df.boxplot(column='Salary')  # 📈 Shows outliers as dots 🔴
plt.show()
```

**Linear Explanation** 📝: IQR method looks at the "middle 50%" 📦 of data. Anything **1.5× this range** away from the box edges 📊 is considered unusual ⚡.

---

#### **Method 2️⃣: Z-Score** 📊📈

**Z-Score** = How many **standard deviations** 📏 away from the mean 📊?

**Formula** 📐: `Z = (X - mean) / std_dev`

**Outliers** ⚡ = |Z-score| > 3 (more than 3 standard deviations away 🚀)

```python
from scipy import stats  # 📦 Statistical functions

# 📊 Calculate Z-scores 🔢
df['Z_Score'] = stats.zscore(df['Salary'])  # 🧮 Compute Z-score

# 🔍 Identify outliers (|Z| > 3) ⚡
outliers = df[np.abs(df['Z_Score']) > 3]
print(f"Outliers (Z-score) ⚡: \n{outliers}")  # 💰 300000 detected!

# 🗑️ Remove outliers ✂️
df_clean = df[np.abs(df['Z_Score']) <= 3]
print(f"Clean data ✅: \n{df_clean}")

# 📊 Interpretation:
# Z = 0 → At mean 🎯
# Z = 1 → 1 std dev above mean ⬆️
# Z = -1 → 1 std dev below mean ⬇️
# Z > 3 → Extremely high ⚡📈
# Z < -3 → Extremely low ⚡📉
```

**When to use** ⏰: **Normally distributed** 🔔 data (bell curve 📊), when you want strict thresholds 🎯.

**⚠️ Limitation**: Doesn't work well with **skewed data** ↗️ (e.g., income 💰).

---

#### **Method 3️⃣: Isolation Forest** 🌲🤖

**Machine learning approach** 🧠 that isolates anomalies ⚡ by building random trees 🌲.

```python
from sklearn.ensemble import IsolationForest  # 📦 ML-based outlier detection

# 🔧 Apply Isolation Forest 🌲
model = IsolationForest(contamination=0.1)  # 🎯 Expect 10% outliers
# contamination = expected proportion of outliers 📊

df['Outlier'] = model.fit_predict(df[['Salary']])
# 🔍 Returns: -1 (outlier ⚡), 1 (normal ✅)

# 🗑️ Filter outliers ✂️
outliers = df[df['Outlier'] == -1]
df_clean = df[df['Outlier'] == 1]

print(f"Outliers detected ⚡: \n{outliers}")
print(f"Clean data ✅: \n{df_clean}")
```

**When to use** ⏰: **Complex data** 🧩, **multivariate outliers** 📊 (outliers across multiple columns), when IQR/Z-score fail ❌.

---

### 🛠️ Handling Outliers Strategy 🎯

Once detected ⚡, you can:

1. **🗑️ Remove** → Delete outlier rows ✂️ (if they're errors ❌)
2. **🔧 Cap/Floor** → Replace with boundary values 🚧
3. **🔄 Transform** → Log/Square root transformation 📐
4. **🤔 Investigate** → Understand why they exist 🔍

```python
# 🔧 Strategy: Capping (Winsorization) 🚧
# Replace outliers with boundary values (not delete!) 📌

upper_limit = df['Salary'].quantile(0.95)  # 📈 95th percentile
lower_limit = df['Salary'].quantile(0.05)  # 📉 5th percentile

# 🔄 Cap extreme values 🎯
df['Salary_Capped'] = df['Salary'].clip(lower=lower_limit, upper=upper_limit)
# ✅ 300000 → becomes 95th percentile value (e.g., 70000)

# 🔄 Strategy: Log Transformation 📐
df['Salary_Log'] = np.log(df['Salary'])  # 🔢 Reduces impact of outliers
# 📊 Makes skewed data more normal 🔔
```

---

## ⚙️ 7. Feature Engineering: Creating Derived Features 🛠️✨

### 🧐 What is Feature Engineering?

**Feature engineering** ⚙️ = Creating **new features** 🆕 from existing data 📊 to improve model performance 📈🤖.

**Real-life example** 🌍: From "Date of Birth" 📅, create "Age" 👶👴. From "Height" 📏 & "Weight" ⚖️, create "BMI" 💪!

---

### 🛠️ Common Feature Engineering Techniques 🔧

#### **Technique 1️⃣: Mathematical Operations** 🧮➕➖✖️➗

```python
# 📊 Sample data
data = {
    'Length': [10, 15, 20, 25],      # 📏 Length in meters
    'Width': [5, 7, 10, 12],         # 📐 Width in meters
    'Price': [1000, 1500, 2000, 2500],  # 💰 Price
    'Units_Sold': [50, 30, 40, 60]   # 📦 Units
}

df = pd.DataFrame(data)

# ➕ Addition: Total Dimensions 📊
df['Total_Dimension'] = df['Length'] + df['Width']  # 📏+📐

# ✖️ Multiplication: Area 🏠
df['Area'] = df['Length'] * df['Width']  # 📏×📐 = Area

# ➗ Division: Price per Unit 💰
df['Price_Per_Unit'] = df['Price'] / df['Units_Sold']  # 💰÷📦

# 🔢 Power: Volume (if we had height) 📦
# df['Volume'] = df['Length'] * df['Width'] * df['Height']

print(df)  # ✅ New features created!
```

---

