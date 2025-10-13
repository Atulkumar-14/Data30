# 📊 Day 12: Combined Data Analysis Project 🔬

---

## 🎯 Topics to Cover

|📌 Topic|🔍 Description|
|---|---|
|**📂 Reading Real Data**|Import CSV 📄 or Excel 📗 files|
|**🧹 Data Cleaning & Transformation**|Process data using Pandas 🐼|
|**📈 Data Visualization**|Create charts using Matplotlib 📉 & Seaborn 🌊|
|**💡 Analyzing Insights**|Find trends 📊, correlations 🔗, and patterns 🧩|

---

## 📂 1. Reading Real Data (CSV 📄 or Excel 📗)

**Goal:** Load datasets from files into Python for analysis.

### 🐼 Reading CSV Files

```python
import pandas as pd  # 🐼 Import pandas library

# 📥 Load CSV file
data = pd.read_csv('filename.csv')

# 👀 Display first 5 rows
print(data.head())

# 📊 Get dataset information
print(data.info())  # Shows columns, data types, non-null counts

# 📐 Get statistical summary
print(data.describe())  # Mean, std, min, max, etc.
```

### 📗 Reading Excel Files

```python
# 📥 Load Excel file
data = pd.read_excel('filename.xlsx', sheet_name='Sheet1')

# 🔍 Check for multiple sheets
excel_file = pd.ExcelFile('filename.xlsx')
print(excel_file.sheet_names)  # 📋 List all sheets
```

**💡 Linear Explanation:** We use `pd.read_csv()` for CSV files and `pd.read_excel()` for Excel files. These functions convert file data into DataFrame format, which is a table-like structure that's easy to work with in Python.

---

## 🧹 2. Data Cleaning & Transformation using Pandas 🐼

**Goal:** Fix and prepare messy data for analysis.

### 🔍 Checking for Missing Values ❓

```python
# ❓ Check missing values in each column
print(data.isnull().sum())

# 📊 Visualize missing data percentage
missing_percent = (data.isnull().sum() / len(data)) * 100
print(missing_percent)
```

### 🛠️ Handling Missing Values

```python
# ✂️ Remove rows with any missing values
data_clean = data.dropna()

# 🔄 Fill missing values with mean (for numerical columns)
data['column_name'].fillna(data['column_name'].mean(), inplace=True)

# 🔄 Fill missing values with mode (for categorical columns)
data['category'].fillna(data['category'].mode()[0], inplace=True)

# 📝 Fill with a specific value
data.fillna(0, inplace=True)  # Replace missing with 0️⃣
```

### 🗑️ Removing Duplicates

```python
# 🔍 Check for duplicate rows
print(data.duplicated().sum())

# 🗑️ Remove duplicate rows
data = data.drop_duplicates()
```

### 🔄 Data Transformation

```python
# 📅 Convert to datetime format
data['date'] = pd.to_datetime(data['date'])

# 🔤 Convert text to lowercase
data['name'] = data['name'].str.lower()

# ➗ Create new calculated column
data['total'] = data['quantity'] * data['price']  # 💰 Total = Qty × Price

# 🏷️ Rename columns
data.rename(columns={'old_name': 'new_name'}, inplace=True)

# ✂️ Filter rows based on condition
filtered_data = data[data['age'] > 18]  # 🔞 Only adults
```

**💡 Linear Explanation:** Data cleaning removes errors and fills gaps in your dataset. We drop or fill missing values, remove duplicates, and transform data types to make sure everything is consistent and ready for analysis.

---

## 📈 3. Data Visualization using Matplotlib 📉 & Seaborn 🌊

**Goal:** Create visual charts to understand data better.

### 📊 Basic Setup

```python
import matplotlib.pyplot as plt  # 📉 For basic plots
import seaborn as sns  # 🌊 For beautiful statistical plots

# 🎨 Set style for better-looking plots
sns.set_style('whitegrid')
plt.rcParams['figure.figsize'] = (10, 6)  # 📐 Set default size
```

### 📊 Line Plot (Trends over Time ⏰)

```python
# 📈 Line plot for time series data
plt.plot(data['date'], data['sales'], marker='o', color='blue')  # 🔵
plt.xlabel('Date 📅')
plt.ylabel('Sales 💰')
plt.title('Sales Trend Over Time 📈')
plt.xticks(rotation=45)  # 🔄 Rotate x-axis labels
plt.grid(True)  # ⚡ Add grid
plt.tight_layout()  # 📦 Fit everything nicely
plt.show()
```

### 📊 Bar Chart (Comparing Categories 📊)

```python
# 📊 Bar chart for categorical comparison
category_counts = data['category'].value_counts()
plt.bar(category_counts.index, category_counts.values, color='green')  # 🟢
plt.xlabel('Category 🏷️')
plt.ylabel('Count 🔢')
plt.title('Distribution by Category 📊')
plt.show()
```

### 🥧 Pie Chart (Proportions 🍰)

```python
# 🥧 Pie chart for showing proportions
sizes = data['region'].value_counts()
plt.pie(sizes, labels=sizes.index, autopct='%1.1f%%', startangle=90)  # 🔢 Show %
plt.title('Regional Distribution 🌍')
plt.show()
```

### 📊 Histogram (Distribution 📉)

```python
# 📊 Histogram to see data distribution
plt.hist(data['age'], bins=20, color='purple', edgecolor='black')  # 🟣
plt.xlabel('Age 👤')
plt.ylabel('Frequency 🔢')
plt.title('Age Distribution 📊')
plt.show()
```

### 📦 Box Plot (Outliers & Spread 📊)

```python
# 📦 Box plot to detect outliers
sns.boxplot(x='category', y='price', data=data, palette='Set2')  # 🎨
plt.xlabel('Category 🏷️')
plt.ylabel('Price 💵')
plt.title('Price Distribution by Category 📦')
plt.show()
```

### 🔥 Heatmap (Correlation Matrix 🔗)

```python
# 🔥 Heatmap to show correlations between numerical columns
correlation = data.corr()  # 🔗 Calculate correlation
sns.heatmap(correlation, annot=True, cmap='coolwarm', fmt='.2f')  # 🌡️ Color-coded
plt.title('Correlation Heatmap 🔥')
plt.show()
```

### 📊 Scatter Plot (Relationships 🔗)

```python
# 📊 Scatter plot to see relationship between two variables
plt.scatter(data['age'], data['income'], alpha=0.6, color='red')  # 🔴
plt.xlabel('Age 👤')
plt.ylabel('Income 💰')
plt.title('Age vs Income Relationship 🔗')
plt.show()
```

**💡 Linear Explanation:** Visualization turns numbers into pictures. We use line plots for trends over time, bar charts for comparing categories, histograms for distributions, box plots for detecting outliers, and heatmaps for finding correlations between variables.

---

## 💡 4. Analyzing Insights – Trends 📊, Correlations 🔗, and Patterns 🧩

**Goal:** Extract meaningful conclusions from data.

### 📊 Finding Trends

```python
# 📈 Calculate monthly average
data['month'] = data['date'].dt.month  # 📅 Extract month
monthly_avg = data.groupby('month')['sales'].mean()  # 📊 Group by month
print(monthly_avg)

# 🔝 Identify top performers
top_products = data.groupby('product')['revenue'].sum().sort_values(ascending=False).head(5)
print("Top 5 Products 🏆:")
print(top_products)
```

### 🔗 Finding Correlations

```python
# 🔗 Calculate correlation between two columns
correlation_value = data['price'].corr(data['quantity'])
print(f"Correlation between Price & Quantity: {correlation_value:.2f}")

# 📊 If correlation > 0.7 → Strong positive relationship ➕
# 📊 If correlation < -0.7 → Strong negative relationship ➖
# 📊 If correlation ≈ 0 → No relationship ⭕
```

### 🧩 Finding Patterns

```python
# 🔍 Grouping and aggregating data
pattern = data.groupby(['region', 'category']).agg({
    'sales': 'sum',      # 💰 Total sales
    'quantity': 'mean',  # 📊 Average quantity
    'price': 'max'       # 🔝 Highest price
})
print(pattern)

# 📅 Seasonal patterns (if date column exists)
data['quarter'] = data['date'].dt.quarter  # 📅 Q1, Q2, Q3, Q4
seasonal_sales = data.groupby('quarter')['sales'].sum()
print("Seasonal Sales Pattern 🍂:")
print(seasonal_sales)
```

### 📋 Summary Statistics

```python
# 📊 Generate comprehensive summary
summary = data.groupby('category').agg({
    'sales': ['sum', 'mean', 'max', 'min'],  # 💰 Sales stats
    'quantity': ['sum', 'mean']              # 📦 Quantity stats
})
print(summary)
```

**💡 Linear Explanation:** Analyzing insights means looking beyond raw data to discover what's really happening. We find trends (patterns over time), correlations (how things relate to each other), and patterns (repeated behaviors) to make smart decisions based on data.

---

## 🎯 Complete Example Project 🚀

```python
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# 📥 Step 1: Load data
data = pd.read_csv('sales_data.csv')
print("Data loaded ✅")

# 🧹 Step 2: Clean data
data = data.dropna()  # ❌ Remove missing values
data = data.drop_duplicates()  # 🗑️ Remove duplicates
data['date'] = pd.to_datetime(data['date'])  # 📅 Convert to datetime
print("Data cleaned ✅")

# 🔄 Step 3: Transform data
data['total_revenue'] = data['price'] * data['quantity']  # 💰 Calculate revenue
data['month'] = data['date'].dt.month  # 📅 Extract month
print("Data transformed ✅")

# 📊 Step 4: Analyze
monthly_revenue = data.groupby('month')['total_revenue'].sum()  # 📈 Monthly trends
correlation = data[['price', 'quantity', 'total_revenue']].corr()  # 🔗 Correlations
top_products = data.groupby('product')['total_revenue'].sum().sort_values(ascending=False).head(5)  # 🏆

# 📈 Step 5: Visualize
plt.figure(figsize=(12, 8))

# 📊 Plot 1: Monthly revenue trend
plt.subplot(2, 2, 1)
plt.plot(monthly_revenue.index, monthly_revenue.values, marker='o', color='blue')
plt.title('Monthly Revenue Trend 📈')
plt.xlabel('Month 📅')
plt.ylabel('Revenue 💰')

# 📊 Plot 2: Top products
plt.subplot(2, 2, 2)
plt.barh(top_products.index, top_products.values, color='green')
plt.title('Top 5 Products 🏆')
plt.xlabel('Revenue 💰')

# 🔥 Plot 3: Correlation heatmap
plt.subplot(2, 2, 3)
sns.heatmap(correlation, annot=True, cmap='coolwarm', fmt='.2f')
plt.title('Correlation Matrix 🔥')

# 📦 Plot 4: Price distribution
plt.subplot(2, 2, 4)
sns.boxplot(y=data['price'], color='purple')
plt.title('Price Distribution 📦')

plt.tight_layout()  # 📦 Organize plots nicely
plt.show()
print("Analysis complete ✅")
```

---

## 🎓 What We Learned Today

• **📂 Data Import Skills:** Load real-world datasets from CSV 📄 and Excel 📗 files using Pandas 🐼 to bring external data into Python for analysis

• **🧹 Data Cleaning Techniques:** Handle missing values ❓, remove duplicates 🗑️, transform data types 🔄, and prepare messy data for accurate analysis

• **📈 Visualization Mastery:** Create multiple chart types (line 📉, bar 📊, pie 🥧, histogram 📊, box plot 📦, heatmap 🔥, scatter 🔗) using Matplotlib & Seaborn to visualize patterns clearly

• **💡 Insight Extraction:** Discover trends 📊 over time, calculate correlations 🔗 between variables, identify patterns 🧩 in grouped data, and make data-driven decisions 🎯

• **🚀 End-to-End Workflow:** Combine all skills (import → clean → transform → analyze → visualize) into a complete data analysis project that solves real problems