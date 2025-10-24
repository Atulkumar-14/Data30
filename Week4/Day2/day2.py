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

