# 📊 Day 3: Univariate Analysis 📈

---

## 🎯 What is Univariate Analysis? 🔍

**Univariate Analysis** = Analysis of **ONE** ☝️ variable at a time ➜ Understanding its **pattern** 📐, **spread** 📏, and **shape** 🔔

**Real-Life Example** 🌍: Imagine you're analyzing the **heights** 📏 of students in a class. You're not comparing it with weight or age—just studying height alone!

---

## 📚 Three Pillars of Univariate Analysis 🏛️

```
┌─────────────────┬─────────────────┬─────────────────┐
│  📊 Visual      │  🔢 Summary     │  📐 Shape       │
│  Exploration    │  Statistics     │  Metrics        │
└─────────────────┴─────────────────┴─────────────────┘
```

---

## 1️⃣ Visual Exploration Tools 📊👁️

### 📊 A. Histogram (Bar Chart of Frequency) 📶

**Definition** 📖: A graph showing **how many times** ⏱️ each value range appears in your data 📦

**Real-Life Example** 🏠: Counting how many students scored 0-10, 10-20, 20-30... in an exam 📝

```python
import matplotlib.pyplot as plt  # 🎨 Plotting library
import numpy as np  # 🔢 Number operations

# 📊 Sample data: Test scores of 100 students
scores = np.random.normal(70, 15, 100)  # 🔔 Mean=70, SD=15

# 📈 Creating histogram
plt.figure(figsize=(10, 5))  # 📐 Canvas size
plt.hist(scores, bins=10, color='skyblue', edgecolor='black')  # 📊 10 bins
plt.xlabel('Scores 📝')  # ➡️ X-axis label
plt.ylabel('Frequency 🔢')  # ⬆️ Y-axis label
plt.title('📊 Distribution of Test Scores')
plt.grid(axis='y', alpha=0.5)  # 📏 Grid lines
plt.show()
```

**What it tells you** 🧠:

- **Peak** 🏔️ = Most common value range
- **Gaps** 🕳️ = Missing value ranges
- **Width** ↔️ = Data spread

---

### 📦 B. Boxplot (5-Number Summary Box) 🎁

**Definition** 📖: A box showing **Minimum** ⬇️, **Q1** (25%), **Median** ⚖️ (50%), **Q3** (75%), **Maximum** ⬆️

**Real-Life Example** 💰: Salary distribution in a company—see who earns low, middle, high, and outliers 🚀

```python
import seaborn as sns  # 🎨 Advanced visualization

# 💰 Sample data: Monthly salaries (in thousands)
salaries = [25, 28, 30, 32, 35, 38, 40, 42, 45, 48, 50, 55, 60, 65, 150]

# 📦 Creating boxplot
plt.figure(figsize=(8, 5))
sns.boxplot(y=salaries, color='lightgreen')  # 📊 Vertical boxplot
plt.ylabel('Salary (₹ 💰 in thousands)')
plt.title('📦 Salary Distribution Boxplot')
plt.show()
```

**Components Breakdown** 🔍:

```
        ⬆️ Maximum (or Whisker Top)
        │
    ┌───┴───┐
    │   🟦  │ ← Q3 (75th percentile) - Top 25% start here
    │───⚖️──│ ← Median (50th percentile) - Middle value
    │   🟦  │ ← Q1 (25th percentile) - Bottom 25% end here
    └───┬───┘
        │
        ⬇️ Minimum (or Whisker Bottom)
        
    ⭐ Outliers (dots outside whiskers)
```

**What it tells you** 🧠:

- **Box height** 📏 = Middle 50% spread (IQR 📊)
- **Line in box** ➖ = Median value ⚖️
- **Dots above/below** ⭐ = Unusual values (outliers 🚨)

---

### 📈 C. KDE Plot (Smooth Density Curve) 🌊

**Definition** 📖: A **smooth curve** 〰️ showing probability density—like a smoothed histogram 📊➜〰️

**Real-Life Example** ⏰: Peak hours when customers visit your café—smooth curve instead of jagged bars

```python
# ⏰ Sample data: Customer arrival times (24-hour format)
arrival_times = np.random.normal(14, 3, 200)  # 🔔 Peak at 2 PM

# 📈 Creating KDE plot
plt.figure(figsize=(10, 5))
sns.kdeplot(arrival_times, fill=True, color='coral')  # 🌊 Smooth curve
plt.xlabel('Time of Day ⏰ (24-hour)')
plt.ylabel('Density 📊')
plt.title('📈 Customer Arrival Density')
plt.grid(alpha=0.3)
plt.show()
```

**What it tells you** 🧠:

- **Peaks** 🏔️ = Most likely values
- **Width** ↔️ = Variability
- **Smoothness** 〰️ = General trend without noise 🔇

---

## 2️⃣ Summary Statistics 🔢📐

### 🎯 Central Tendency (Where's the Center?) ⚖️

```python
import pandas as pd  # 📊 Data manipulation

# 📦 Sample data: Daily temperatures (°C)
temps = pd.Series([22, 24, 23, 25, 26, 24, 23, 100])  # 🌡️ Note the outlier!

# 📊 Calculating central measures
mean_temp = temps.mean()        # ➕ Sum ÷ Count = Average
median_temp = temps.median()    # ⚖️ Middle value when sorted
mode_temp = temps.mode()[0]     # 🔝 Most frequent value

print(f"Mean 🧮: {mean_temp:.2f}°C")      # Affected by outlier ⚠️
print(f"Median ⚖️: {median_temp:.2f}°C")  # Robust to outliers ✅
print(f"Mode 🔝: {mode_temp:.2f}°C")      # Most common
```

**Output** 📤:

```
Mean 🧮: 33.38°C      ⚠️ Pulled up by 100!
Median ⚖️: 24.00°C    ✅ True center
Mode 🔝: 23.00°C      🔝 Most frequent
```

**When to use which?** 🤔

- **Mean** 🧮 ➜ Normal data without outliers 📊
- **Median** ⚖️ ➜ Skewed data or with outliers 🚨
- **Mode** 🔝 ➜ Categorical data (most popular category) 🏷️

---

### 📏 Spread (How Scattered is Data?) 🎯↔️

```python
# 📊 Spread measures
range_temp = temps.max() - temps.min()     # 📏 Max - Min
variance_temp = temps.var()                 # 📐 Average squared deviation
std_temp = temps.std()                      # 📊 Square root of variance
iqr_temp = temps.quantile(0.75) - temps.quantile(0.25)  # 📦 Q3 - Q1

print(f"Range 📏: {range_temp}°C")
print(f"Variance 📐: {variance_temp:.2f}°C²")
print(f"Std Dev 📊: {std_temp:.2f}°C")
print(f"IQR 📦: {iqr_temp:.2f}°C")
```

**Linear Explanation** ➡️:  
**Standard Deviation** 📊 tells you: "On average, data points are this far ↔️ from the mean 🧮". If SD = 5°C, most temps are within ±5°C of average.

---

## 3️⃣ Shape Metrics 📐🔔

### 🎢 A. Skewness (Is it Tilted?) ⚖️↗️

**Definition** 📖: Measure of **asymmetry** ⚖️ in distribution

```python
from scipy.stats import skew  # 📊 Statistical functions

# 📊 Three scenarios
normal_data = np.random.normal(50, 10, 1000)      # 🔔 Symmetric
right_skewed = np.random.exponential(2, 1000)     # ↗️ Tail on right
left_skewed = 100 - np.random.exponential(2, 1000) # ↙️ Tail on left

print(f"Symmetric 🔔: Skew = {skew(normal_data):.2f}")
print(f"Right Skewed ↗️: Skew = {skew(right_skewed):.2f}")
print(f"Left Skewed ↙️: Skew = {skew(left_skewed):.2f}")
```

**Visual Understanding** 👁️:

```
Left Skewed ↙️          Symmetric 🔔         Right Skewed ↗️
Skew < 0                Skew ≈ 0             Skew > 0

    🏔️                     🏔️                   🏔️
   /  \                   /  \                 /    \___
  /    \___              /    \               /         \___
 /         \___         /      \             /              \___
```

**Real-Life Example** 🏠:

- **House prices** 💰 ➜ Right skewed ↗️ (few expensive houses pull tail right)
- **Exam scores** 📝 ➜ Left skewed ↙️ (if easy exam, most score high, few fail)

---

### 🎯 B. Kurtosis (How Peaked/Flat?) 🏔️📏

**Definition** 📖: Measure of **peakedness** 🏔️ and **tail heaviness** 🦘

```python
from scipy.stats import kurtosis  # 📊 Kurtosis calculation

# 📊 Different distributions
normal_data = np.random.normal(0, 1, 1000)      # 🔔 Mesokurtic (baseline)
peaked_data = np.random.laplace(0, 1, 1000)     # 🏔️ Leptokurtic (peaked)
flat_data = np.random.uniform(-2, 2, 1000)      # 📏 Platykurtic (flat)

print(f"Normal 🔔: Kurt = {kurtosis(normal_data):.2f}")
print(f"Peaked 🏔️: Kurt = {kurtosis(peaked_data):.2f}")
print(f"Flat 📏: Kurt = {kurtosis(flat_data):.2f}")
```

**Interpretation** 🧠:

- **Kurt > 0** ➜ **Leptokurtic** 🏔️ = Sharp peak, heavy tails (more outliers 🚨)
- **Kurt ≈ 0** ➜ **Mesokurtic** 🔔 = Normal distribution
- **Kurt < 0** ➜ **Platykurtic** 📏 = Flat peak, light tails (fewer outliers ✅)

**Real-Life Example** 🌍:  
**Stock returns** 📈 ➜ High kurtosis 🏔️ (rare extreme gains/losses 🎢)

---

## 🔍 Complete Analysis Example 🎯

```python
# 🏪 Real scenario: Analyzing daily sales
sales = np.random.gamma(5, 2, 365) * 1000  # 💰 Daily sales in ₹

# 📊 1. Visual exploration
fig, axes = plt.subplots(1, 3, figsize=(15, 4))

# Histogram 📊
axes[0].hist(sales, bins=30, color='skyblue', edgecolor='black')
axes[0].set_title('📊 Sales Distribution')
axes[0].set_xlabel('Sales Amount 💰')

# Boxplot 📦
axes[1].boxplot(sales)
axes[1].set_title('📦 Sales Boxplot')
axes[1].set_ylabel('Sales Amount 💰')

# KDE 📈
sns.kdeplot(sales, fill=True, color='coral', ax=axes[2])
axes[2].set_title('📈 Sales Density')
axes[2].set_xlabel('Sales Amount 💰')

plt.tight_layout()
plt.show()

# 🔢 2. Summary statistics
print("=" * 50)
print("📊 SUMMARY STATISTICS")
print("=" * 50)
print(f"Mean 🧮: ₹{sales.mean():.2f}")
print(f"Median ⚖️: ₹{np.median(sales):.2f}")
print(f"Std Dev 📊: ₹{sales.std():.2f}")
print(f"Min ⬇️: ₹{sales.min():.2f}")
print(f"Max ⬆️: ₹{sales.max():.2f}")
print("-" * 50)

# 📐 3. Shape analysis
print(f"Skewness 🎢: {skew(sales):.2f}")
print(f"Kurtosis 🏔️: {kurtosis(sales):.2f}")
print("=" * 50)

# 🧠 4. Interpretation
if skew(sales) > 0:
    print("✅ Right skewed ↗️: Few high-sales days pull average up")
else:
    print("✅ Left skewed ↙️: Few low-sales days pull average down")
```

---

## ⚠️ Edge Cases & Considerations 🚨

### 🔴 Edge Case 1: Outliers Distorting Analysis

```python
# 💰 Salaries with CEO included
salaries = [30, 32, 35, 38, 40, 42, 45, 50, 10000]  # 🚨 CEO earns 10000k!

print(f"Mean 🧮: ₹{np.mean(salaries):.2f}k")      # ❌ 1157k (unrealistic!)
print(f"Median ⚖️: ₹{np.median(salaries):.2f}k")  # ✅ 40k (true center)
```

**Solution** 💡: Use **median** ⚖️ instead of mean 🧮 when outliers present 🚨

---

### 🟡 Edge Case 2: Multimodal Distribution (Multiple Peaks) 🏔️🏔️

```python
# 👥 Heights of adults and children mixed
heights = np.concatenate([
    np.random.normal(120, 10, 100),  # 👶 Children: 120cm
    np.random.normal(170, 10, 100)   # 👨 Adults: 170cm
])

# 📊 This creates TWO peaks! 🏔️🏔️
```

**Solution** 💡: Separate the groups ➜ Analyze **children** 👶 and **adults** 👨 separately

---

### 🟢 Edge Case 3: Uniform Distribution (No Clear Center) 📏

```python
# 🎲 Dice rolls: All outcomes equally likely
dice_rolls = np.random.randint(1, 7, 1000)  # 🎲 1 to 6

# ❌ Mean/median not meaningful here!
# ✅ Better: Just show frequency of each outcome
```

**Solution** 💡: Use **frequency table** 📋 or **bar chart** 📊 instead of mean/median

---

## 🎓 Key Takeaways Summary 📝

```
┌────────────────────────────────────────────────────────────┐
│                  📚 UNIVARIATE ANALYSIS RECIPE              │
├────────────────────────────────────────────────────────────┤
│  1️⃣ VISUALIZE 👁️                                          │
│     ├─ Histogram 📊 → Overall shape                        │
│     ├─ Boxplot 📦 → Outliers & quartiles                   │
│     └─ KDE 📈 → Smooth trend                               │
│                                                             │
│  2️⃣ MEASURE CENTER ⚖️                                      │
│     ├─ Mean 🧮 → Average (use if no outliers)              │
│     ├─ Median ⚖️ → Middle (robust to outliers ✅)          │
│     └─ Mode 🔝 → Most common                               │
│                                                             │
│  3️⃣ MEASURE SPREAD 📏                                      │
│     ├─ Range 📏 → Max - Min                                │
│     ├─ Std Dev 📊 → Average distance from mean             │
│     └─ IQR 📦 → Middle 50% spread                          │
│                                                             │
│  4️⃣ ANALYZE SHAPE 📐                                       │
│     ├─ Skewness 🎢 → Symmetry check                        │
│     └─ Kurtosis 🏔️ → Peakedness                           │
└────────────────────────────────────────────────────────────┘
```

---

## 📌 Topics Covered Today ✅

• **📊 Visual Tools** 🎨 → Histogram (frequency bars 📶), Boxplot (5-number summary 📦), KDE (smooth density curve 〰️) to **see** data patterns 👁️

• **🔢 Summary Statistics** 📐 → Central tendency (mean 🧮, median ⚖️, mode 🔝) tells **where** data centers, spread measures (range 📏, std dev 📊, IQR 📦) tell **how scattered** ↔️ data is

• **📐 Shape Metrics** 🎢 → Skewness (symmetry check ⚖️: left ↙️, right ↗️, or centered 🔔) and kurtosis (peakedness 🏔️: sharp/flat with heavy/light tails 🦘)

• **⚠️ Edge Cases** 🚨 → Handle outliers 🎯 (use median ⚖️), multimodal data 🏔️🏔️ (separate groups 👥), uniform distributions 📏 (use frequency 📋), real-world examples 🌍 (salaries 💰, heights 📏, sales 💵)

• **🎯 Complete Workflow** ♻️ → Always combine visuals 👁️ + statistics 🔢 + shape analysis 📐 for full understanding 🧠 of single variable behavior 📊