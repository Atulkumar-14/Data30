# 📊 Day 7: NumPy Basics & Operations 🚀

```
╔══════════════════════════════════════════════════════════════════════════════════════════════════╗
║                    🎯 NUMPY MASTERY GUIDE 🔥 - Fast Numerical Computing ⚡                      ║
╚══════════════════════════════════════════════════════════════════════════════════════════════════╝
```

---

## 🌟 1️⃣ What is NumPy? 📚💡

| Feature 🎯 | Description 📝 | Benefit ✨ |
|-----------|---------------|-----------|
| **Speed** ⚡ | C-based arrays 🔧 | 100x faster than Python lists 🏃‍♂️💨 |
| **Memory** 💾 | Efficient storage 📦 | Less RAM usage 🎯 |
| **Functionality** 🛠️ | Math operations 🔢 | Built-in functions 🚀 |

**🔍 Linear Explanation:** NumPy (Numerical Python 🐍) is a powerful library 📚 that provides high-performance multidimensional arrays 📊 and mathematical functions 🧮. Unlike slow Python lists 🐢, NumPy arrays are stored efficiently in memory 💾 and support vectorized operations ⚡, making computations super fast 🚀!

---

## 2️⃣ Installing NumPy 📥💻

```python
# 🔧 Installation command (run in terminal/command prompt)
pip install numpy

# ✅ Import NumPy in your Python script
import numpy as np  # 'np' is standard alias 🏷️
```

**🎯 Why 'np'?** Short alias saves typing ⌨️ and is universally recognized 🌍 in the data science community 👥!

---

## 3️⃣ Creating Arrays 🎨📦

### 📋 Array Creation Methods Comparison Table

| Method 🛠️ | Purpose 🎯 | Example Output 📊 |
|----------|----------|------------------|
| `np.array()` 📝 | From list/tuple ✍️ | `[1, 2, 3]` |
| `np.arange()` 🔢 | Range of values 📏 | `[0, 1, 2, 3, 4]` |
| `np.linspace()` 📐 | Evenly spaced 📊 | `[0.0, 0.5, 1.0]` |
| `np.zeros()` 0️⃣ | All zeros 🕳️ | `[0, 0, 0]` |
| `np.ones()` 1️⃣ | All ones ⚪ | `[1, 1, 1]` |

### 💻 Code Examples with Comments

```python
import numpy as np  # 🔹 Import NumPy library

# 1️⃣ Creating array from Python list 📝
arr1 = np.array([1, 2, 3, 4, 5])  # 🔹 Converts list to NumPy array
print("Array from list:", arr1)  # 🖨️ Output: [1 2 3 4 5]

# 2️⃣ Creating array with arange() 🔢
arr2 = np.arange(0, 10, 2)  # 🔹 Start=0, Stop=10, Step=2
print("Arange array:", arr2)  # 🖨️ Output: [0 2 4 6 8]

# 3️⃣ Creating evenly spaced array 📐
arr3 = np.linspace(0, 1, 5)  # 🔹 5 values between 0 and 1
print("Linspace array:", arr3)  # 🖨️ Output: [0. 0.25 0.5 0.75 1.]

# 4️⃣ Creating array of zeros 0️⃣
arr4 = np.zeros(5)  # 🔹 Creates 5 zeros
print("Zeros array:", arr4)  # 🖨️ Output: [0. 0. 0. 0. 0.]

# 5️⃣ Creating array of ones 1️⃣
arr5 = np.ones(5)  # 🔹 Creates 5 ones
print("Ones array:", arr5)  # 🖨️ Output: [1. 1. 1. 1. 1.]

# 6️⃣ Creating 2D array (matrix) 📊
arr6 = np.array([[1, 2, 3], [4, 5, 6]])  # 🔹 2 rows, 3 columns
print("2D array:\n", arr6)  # 🖨️ Output: [[1 2 3] [4 5 6]]
```

---

## 4️⃣ Array Attributes 📏🔍

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│  🎯 Understanding Array Properties - The DNA 🧬 of NumPy Arrays                 │
└─────────────────────────────────────────────────────────────────────────────────┘
```

### 📊 Attributes Table

| Attribute 🏷️ | Meaning 📖 | Example 💡 |
|-------------|-----------|-----------|
| `shape` 📐 | Dimensions (rows, cols) 📏 | `(2, 3)` = 2 rows, 3 cols |
| `size` 🔢 | Total elements 📊 | `6` elements |
| `ndim` 🎚️ | Number of dimensions 📦 | `2` (2D array) |
| `dtype` 🔤 | Data type 🧮 | `int64`, `float64` |

### 💻 Code Example

```python
import numpy as np  # 🔹 Import NumPy

# 🎨 Create a 2D array
arr = np.array([[1, 2, 3], [4, 5, 6]])  # 🔹 2x3 matrix

# 📏 Shape - dimensions of array
print("Shape:", arr.shape)  # 🖨️ Output: (2, 3) - 2 rows, 3 columns

# 🔢 Size - total number of elements
print("Size:", arr.size)  # 🖨️ Output: 6 (2×3=6 elements)

# 🎚️ Ndim - number of dimensions
print("Dimensions:", arr.ndim)  # 🖨️ Output: 2 (it's a 2D array)

# 🔤 Dtype - data type of elements
print("Data type:", arr.dtype)  # 🖨️ Output: int64 (64-bit integers)
```

**🔍 Linear Explanation:** Array attributes 🏷️ tell us everything about the structure 🏗️ and type 🔤 of our data 📊. Shape 📐 shows dimensions, size 🔢 counts total elements, ndim 🎚️ tells dimensionality (1D, 2D, 3D), and dtype 🔤 reveals the data type stored!

---

## 5️⃣ Indexing & Slicing ✂️🎯

```
═══════════════════════════════════════════════════════════════════════════════════
    🔍 Accessing Elements - Your Data Treasure Hunt 🗺️💎
═══════════════════════════════════════════════════════════════════════════════════
```

### 📊 Indexing Guide

| Operation 🛠️ | Syntax 📝 | Result ✨ |
|-------------|----------|----------|
| Single element 👆 | `arr[0]` | First element 1️⃣ |
| Negative index ⏪ | `arr[-1]` | Last element 🔚 |
| Slice range ✂️ | `arr[1:4]` | Elements 1 to 3 📊 |
| Step slicing 🪜 | `arr[::2]` | Every 2nd element ⏭️ |
| 2D indexing 📐 | `arr[0, 1]` | Row 0, Col 1 🎯 |

### 💻 Code Example

```python
import numpy as np  # 🔹 Import NumPy

# 🎨 Create 1D array
arr = np.array([10, 20, 30, 40, 50])  # 🔹 Simple array with 5 elements

# 1️⃣ Accessing single element by index
print("First element:", arr[0])  # 🖨️ Output: 10 (index starts at 0)

# 2️⃣ Accessing last element using negative index
print("Last element:", arr[-1])  # 🖨️ Output: 50 (negative counts from end)

# 3️⃣ Slicing - get subarray
print("Slice [1:4]:", arr[1:4])  # 🖨️ Output: [20 30 40] (start:stop)

# 4️⃣ Slicing with step
print("Every 2nd element:", arr[::2])  # 🖨️ Output: [10 30 50] (step=2)

# 🎨 Create 2D array
arr2d = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])  # 🔹 3x3 matrix

# 5️⃣ Accessing 2D array element
print("Element at [1,2]:", arr2d[1, 2])  # 🖨️ Output: 6 (row 1, col 2)

# 6️⃣ Slicing rows from 2D array
print("First 2 rows:\n", arr2d[:2, :])  # 🖨️ Output: [[1 2 3] [4 5 6]]
```

---

## 6️⃣ Reshaping Arrays 🔄📦

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│  🎭 Transforming Array Shapes - Same Data, Different Structure 🏗️              │
└─────────────────────────────────────────────────────────────────────────────────┘
```

### 💻 Code Example

```python
import numpy as np  # 🔹 Import NumPy

# 🎨 Create 1D array with 12 elements
arr = np.arange(12)  # 🔹 Creates [0, 1, 2, ..., 11]
print("Original array:", arr)  # 🖨️ Output: [0 1 2 3 4 5 6 7 8 9 10 11]

# 1️⃣ Reshape to 3x4 matrix (3 rows, 4 columns)
reshaped = arr.reshape(3, 4)  # 🔹 Converts to 2D array (3×4=12 elements)
print("Reshaped (3x4):\n", reshaped)
# 🖨️ Output:
# [[ 0  1  2  3]
#  [ 4  5  6  7]
#  [ 8  9 10 11]]

# 2️⃣ Reshape to 2x6 matrix
reshaped2 = arr.reshape(2, 6)  # 🔹 2 rows, 6 columns (2×6=12)
print("Reshaped (2x6):\n", reshaped2)
# 🖨️ Output:
# [[ 0  1  2  3  4  5]
#  [ 6  7  8  9 10 11]]

# 3️⃣ Flatten - convert back to 1D
flattened = reshaped.flatten()  # 🔹 Converts any shape back to 1D
print("Flattened:", flattened)  # 🖨️ Output: [0 1 2 3 4 5 6 7 8 9 10 11]
```

**🔍 Linear Explanation:** Reshaping 🔄 lets you change the structure 🏗️ of your array without changing the data 📊. The total number of elements must stay the same (3×4 = 12 = 2×6) ⚖️. Flatten 📏 always converts any multi-dimensional array back to 1D!

---

## 7️⃣ Mathematical Operations ➕➖✖️➗

```
╔══════════════════════════════════════════════════════════════════════════════════╗
║       🧮 Math Magic - Element-wise Operations & Broadcasting 🎩✨               ║
╚══════════════════════════════════════════════════════════════════════════════════╝
```

### 📊 Operations Overview

| Operation 🛠️ | Symbol 🔣 | Example 💡 | Result ✨ |
|-------------|----------|-----------|----------|
| Addition ➕ | `+` | `[1,2] + [3,4]` | `[4, 6]` |
| Subtraction ➖ | `-` | `[5,6] - [1,2]` | `[4, 4]` |
| Multiplication ✖️ | `*` | `[2,3] * [4,5]` | `[8, 15]` |
| Division ➗ | `/` | `[10,20] / [2,4]` | `[5, 5]` |
| Power 🔋 | `**` | `[2,3] ** 2` | `[4, 9]` |

### 💻 Code Example

```python
import numpy as np  # 🔹 Import NumPy

# 🎨 Create two arrays
arr1 = np.array([1, 2, 3, 4])  # 🔹 First array
arr2 = np.array([10, 20, 30, 40])  # 🔹 Second array

# 1️⃣ Addition (element-wise)
print("Addition:", arr1 + arr2)  # 🖨️ Output: [11 22 33 44] ➕

# 2️⃣ Subtraction (element-wise)
print("Subtraction:", arr2 - arr1)  # 🖨️ Output: [9 18 27 36] ➖

# 3️⃣ Multiplication (element-wise)
print("Multiplication:", arr1 * arr2)  # 🖨️ Output: [10 40 90 160] ✖️

# 4️⃣ Division (element-wise)
print("Division:", arr2 / arr1)  # 🖨️ Output: [10. 10. 10. 10.] ➗

# 5️⃣ Scalar operations (broadcasting 📡)
print("Multiply by scalar:", arr1 * 5)  # 🖨️ Output: [5 10 15 20] 🔢

# 6️⃣ Power operation
print("Square:", arr1 ** 2)  # 🖨️ Output: [1 4 9 16] 🔋

# 7️⃣ Square root
print("Square root:", np.sqrt(arr1))  # 🖨️ Output: [1. 1.41 1.73 2.] √
```

**🔍 Linear Explanation:** NumPy performs operations on corresponding elements 🎯 (element-wise) automatically! Broadcasting 📡 allows operations between arrays and single numbers 🔢, applying the operation to all elements at once ⚡!

---

## 8️⃣ Aggregate Functions 📈📊

```
═══════════════════════════════════════════════════════════════════════════════════
    📊 Statistics & Summary - Understanding Your Data 🔍💡
═══════════════════════════════════════════════════════════════════════════════════
```

### 📋 Functions Table

| Function 🛠️ | Purpose 🎯 | Symbol 🔣 | Returns ✨ |
|------------|----------|----------|-----------|
| `sum()` | Total of all 📊 | ➕ | Single value 🔢 |
| `min()` | Smallest value 📉 | ⬇️ | Minimum 🔻 |
| `max()` | Largest value 📈 | ⬆️ | Maximum 🔺 |
| `mean()` | Average 📊 | 📏 | Mean value 🎯 |
| `std()` | Spread of data 📐 | 📊 | Standard deviation 📏 |

### 💻 Code Example

```python
import numpy as np  # 🔹 Import NumPy

# 🎨 Create array of numbers
arr = np.array([10, 20, 30, 40, 50])  # 🔹 Sample data

# 1️⃣ Sum - add all elements
print("Sum:", np.sum(arr))  # 🖨️ Output: 150 (10+20+30+40+50) ➕

# 2️⃣ Minimum - find smallest value
print("Minimum:", np.min(arr))  # 🖨️ Output: 10 (smallest number) ⬇️

# 3️⃣ Maximum - find largest value
print("Maximum:", np.max(arr))  # 🖨️ Output: 50 (largest number) ⬆️

# 4️⃣ Mean - calculate average
print("Mean:", np.mean(arr))  # 🖨️ Output: 30.0 (150/5) 📏

# 5️⃣ Standard deviation - measure spread
print("Std deviation:", np.std(arr))  # 🖨️ Output: 14.14... (data spread) 📐

# 6️⃣ Median - middle value
print("Median:", np.median(arr))  # 🖨️ Output: 30.0 (middle number) 🎯

# 🎨 2D array example
arr2d = np.array([[1, 2, 3], [4, 5, 6]])  # 🔹 2x3 matrix

# 7️⃣ Sum along axis
print("Sum axis 0:", np.sum(arr2d, axis=0))  # 🖨️ Output: [5 7 9] (column sums) ⬇️
print("Sum axis 1:", np.sum(arr2d, axis=1))  # 🖨️ Output: [6 15] (row sums) ➡️
```

**🔍 Linear Explanation:** Aggregate functions 📊 summarize your entire dataset into single meaningful values 🎯. Axis parameter 🎚️ lets you compute along rows (axis=1 ➡️) or columns (axis=0 ⬇️) in 2D arrays!

---

## 9️⃣ Random Module 🎲🔀

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│  🎲 Generating Random Numbers - Creating Test Data & Simulations 🎰            │
└─────────────────────────────────────────────────────────────────────────────────┘
```

### 📊 Random Functions Table

| Function 🛠️ | Range 📏 | Distribution 📊 | Use Case 🎯 |
|------------|---------|----------------|------------|
| `rand()` | 0 to 1 🔢 | Uniform 📊 | Probabilities 🎲 |
| `randint()` | Custom integers 🔢 | Uniform ⚖️ | Dice rolls 🎲 |
| `normal()` | Any range 📏 | Bell curve 🔔 | Real-world data 🌍 |

### 💻 Code Example

```python
import numpy as np  # 🔹 Import NumPy

# 1️⃣ Random floats between 0 and 1
random_floats = np.random.rand(5)  # 🔹 Creates 5 random decimals
print("Random floats:", random_floats)  # 🖨️ Output: [0.34 0.78 0.12 ...] 🎲

# 2️⃣ Random integers in a range
random_ints = np.random.randint(1, 100, 5)  # 🔹 5 integers between 1-99
print("Random integers:", random_ints)  # 🖨️ Output: [23 67 89 ...] 🎲

# 3️⃣ Random numbers from normal distribution (bell curve)
random_normal = np.random.normal(50, 10, 5)  # 🔹 mean=50, std=10, 5 values
print("Normal distribution:", random_normal)  # 🖨️ Output: [48.3 52.7 ...] 🔔

# 4️⃣ Setting seed for reproducibility
np.random.seed(42)  # 🔹 Same seed = same "random" numbers 🔐
print("Seeded random:", np.random.rand(3))  # 🖨️ Always same output 🔒

# 5️⃣ Random 2D array
random_matrix = np.random.rand(3, 3)  # 🔹 3x3 matrix of random floats
print("Random 2D array:\n", random_matrix)  # 🖨️ Output: 3x3 random values 📊
```

**🔍 Linear Explanation:** Random functions 🎲 generate numbers for testing 🧪, simulations 🎮, and machine learning 🤖. Setting a seed 🌱 makes randomness reproducible 🔄 (same results every time) - crucial for debugging 🐛 and sharing experiments 📤!

---

```
╔══════════════════════════════════════════════════════════════════════════════════╗
║                       🎓 WHAT WE LEARNED TODAY 🧠✨                              ║
╚══════════════════════════════════════════════════════════════════════════════════╝
```

## 📚 Key Takeaways Summary 🎯

• **NumPy Foundation 🏗️**: Mastered the world's fastest numerical computing library ⚡, understanding why it's 100x faster 🚀 than Python lists due to C-based arrays 🔧 and efficient memory storage 💾

• **Array Creation Arsenal 🎨**: Learned 5 powerful methods to build arrays 📦 - from lists (`np.array()` ✍️), sequential ranges (`np.arange()` 🔢), evenly-spaced values (`np.linspace()` 📐), and initialized arrays (`zeros()` 0️⃣, `ones()` 1️⃣) for different use cases 🎯

• **Array Intelligence 🧠**: Explored array attributes 🏷️ that reveal structure (`shape` 📏, `size` 🔢, `ndim` 🎚️, `dtype` 🔤) - essential for debugging 🐛 and understanding data dimensions 📊

• **Data Access Mastery ✂️**: Gained precision control 🎯 over array elements through indexing 👆 (positive/negative), slicing techniques 📏 (`start:stop:step`), and 2D array navigation 🗺️ for extracting exact data needed 💎

• **Shape Transformation 🔄**: Unlocked the power to restructure arrays using `reshape()` 🏗️ (converting 1D↔2D↔3D) and `flatten()` 📏 while preserving total elements ⚖️ - critical for ML pipelines 🤖

• **Vectorized Mathematics 🧮**: Discovered element-wise operations ➕➖✖️➗ that process entire arrays instantly ⚡ without loops 🔁, plus broadcasting 📡 for scalar-array operations 🔢 - the secret to NumPy's speed 🏃‍♂️💨

• **Statistical Insights 📊**: Armed with aggregate functions (`sum` ➕, `min/max` ⬆️⬇️, `mean` 📏, `std` 📐) to summarize datasets 📈 and understand data patterns 🎯, including axis-specific operations for 2D analysis 🧭

• **Random Data Generation 🎲**: Learned to create test data 🧪 and simulations 🎮 using `rand()` (uniform 0-1), `randint()` (custom integers), and `normal()` (bell curve 🔔), with seed control 🌱 for reproducible experiments 🔐