# 📚 Day 13: Introduction to Other Important Libraries 🔬

---

## 🎯 Topics to Cover

|📌 Library|🔍 Focus Area|
|---|---|
|**🔢 NumPy Advanced**|Broadcasting 📡, Vectorization ⚡, Matrix Operations 🧮|
|**🔬 SciPy**|Statistical Functions 📊 & Scientific Computations 🧪|
|**📈 Statsmodels**|Statistical Modeling 📉 & Analysis|
|**🤖 Sklearn Basics**|Datasets 📦 & Preprocessing 🛠️ Modules|

---

## 🔢 1. NumPy Advanced – Broadcasting 📡, Vectorization ⚡, Matrix Operations 🧮

**Goal:** Master advanced NumPy techniques for fast numerical computing.

### 📡 Broadcasting (Operating on Different Shapes)

Broadcasting allows NumPy to perform operations on arrays of different shapes without copying data.

```python
import numpy as np  # 🔢 Import NumPy

# 📡 Example 1: Add scalar to array
array = np.array([1, 2, 3, 4, 5])
result = array + 10  # ➕ Adds 10 to each element
print(result)  # Output: [11 12 13 14 15]

# 📡 Example 2: Add 1D array to 2D array
matrix = np.array([[1, 2, 3],
                   [4, 5, 6],
                   [7, 8, 9]])
row = np.array([10, 20, 30])
result = matrix + row  # ➕ Adds row to each row of matrix
print(result)
# Output:
# [[11 22 33]
#  [14 25 36]
#  [17 28 39]]

# 📡 Example 3: Column broadcasting
column = np.array([[10], [20], [30]])  # 📊 3x1 column
result = matrix + column  # ➕ Adds column to each column of matrix
print(result)

# 📡 Broadcasting rules:
# ✅ Dimensions must be compatible (equal or one of them is 1)
# ✅ NumPy stretches the smaller array automatically
```

**💡 Linear Explanation:** Broadcasting lets you perform operations between arrays of different sizes without manually copying data. NumPy automatically "stretches" smaller arrays to match larger ones, making operations fast and memory-efficient.

### ⚡ Vectorization (Avoiding Loops for Speed)

Vectorization replaces slow Python loops with fast NumPy operations.

```python
# 🐌 Slow way: Using Python loops
numbers = [1, 2, 3, 4, 5]
squared = []
for num in numbers:
    squared.append(num ** 2)  # ⏰ Slow iteration

# ⚡ Fast way: Using vectorization
numbers = np.array([1, 2, 3, 4, 5])
squared = numbers ** 2  # 🚀 100x faster!
print(squared)  # Output: [ 1  4  9 16 25]

# ⚡ Example: Mathematical operations
array = np.array([1, 2, 3, 4, 5])
result = np.sqrt(array) * 2 + 5  # 🧮 Multiple operations at once
print(result)

# ⚡ Example: Conditional operations
data = np.array([10, 25, 30, 15, 40])
result = np.where(data > 20, "High", "Low")  # 🔍 Vectorized condition
print(result)  # Output: ['Low' 'High' 'High' 'Low' 'High']

# ⚡ Example: Apply custom function
def custom_func(x):
    return x ** 2 + 2 * x + 1  # 📐 Formula

vectorized_func = np.vectorize(custom_func)  # 🔄 Make it vectorized
result = vectorized_func(array)
print(result)
```

**💡 Linear Explanation:** Vectorization means doing operations on entire arrays at once instead of looping through elements one by one. This makes code run 10-100x faster because NumPy uses optimized C code underneath.

### 🧮 Matrix Operations (Linear Algebra)

```python
# 🧮 Create matrices
A = np.array([[1, 2], [3, 4]])
B = np.array([[5, 6], [7, 8]])

# ➕ Matrix addition
result = A + B  # Element-wise addition
print("Addition ➕:\n", result)

# ➖ Matrix subtraction
result = A - B  # Element-wise subtraction
print("Subtraction ➖:\n", result)

# ✖️ Element-wise multiplication
result = A * B  # Multiply corresponding elements
print("Element-wise ✖️:\n", result)

# 🔢 Matrix multiplication (Dot product)
result = np.dot(A, B)  # Or A @ B
print("Matrix Multiplication 🔢:\n", result)

# 🔄 Transpose (flip rows and columns)
result = A.T  # Or np.transpose(A)
print("Transpose 🔄:\n", result)

# 🔍 Inverse (A⁻¹)
result = np.linalg.inv(A)
print("Inverse 🔍:\n", result)

# 📊 Determinant
result = np.linalg.det(A)
print("Determinant 📊:", result)

# 🎯 Eigenvalues and Eigenvectors
eigenvalues, eigenvectors = np.linalg.eig(A)
print("Eigenvalues 🎯:", eigenvalues)
print("Eigenvectors 🎯:\n", eigenvectors)

# 📐 Solve linear equations: Ax = b
b = np.array([1, 2])
x = np.linalg.solve(A, b)  # Solves for x
print("Solution 📐:", x)

# 🔢 Matrix rank
rank = np.linalg.matrix_rank(A)
print("Rank 🔢:", rank)
```

**💡 Linear Explanation:** Matrix operations are essential for scientific computing and machine learning. NumPy provides functions for addition, multiplication, transpose, inverse, and solving equations - all optimized for speed.

---

## 🔬 2. SciPy – Statistical Functions 📊 & Scientific Computations 🧪

**Goal:** Use SciPy for advanced scientific and statistical computing.

### 📊 Statistical Functions

```python
from scipy import stats  # 📊 Import statistics module

# 📊 Create sample data
data = np.array([10, 12, 23, 23, 16, 23, 21, 16])

# 📈 Descriptive statistics
print("Mean 📈:", np.mean(data))
print("Median 📊:", np.median(data))
print("Mode 🔝:", stats.mode(data))
print("Standard Deviation 📏:", np.std(data))
print("Variance 📊:", np.var(data))

# 📊 Probability distributions
# 🔔 Normal distribution
mean, std = 0, 1
normal_dist = stats.norm(loc=mean, scale=std)
print("PDF at x=0 🔔:", normal_dist.pdf(0))  # Probability Density Function
print("CDF at x=0 📈:", normal_dist.cdf(0))  # Cumulative Distribution Function

# 🎲 Generate random samples from normal distribution
samples = normal_dist.rvs(size=100)  # 🎲 100 random samples
print("Random samples 🎲:", samples[:5])

# 📊 Other distributions
uniform_dist = stats.uniform(loc=0, scale=10)  # 📏 Uniform distribution
binomial_dist = stats.binom(n=10, p=0.5)  # 🎯 Binomial distribution
poisson_dist = stats.poisson(mu=3)  # 📊 Poisson distribution

# 🧪 Hypothesis testing
# T-test (compare two samples)
sample1 = np.array([10, 12, 14, 16, 18])
sample2 = np.array([11, 13, 15, 17, 19])
t_stat, p_value = stats.ttest_ind(sample1, sample2)  # 🧪 Independent t-test
print(f"T-statistic 🧪: {t_stat:.4f}, P-value 📊: {p_value:.4f}")

# 🔗 Correlation test
x = np.array([1, 2, 3, 4, 5])
y = np.array([2, 4, 5, 4, 5])
correlation, p_value = stats.pearsonr(x, y)  # 🔗 Pearson correlation
print(f"Correlation 🔗: {correlation:.4f}, P-value 📊: {p_value:.4f}")
```

### 🧪 Scientific Computations

```python
from scipy import optimize, integrate, interpolate  # 🧪 Scientific tools

# 📐 Optimization (Finding minimum/maximum)
def objective_function(x):
    return x**2 + 5*x + 6  # 📐 Function to minimize

result = optimize.minimize(objective_function, x0=0)  # 🎯 Start from x=0
print("Minimum value 🎯:", result.fun)
print("At position 📍:", result.x)

# 🔍 Root finding (solve equations)
def equation(x):
    return x**3 - 2*x - 5  # 🔍 Find where this equals zero

root = optimize.fsolve(equation, x0=2)  # 🎯 Start from x=2
print("Root 🎯:", root)

# ∫ Integration (area under curve)
def integrand(x):
    return x**2  # ∫ Integrate x²

result, error = integrate.quad(integrand, 0, 1)  # ∫₀¹ x² dx
print(f"Integral ∫: {result:.4f}")

# 📈 Interpolation (fill gaps in data)
x_points = np.array([0, 1, 2, 3, 4])
y_points = np.array([0, 1, 4, 9, 16])
interpolator = interpolate.interp1d(x_points, y_points, kind='cubic')  # 📈 Smooth curve

x_new = np.linspace(0, 4, 20)  # 📊 More points
y_new = interpolator(x_new)  # 📈 Interpolated values
print("Interpolated values 📈:", y_new[:5])

# 🌊 Signal processing
from scipy import signal
t = np.linspace(0, 1, 1000)
noisy_signal = np.sin(2 * np.pi * 5 * t) + np.random.normal(0, 0.1, 1000)  # 🌊 Noisy sine wave
filtered = signal.medfilt(noisy_signal, kernel_size=5)  # 🔧 Median filter
print("Signal filtered 🔧 ✅")
```

**💡 Linear Explanation:** SciPy builds on NumPy to provide advanced scientific tools. It includes statistical tests (t-tests, correlation), optimization (finding min/max), integration (calculating areas), and signal processing - all essential for scientific research.

---

## 📈 3. Statsmodels – Statistical Modeling 📉 & Analysis

**Goal:** Build and analyze statistical models for data relationships.

### 📉 Linear Regression (Predicting Values)

```python
import statsmodels.api as sm  # 📈 Import statsmodels
import pandas as pd

# 📊 Create sample data
data = pd.DataFrame({
    'hours_studied': [1, 2, 3, 4, 5, 6, 7, 8],  # 📚 Independent variable (X)
    'test_score': [50, 55, 60, 65, 70, 75, 80, 85]  # 🎯 Dependent variable (Y)
})

# 🔢 Prepare variables
X = data['hours_studied']  # 📊 Predictor
y = data['test_score']  # 🎯 Target
X = sm.add_constant(X)  # ➕ Add intercept (y = a + bX)

# 🏗️ Build the model
model = sm.OLS(y, X)  # 📐 Ordinary Least Squares
results = model.fit()  # 🔧 Fit the model

# 📊 View summary statistics
print(results.summary())
# Shows: R², coefficients, p-values, confidence intervals

# 🎯 Make predictions
new_hours = sm.add_constant([9, 10])  # 📚 New data points
predictions = results.predict(new_hours)  # 🔮 Predict scores
print("Predictions 🔮:", predictions)

# 📊 Extract key metrics
print("R-squared 📊:", results.rsquared)  # How well model fits (0-1)
print("Coefficients 🔢:", results.params)  # Slope and intercept
print("P-values 📊:", results.pvalues)  # Statistical significance
```

### 📊 Time Series Analysis

```python
from statsmodels.tsa.seasonal import seasonal_decompose  # 📈 Time series tools
from statsmodels.tsa.stattools import adfuller  # 🧪 Statistical tests

# 📅 Create time series data
dates = pd.date_range('2023-01-01', periods=100, freq='D')
values = np.sin(np.linspace(0, 10, 100)) + np.random.normal(0, 0.1, 100)  # 🌊 Seasonal pattern
ts_data = pd.Series(values, index=dates)

# 🔍 Decompose time series (Trend + Seasonal + Residual)
decomposition = seasonal_decompose(ts_data, model='additive', period=10)
trend = decomposition.trend  # 📈 Long-term pattern
seasonal = decomposition.seasonal  # 🔄 Repeating pattern
residual = decomposition.resid  # 📊 Random noise

print("Trend component 📈 extracted ✅")
print("Seasonal component 🔄 extracted ✅")

# 🧪 Test for stationarity (constant mean/variance over time)
result = adfuller(ts_data.dropna())
print(f"ADF Statistic 🧪: {result[0]:.4f}")
print(f"P-value 📊: {result[1]:.4f}")
# If p-value < 0.05 ✅ → Data is stationary
# If p-value > 0.05 ❌ → Data is non-stationary
```

### 📊 Logistic Regression (Classification)

```python
# 📊 Binary classification example
data = pd.DataFrame({
    'age': [22, 25, 47, 52, 23, 35, 40, 60],  # 👤 Age
    'purchased': [0, 0, 1, 1, 0, 0, 1, 1]  # 🛒 Did they buy? (0=No, 1=Yes)
})

# 🔢 Prepare variables
X = sm.add_constant(data['age'])  # 📊 Predictor
y = data['purchased']  # 🎯 Target

# 🏗️ Build logistic regression model
logit_model = sm.Logit(y, X)
logit_results = logit_model.fit()  # 🔧 Fit model

# 📊 View results
print(logit_results.summary())

# 🔮 Predict probability of purchase
new_age = sm.add_constant([30, 45, 55])
probabilities = logit_results.predict(new_age)
print("Purchase probabilities 🔮:", probabilities)
# Values between 0-1 (0% to 100% chance)
```

**💡 Linear Explanation:** Statsmodels helps you build statistical models to understand relationships in data. Linear regression predicts continuous values, logistic regression predicts categories (yes/no), and time series analysis finds patterns over time.

---

## 🤖 4. Sklearn Basics – Datasets 📦 & Preprocessing 🛠️

**Goal:** Introduction to machine learning with built-in datasets and data preparation.

### 📦 Loading Built-in Datasets

```python
from sklearn import datasets  # 📦 Import datasets module
import pandas as pd

# 🌸 Load Iris dataset (flower classification)
iris = datasets.load_iris()
print("Iris dataset 🌸 loaded")
print("Features 📊:", iris.feature_names)
print("Target classes 🎯:", iris.target_names)
print("Shape 📐:", iris.data.shape)

# 🐼 Convert to DataFrame
iris_df = pd.DataFrame(iris.data, columns=iris.feature_names)
iris_df['species'] = iris.target
print(iris_df.head())

# 🏠 Load Boston Housing dataset (price prediction)
# Note: This dataset is deprecated, using California Housing instead
california = datasets.fetch_california_housing()
print("California Housing 🏠 loaded")

# 🍷 Load Wine dataset (wine classification)
wine = datasets.load_wine()
print("Wine dataset 🍷 loaded")

# 🔢 Load Digits dataset (handwritten numbers)
digits = datasets.load_digits()
print("Digits dataset 🔢 loaded")
print("Images shape 📊:", digits.images.shape)  # 1797 images, 8x8 pixels

# 🎲 Generate synthetic dataset
X, y = datasets.make_classification(
    n_samples=100,  # 📊 100 samples
    n_features=4,  # 🔢 4 features
    n_classes=2,  # 🎯 2 classes
    random_state=42  # 🎲 Reproducible
)
print("Synthetic dataset 🎲 created")
```

### 🛠️ Data Preprocessing (Preparing Data for ML)

```python
from sklearn.preprocessing import StandardScaler, MinMaxScaler, LabelEncoder, OneHotEncoder
from sklearn.model_selection import train_test_split
from sklearn.impute import SimpleImputer

# 📊 Sample data
data = pd.DataFrame({
    'age': [25, 30, 35, 40, 45, None, 55],  # ❓ Has missing value
    'salary': [30000, 40000, 50000, 60000, 70000, 80000, 90000],  # 💰
    'city': ['NY', 'LA', 'NY', 'LA', 'SF', 'SF', 'NY']  # 🏙️ Categorical
})

# 🔧 Handle missing values
imputer = SimpleImputer(strategy='mean')  # 📊 Fill with average
data['age'] = imputer.fit_transform(data[['age']])
print("Missing values filled 🔧 ✅")

# 📏 Standardization (mean=0, std=1)
scaler = StandardScaler()
data['age_scaled'] = scaler.fit_transform(data[['age']])
data['salary_scaled'] = scaler.fit_transform(data[['salary']])
print("Features standardized 📏 ✅")
# Good for: Algorithms sensitive to scale (SVM, KNN, Neural Networks)

# 📊 Normalization (scale to 0-1 range)
normalizer = MinMaxScaler()
data['age_normalized'] = normalizer.fit_transform(data[['age']])
print("Features normalized 📊 ✅")

# 🏷️ Label Encoding (convert categories to numbers)
label_encoder = LabelEncoder()
data['city_encoded'] = label_encoder.fit_transform(data['city'])
print("Labels encoded 🏷️ ✅")
# NY → 0, LA → 1, SF → 2

# 🔢 One-Hot Encoding (create binary columns)
data_encoded = pd.get_dummies(data, columns=['city'], prefix='city')
print("One-hot encoding 🔢 ✅")
# Creates: city_NY, city_LA, city_SF (1 or 0)

# ✂️ Train-Test Split (separate data for training and testing)
X = iris.data  # 📊 Features
y = iris.target  # 🎯 Labels
X_train, X_test, y_train, y_test = train_test_split(
    X, y, 
    test_size=0.2,  # 📊 20% for testing, 80% for training
    random_state=42  # 🎲 Reproducible
)
print(f"Training set 📚: {X_train.shape}")
print(f"Testing set 🧪: {X_test.shape}")
```

### 🔍 Feature Engineering

```python
from sklearn.preprocessing import PolynomialFeatures
from sklearn.feature_selection import SelectKBest, chi2

# 🔢 Polynomial Features (create interaction terms)
poly = PolynomialFeatures(degree=2, include_bias=False)
X_sample = np.array([[1, 2], [3, 4]])
X_poly = poly.fit_transform(X_sample)
print("Original features 📊:", X_sample.shape)
print("Polynomial features 🔢:", X_poly.shape)
# Adds: x₁, x₂, x₁², x₁x₂, x₂²

# 🎯 Feature Selection (keep only best features)
selector = SelectKBest(chi2, k=2)  # 🎯 Select top 2 features
X_selected = selector.fit_transform(iris.data, iris.target)
print("Features selected 🎯:", X_selected.shape)
selected_indices = selector.get_support(indices=True)
print("Best feature indices 🏆:", selected_indices)
```

**💡 Linear Explanation:** Sklearn preprocessing prepares raw data for machine learning. We handle missing values, scale features to similar ranges, convert categories to numbers, split data into training/testing sets, and select the most important features.

---

## 🎯 Complete Integration Example 🚀

```python
import numpy as np
import pandas as pd
from scipy import stats
from sklearn import datasets
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
import statsmodels.api as sm

# 📦 Step 1: Load dataset
iris = datasets.load_iris()
data = pd.DataFrame(iris.data, columns=iris.feature_names)
data['species'] = iris.target
print("Dataset loaded 📦 ✅")

# 🔢 Step 2: NumPy operations (vectorization)
sepal_lengths = data['sepal length (cm)'].values
# ⚡ Fast vectorized calculation
normalized_lengths = (sepal_lengths - np.mean(sepal_lengths)) / np.std(sepal_lengths)
print("NumPy vectorization ⚡ completed")

# 📊 Step 3: SciPy statistics
mean = np.mean(sepal_lengths)
median = np.median(sepal_lengths)
mode = stats.mode(sepal_lengths)
print(f"Mean 📈: {mean:.2f}, Median 📊: {median:.2f}")

# 🧪 Normality test
statistic, p_value = stats.shapiro(sepal_lengths)
print(f"Normality test 🧪 p-value: {p_value:.4f}")

# 📈 Step 4: Statsmodels regression
X = data[['sepal width (cm)']]
y = data['sepal length (cm)']
X = sm.add_constant(X)
model = sm.OLS(y, X).fit()
print(f"R-squared 📊: {model.rsquared:.4f}")

# 🛠️ Step 5: Sklearn preprocessing
scaler = StandardScaler()
X_features = data.drop('species', axis=1)
X_scaled = scaler.fit_transform(X_features)
print("Features scaled 🛠️ ✅")

# ✂️ Step 6: Train-test split
X_train, X_test, y_train, y_test = train_test_split(
    X_scaled, data['species'], 
    test_size=0.2, 
    random_state=42
)
print(f"Data split ✂️: Train={X_train.shape}, Test={X_test.shape}")

print("\n🎉 Complete integration successful! 🚀")
```

---

## 🎓 What We Learned Today

• **🔢 NumPy Advanced Techniques:** Master broadcasting 📡 for operations on different shapes, vectorization ⚡ for 100x speed boost avoiding loops, and matrix operations 🧮 for linear algebra (multiplication, inverse, eigenvalues)

• **🔬 SciPy Scientific Computing:** Use statistical functions 📊 (distributions, t-tests, correlation), optimization 🎯 (find min/max), integration ∫ (calculate areas), and signal processing 🌊 for real-world science

• **📈 Statsmodels Statistical Modeling:** Build regression models 📉 to predict values and understand relationships, perform time series analysis 📅 (decomposition, stationarity tests), and logistic regression 🎯 for classification

• **🤖 Sklearn Machine Learning Prep:** Load built-in datasets 📦 (Iris 🌸, Wine 🍷, Digits 🔢), preprocess data 🛠️ (scaling, encoding, imputation), split data ✂️ for training/testing, and engineer features 🔧 for better model performance

• **🔗 Library Integration Power:** Combine NumPy 🔢, SciPy 🔬, Statsmodels 📈, and Sklearn 🤖 in one workflow for complete data science pipelines from raw data to statistical analysis to machine learning preparation 🚀