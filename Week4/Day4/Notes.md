# 📊 Day 4: Bivariate Analysis 🔗

---

## 🎯 What is Bivariate Analysis? 🔍

**Bivariate Analysis** = Study of **TWO** ✌️ variables together ➜ Finding **relationships** 🔗, **patterns** 📐, and **connections** 🌉 between them

**Real-Life Example** 🌍: Does studying more hours ⏰ lead to higher exam scores 📝? Does height 📏 relate to weight ⚖️? That's bivariate analysis!

**Key Difference** 🔄:

```
Univariate (Day 3) ☝️  →  Study ONE variable alone
     "How tall are students?" 📏

Bivariate (Day 4) ✌️   →  Study TWO variables together  
     "Does height 📏 relate to weight ⚖️?"
```

---

## 📚 Three Pillars of Bivariate Analysis 🏛️

```
┌──────────────────┬──────────────────┬──────────────────┐
│  👁️ Visual       │  🔢 Correlation  │  ⚠️ Multi-       │
│  Relationships   │  Measurement     │  collinearity    │
└──────────────────┴──────────────────┴──────────────────┘
```

---

## 1️⃣ Visual Relationship Tools 👁️📊

### 🎯 A. Scatterplot (Point Cloud) ☁️

**Definition** 📖: A graph with **points** ⚫ showing how two variables relate—each point = one observation 📍

**Real-Life Example** 🏠: Plotting **house size** 🏡 (X-axis ➡️) vs **price** 💰 (Y-axis ⬆️) to see if bigger = costlier

```python
import matplotlib.pyplot as plt  # 🎨 Plotting library
import numpy as np  # 🔢 Number operations
import pandas as pd  # 📊 Data manipulation

# 📊 Sample data: Study hours vs Exam scores
np.random.seed(42)  # 🔒 Reproducible results
study_hours = np.random.uniform(1, 10, 50)  # ⏰ Hours: 1-10
exam_scores = 30 + 5 * study_hours + np.random.normal(0, 5, 50)  # 📝 Score with noise

# 🎨 Creating scatterplot
plt.figure(figsize=(10, 6))
plt.scatter(study_hours, exam_scores, color='dodgerblue', 
            s=100, alpha=0.6, edgecolors='black')  # ⚫ Points
plt.xlabel('Study Hours ⏰', fontsize=12)  # ➡️ X-axis
plt.ylabel('Exam Score 📝', fontsize=12)  # ⬆️ Y-axis
plt.title('📊 Study Hours vs Exam Scores', fontsize=14)
plt.grid(alpha=0.3)  # 📏 Grid
plt.show()
```

**Pattern Recognition** 🧠:

```
Positive ↗️              No Pattern 🎲           Negative ↘️
(One ⬆️, Other ⬆️)      (Random scatter)       (One ⬆️, Other ⬇️)

    ⚫                      ⚫    ⚫                 ⚫⚫⚫
  ⚫⚫                   ⚫  ⚫  ⚫                    ⚫⚫
 ⚫⚫⚫                 ⚫    ⚫    ⚫                   ⚫⚫
⚫⚫⚫⚫               ⚫  ⚫    ⚫  ⚫                    ⚫

More study → Higher score   No relationship      More junk food → Lower health
```

---

### 🎨 B. Pairplot (Multiple Scatterplots Grid) 🔲

**Definition** 📖: A **grid of scatterplots** 🔲 showing relationships between **all pairs** ✌️ of variables at once

**Real-Life Example** 🏋️: Analyzing fitness data—compare **weight ⚖️ vs height 📏**, **weight vs BMI 📊**, **BMI vs age 🎂** all together!

```python
import seaborn as sns  # 🎨 Advanced visualization

# 📊 Sample data: Student performance dataset
data = pd.DataFrame({
    'Study_Hours ⏰': np.random.uniform(1, 10, 100),
    'Sleep_Hours 😴': np.random.uniform(4, 10, 100),
    'Previous_Score 📋': np.random.uniform(40, 90, 100),
    'Current_Score 📝': np.random.uniform(50, 95, 100)
})

# 🎨 Creating pairplot
sns.pairplot(data, diag_kind='kde', corner=False,
             plot_kws={'alpha': 0.6, 's': 50, 'edgecolor': 'black'},
             diag_kws={'fill': True, 'color': 'coral'})
plt.suptitle('🎨 Pairplot: All Variable Relationships', y=1.02, fontsize=14)
plt.show()
```

**What You See** 👁️:

```
┌──────────┬──────────┬──────────┬──────────┐
│ Study ⏰ │ Study vs │ Study vs │ Study vs │
│ Distrib. │ Sleep 😴 │ Prev 📋  │ Curr 📝  │
├──────────┼──────────┼──────────┼──────────┤
│ Sleep vs │ Sleep 😴 │ Sleep vs │ Sleep vs │
│ Study ⏰ │ Distrib. │ Prev 📋  │ Curr 📝  │
├──────────┼──────────┼──────────┼──────────┤
│ Prev vs  │ Prev vs  │ Prev 📋  │ Prev vs  │
│ Study ⏰ │ Sleep 😴 │ Distrib. │ Curr 📝  │
├──────────┼──────────┼──────────┼──────────┤
│ Curr vs  │ Curr vs  │ Curr vs  │ Curr 📝  │
│ Study ⏰ │ Sleep 😴 │ Prev 📋  │ Distrib. │
└──────────┴──────────┴──────────┴──────────┘

Diagonal = Distribution of single variable 📊
Off-diagonal = Scatterplot between two variables ⚫
```

**Pro Tip** 💡: Look for **strong diagonal patterns** ↗️↘️ in off-diagonal plots = strong relationships 🔗

---

### 🔥 C. Heatmap (Color-Coded Correlation Matrix) 🌈

**Definition** 📖: A **colored grid** 🎨 where color intensity shows **strength** 💪 of relationship between variables

**Real-Life Example** 🌡️: Weather analysis—see which factors (temp 🌡️, humidity 💧, pressure 🎈) strongly relate to rainfall 🌧️

```python
# 📊 Sample data: Marketing dataset
marketing_data = pd.DataFrame({
    'Ad_Spend 💰': np.random.uniform(1000, 10000, 200),
    'Social_Media_Followers 📱': np.random.uniform(500, 5000, 200),
    'Website_Visits 🌐': np.random.uniform(100, 1000, 200),
    'Sales 💵': np.random.uniform(5000, 50000, 200)
})

# Add some correlations for realism ✨
marketing_data['Sales 💵'] = (marketing_data['Ad_Spend 💰'] * 3 + 
                               marketing_data['Website_Visits 🌐'] * 20 + 
                               np.random.normal(0, 2000, 200))

# 🔢 Calculate correlation matrix
correlation_matrix = marketing_data.corr()  # 📊 Pearson correlation

# 🎨 Creating heatmap
plt.figure(figsize=(10, 8))
sns.heatmap(correlation_matrix, annot=True, cmap='coolwarm', 
            center=0, square=True, linewidths=2,
            cbar_kws={'label': 'Correlation Strength 💪'})
plt.title('🔥 Correlation Heatmap: Marketing Data', fontsize=14)
plt.show()
```

**Color Code** 🌈:

```
🔴 Red (1.0)     →  Perfect Positive ↗️  (X ⬆️ = Y ⬆️)
⚪ White (0.0)    →  No Correlation 🎲   (No pattern)
🔵 Blue (-1.0)   →  Perfect Negative ↘️ (X ⬆️ = Y ⬇️)

Example Reading 📖:
┌─────────┬────────┬────────┐
│ Var A   │  0.85  │ -0.30  │ ← A & B: Strong positive 💪
│   B     │  1.00  │  0.15  │ ← B & B: Always 1 (self) ✅
│   C     │  0.15  │  1.00  │ ← A & C: Weak negative 😐
└─────────┴────────┴────────┘
```

**Linear Explanation** ➡️:  
Heatmap is like a **friendship chart** 🤝—darker red = best friends 👯 (move together), white = strangers 🤷 (independent), dark blue = opposites ⚡ (one up, other down).

---

## 2️⃣ Correlation Measurement 🔢📐

### 📊 A. Pearson Correlation Coefficient (r) 🔗

**Definition** 📖: A number between **-1** and **+1** measuring **linear relationship** 📏 strength and direction ➡️

**Formula** 🧮:

```
r = Σ[(x - x̄)(y - ȳ)] / √[Σ(x - x̄)² × Σ(y - ȳ)²]
    ↓
How much X and Y vary together 🔗
Divided by their individual variations 📊
```

```python
from scipy.stats import pearsonr  # 📊 Correlation calculation

# 📊 Example 1: Perfect positive correlation ↗️
x_perfect = np.array([1, 2, 3, 4, 5])
y_perfect = np.array([2, 4, 6, 8, 10])  # y = 2x (perfect line!)

r_perfect, p_perfect = pearsonr(x_perfect, y_perfect)
print(f"✅ Perfect Positive: r = {r_perfect:.2f} (p = {p_perfect:.4f})")

# 📊 Example 2: Strong positive correlation ↗️
x_strong = np.array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
y_strong = x_strong * 2 + np.random.normal(0, 1, 10)  # Line + noise 🔊

r_strong, p_strong = pearsonr(x_strong, y_strong)
print(f"💪 Strong Positive: r = {r_strong:.2f} (p = {p_strong:.4f})")

# 📊 Example 3: No correlation 🎲
x_none = np.random.uniform(0, 10, 50)
y_none = np.random.uniform(0, 10, 50)  # Completely random ❓

r_none, p_none = pearsonr(x_none, y_none)
print(f"🤷 No Correlation: r = {r_none:.2f} (p = {p_none:.4f})")

# 📊 Example 4: Strong negative correlation ↘️
x_negative = np.array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
y_negative = -x_negative * 1.5 + np.random.normal(0, 0.5, 10)  # Opposite ⚡

r_negative, p_negative = pearsonr(x_negative, y_negative)
print(f"⚡ Strong Negative: r = {r_negative:.2f} (p = {p_negative:.4f})")
```

**Interpretation Guide** 🧭:

```
┌────────────┬──────────────┬─────────────────────────┐
│  r Value   │  Strength 💪 │  Real-Life Example 🌍   │
├────────────┼──────────────┼─────────────────────────┤
│  0.9 - 1.0 │  Very Strong │  Height vs Weight 📏⚖️  │
│  0.7 - 0.9 │  Strong      │  Study vs Score ⏰📝    │
│  0.5 - 0.7 │  Moderate    │  Exercise vs Health 🏃  │
│  0.3 - 0.5 │  Weak        │  Luck vs Success 🍀     │
│  0.0 - 0.3 │  Very Weak   │  Shoe size vs IQ 👟🧠   │
│  0.0       │  None        │  Random pairs 🎲        │
│ -0.3 - 0.0 │  Very Weak - │  Age vs Flexibility 🎂  │
│ -0.5 - -0.3│  Weak -      │  Stress vs Sleep 😰😴   │
│ -0.7 - -0.5│  Moderate -  │  Price vs Demand 💰📉   │
│ -0.9 - -0.7│  Strong -    │  Speed vs Fuel ⚡⛽     │
│ -1.0 - -0.9│  Very Strong-│  Temp vs Heating 🌡️🔥   │
└────────────┴──────────────┴─────────────────────────┘
```

**P-Value** 📊:

- **p < 0.05** ✅ = Correlation is **statistically significant** (not by chance 🎲)
- **p ≥ 0.05** ❌ = Correlation might be **random noise** 🔊 (unreliable!)

---

### 🔄 B. Spearman Rank Correlation (ρ) 📊

**Definition** 📖: Measures **monotonic relationship** 📈 (not just linear 📏)—works for **ranks** 🥇🥈🥉 instead of actual values

**When to Use** 🤔:

- Data has **outliers** 🚨 (Spearman is robust ✅)
- Relationship is **non-linear** 〰️ but consistent
- Data is **ordinal** 🥇🥈🥉 (ranks, ratings ⭐)

```python
from scipy.stats import spearmanr  # 📊 Rank correlation

# 📊 Example: Non-linear but monotonic relationship
x_nonlinear = np.array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
y_nonlinear = x_nonlinear ** 2  # 📈 Exponential growth (not linear!)

# 🔢 Compare Pearson vs Spearman
r_pearson, _ = pearsonr(x_nonlinear, y_nonlinear)
rho_spearman, _ = spearmanr(x_nonlinear, y_nonlinear)

print(f"Pearson (Linear) 📏: r = {r_pearson:.2f}")
print(f"Spearman (Rank) 🥇: ρ = {rho_spearman:.2f}")
print("↪️ Spearman = 1.0 because Y always increases with X ✅")
```

**Visual Difference** 👁️:

```
Linear ➡️ (Pearson Good)     Non-Linear 〰️ (Spearman Better)
        ⚫                            ⚫⚫
      ⚫                           ⚫⚫
    ⚫                          ⚫⚫
  ⚫                         ⚫⚫
⚫                        ⚫⚫
                      ⚫⚫
                   ⚫⚫
```

---

### 📋 C. Correlation Matrix (Complete Relationship Table) 🔢

**Definition** 📖: A **table** showing correlation **r** between **every pair** ✌️ of variables

```python
# 📊 Create comprehensive dataset
complete_data = pd.DataFrame({
    'Age 🎂': np.random.randint(18, 65, 100),
    'Income 💰': np.random.uniform(20000, 100000, 100),
    'Education_Years 🎓': np.random.randint(10, 20, 100),
    'Job_Satisfaction 😊': np.random.randint(1, 11, 100),
    'Work_Hours ⏰': np.random.uniform(20, 60, 100)
})

# Add realistic correlations ✨
complete_data['Income 💰'] = (complete_data['Education_Years 🎓'] * 3000 + 
                               complete_data['Work_Hours ⏰'] * 500 +
                               np.random.normal(0, 5000, 100))

# 🔢 Full correlation matrix
corr_matrix = complete_data.corr()
print("📊 CORRELATION MATRIX")
print("=" * 60)
print(corr_matrix.round(2))  # 🔢 Rounded to 2 decimals
print("=" * 60)

# 🔍 Find strongest correlations
# Get upper triangle (avoid duplicates)
upper_triangle = corr_matrix.where(
    np.triu(np.ones(corr_matrix.shape), k=1).astype(bool)
)

# 📊 Sort and display top correlations
print("\n🏆 TOP 3 STRONGEST CORRELATIONS:")
print("-" * 60)
correlations_list = upper_triangle.unstack().sort_values(ascending=False)
for idx, (pair, value) in enumerate(correlations_list.head(3).items(), 1):
    print(f"{idx}. {pair[0]} ↔️ {pair[1]}: r = {value:.3f}")
```

---

## 3️⃣ Multicollinearity Detection ⚠️🔗

### 🚨 A. What is Multicollinearity? 🤯

**Definition** 📖: When **two or more** predictor variables are **highly correlated** 🔗 with each other—creates problems in modeling 🎯

**Real-Life Example** 🏠:  
Predicting house price 💰 using both:

- **Square footage** 📏 (e.g., 2000 sq ft)
- **Number of rooms** 🚪 (e.g., 8 rooms)

These are **highly correlated** ↗️ (bigger house = more rooms) ➜ **multicollinearity!** 🚨

**Why It's Bad** ❌:

```
┌──────────────────────────────────────────────────┐
│  Problems Caused by Multicollinearity ⚠️        │
├──────────────────────────────────────────────────┤
│  1️⃣ Can't tell which variable REALLY matters 🤷  │
│  2️⃣ Model coefficients become unstable 🎢       │
│  3️⃣ P-values become unreliable ❓               │
│  4️⃣ Hard to interpret individual effects 🔍     │
└──────────────────────────────────────────────────┘
```

---

### 🔍 B. Detecting Multicollinearity: Correlation Threshold Method 📊

**Rule of Thumb** 📏: If **|r| > 0.8** or **|r| > 0.9** between predictors ➜ **multicollinearity warning** 🚨

```python
# 📊 Example dataset with multicollinearity
housing_data = pd.DataFrame({
    'Square_Feet 📏': np.random.uniform(1000, 3000, 100),
    'Num_Rooms 🚪': np.random.randint(2, 8, 100),
    'Num_Bathrooms 🚿': np.random.randint(1, 4, 100),
    'Age_Years 🎂': np.random.randint(0, 50, 100)
})

# Create multicollinearity: Rooms ≈ Square_Feet / 250 🔗
housing_data['Num_Rooms 🚪'] = (housing_data['Square_Feet 📏'] / 250 + 
                                 np.random.normal(0, 0.5, 100)).astype(int)

# 🔢 Check correlations
corr = housing_data.corr()

# 🚨 Flag high correlations
print("🚨 MULTICOLLINEARITY CHECK")
print("=" * 60)
threshold = 0.8  # 📏 Threshold

for i in range(len(corr.columns)):
    for j in range(i+1, len(corr.columns)):
        if abs(corr.iloc[i, j]) > threshold:
            print(f"⚠️ HIGH: {corr.columns[i]} ↔️ {corr.columns[j]}")
            print(f"   Correlation: {corr.iloc[i, j]:.3f}")
            print(f"   ➜ Consider removing one variable! 🗑️")
            print("-" * 60)
```

---

### 📐 C. Variance Inflation Factor (VIF) 🎯

**Definition** 📖: Measures how much a variable's variance is **inflated** 🎈 due to correlation with other variables

**Formula** 🧮:

```
VIF = 1 / (1 - R²)

Where R² = How well variable X is predicted by OTHER variables

Low VIF ✅ → Variable is independent 🆓
High VIF ⚠️ → Variable is redundant 🔄
```

**Interpretation Guide** 🧭:

```
┌─────────────┬────────────────┬─────────────────────┐
│  VIF Value  │  Severity ⚠️   │  Action 🎯          │
├─────────────┼────────────────┼─────────────────────┤
│  1.0        │  No Correlation│  Perfect ✅         │
│  1 - 5      │  Low           │  Safe ✅            │
│  5 - 10     │  Moderate      │  Investigate 🔍     │
│  > 10       │  High          │  Remove Variable 🗑️ │
│  > 100      │  Severe        │  Critical Issue 🚨  │
└─────────────┴────────────────┴─────────────────────┘
```

```python
from statsmodels.stats.outliers_influence import variance_inflation_factor

# 📊 Calculate VIF for each variable
def calculate_vif(dataframe):
    """Calculate VIF for all columns 🔢"""
    vif_data = pd.DataFrame()
    vif_data["Variable 📊"] = dataframe.columns
    vif_data["VIF 📐"] = [
        variance_inflation_factor(dataframe.values, i) 
        for i in range(dataframe.shape[1])
    ]
    return vif_data

# 🔍 Apply to housing data
vif_results = calculate_vif(housing_data)

print("\n📐 VARIANCE INFLATION FACTOR (VIF)")
print("=" * 60)
print(vif_results.round(2))
print("=" * 60)

# 🚨 Flag problematic variables
print("\n⚠️ VIF WARNINGS:")
for idx, row in vif_results.iterrows():
    if row['VIF 📐'] > 10:
        print(f"🚨 {row['Variable 📊']}: VIF = {row['VIF 📐']:.2f} (Remove! 🗑️)")
    elif row['VIF 📐'] > 5:
        print(f"⚠️ {row['Variable 📊']}: VIF = {row['VIF 📐']:.2f} (Investigate 🔍)")
    else:
        print(f"✅ {row['Variable 📊']}: VIF = {row['VIF 📐']:.2f} (Safe ✅)")
```

---

### 🛠️ D. Fixing Multicollinearity 🔧

**Solution Strategies** 💡:

```python
# 🎯 Strategy 1: Remove one correlated variable 🗑️
# If Square_Feet 📏 and Num_Rooms 🚪 correlate > 0.9
# Keep Square_Feet 📏 (more precise), drop Num_Rooms 🚪

housing_fixed_1 = housing_data.drop('Num_Rooms 🚪', axis=1)
print("✅ Strategy 1: Dropped Num_Rooms 🚪")

# 🎯 Strategy 2: Combine variables into one 🔀
# Create "Living_Space_Index 📊" = weighted combination

housing_fixed_2 = housing_data.copy()
housing_fixed_2['Living_Index 📊'] = (
    housing_fixed_2['Square_Feet 📏'] * 0.7 + 
    housing_fixed_2['Num_Rooms 🚪'] * 100 * 0.3
)
housing_fixed_2 = housing_fixed_2.drop(['Square_Feet 📏', 'Num_Rooms 🚪'], axis=1)
print("✅ Strategy 2: Combined into Living_Index 📊")

# 🎯 Strategy 3: Principal Component Analysis (PCA) 🎲
# Advanced: Transform correlated variables into uncorrelated components
from sklearn.decomposition import PCA

pca = PCA(n_components=2)  # 🔄 Reduce to 2 components
components = pca.fit_transform(housing_data[['Square_Feet 📏', 'Num_Rooms 🚪']])
housing_fixed_3 = housing_data.copy()
housing_fixed_3['PC1 🎯'] = components[:, 0]  # 📊 First component
housing_fixed_3['PC2 🎯'] = components[:, 1]  # 📊 Second component
housing_fixed_3 = housing_fixed_3.drop(['Square_Feet 📏', 'Num_Rooms 🚪'], axis=1)
print("✅ Strategy 3: Applied PCA transformation 🎲")
```

---

## 🔍 Complete Bivariate Analysis Workflow 🎯

```python
# 📊 Real-world example: Employee performance analysis
np.random.seed(123)

employee_data = pd.DataFrame({
    'Years_Experience 🎂': np.random.uniform(0, 20, 150),
    'Training_Hours 📚': np.random.uniform(10, 100, 150),
    'Projects_Completed 📋': np.random.randint(5, 50, 150),
    'Customer_Rating ⭐': np.random.uniform(3.0, 5.0, 150),
    'Salary 💰': np.random.uniform(30000, 120000, 150)
})

# Add realistic relationships ✨
employee_data['Salary 💰'] = (
    employee_data['Years_Experience 🎂'] * 3000 +
    employee_data['Projects_Completed 📋'] * 500 +
    employee_data['Customer_Rating ⭐'] * 5000 +
    np.random.normal(0, 5000, 150)
)

print("=" * 70)
print("🎯 COMPLETE BIVARIATE ANALYSIS: EMPLOYEE PERFORMANCE")
print("=" * 70)

# 1️⃣ VISUAL EXPLORATION 👁️
print("\n📊 Step 1: Creating Visualizations...")
fig = plt.figure(figsize=(15, 10))

# Scatterplot 🎯
plt.subplot(2, 2, 1)
plt.scatter(employee_data['Years_Experience 🎂'], 
            employee_data['Salary 💰'], 
            alpha=0.6, c='dodgerblue', edgecolors='black')
plt.xlabel('Years Experience 🎂')
plt.ylabel('Salary 💰')
plt.title('📊 Experience vs Salary')
plt.grid(alpha=0.3)

# Another scatterplot 🎯
plt.subplot(2, 2, 2)
plt.scatter(employee_data['Customer_Rating ⭐'], 
            employee_data['Salary 💰'],
            alpha=0.6, c='coral', edgecolors='black')
plt.xlabel('Customer Rating ⭐')
plt.ylabel('Salary 💰')
plt.title('📊 Rating vs Salary')
plt.grid(alpha=0.3)

# Correlation heatmap 🔥
plt.subplot(2, 2, 3)
corr_emp = employee_data.corr()
sns.heatmap(corr_emp, annot=True, cmap='coolwarm', center=0,
            square=True, linewidths=1, cbar_kws={'shrink': 0.8})
plt.title('🔥 Correlation Heatmap')

# Pairplot sample (2 vars) 🎨
plt.subplot(2, 2, 4)
plt.scatter(employee_data['Projects_Completed 📋'],
            employee_data['Salary 💰'],
            alpha=0.6, c='mediumseagreen', edgecolors='black')
plt.xlabel('Projects Completed 📋')
plt.ylabel('Salary 💰')
plt.title('📊 Projects vs Salary')
plt.grid(alpha=0.3)

plt.tight_layout()
plt.show()

```