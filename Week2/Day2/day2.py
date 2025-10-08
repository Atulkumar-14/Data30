import pandas as pd
import numpy as np
df=pd.read_csv('emp.csv')
# print(df)
df['dept'].fillna(method='bfill',inplace=True)
df['salary'].fillna(df.groupby('dept')['salary'].transform('mean'),inplace=True)
avg_salary_by_dept = df.groupby('dept', as_index=False)['salary'].mean()
print(avg_salary_by_dept)