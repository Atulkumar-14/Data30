# Import necessary libraries
import pandas as pd
import seaborn as sns

# Load a sample dataset
data = sns.load_dataset('titanic')  # Load Titanic dataset

# Show all available seaborn datasets
# dataset_names = sns.get_dataset_names()  # Uncomment to list all built-in datasets

# Get all rows where the 'embarked' column is null
rows_with_null_embarked = data[data['embarked'].isnull()]

# Select only non-null rows (no NaN in any column)
fully_complete_rows = data[data.notnull().all(axis=1)]

# Select specific columns: 'who', 'age', and 'sex'
selected_columns = data[['who', 'age', 'sex']]

# Calculate percentage of missing values per column and add a '%' sign, rounded to 2 decimals
percent_null = (data.isnull().sum() / len(data)) * 100  # Calculate percent missing
percent_null_with_sign = percent_null.round(2).astype(str) + '%'  # Format with percent sign

# Drop all rows that contain any missing value
dropped_na_rows = data.dropna(axis=0, how='any')  # Drops rows with any null

# Fill missing values with a constant (example: fill with 'Unknown' for embarked column)
filled_embarked = data['embarked'].fillna('Unknown')  # Fill NaN in 'embarked' with 'Unknown'

# Fill missing numeric values in 'age' column with the mean age
filled_age = data['age'].fillna(data['age'].mean())  # Fill NaN in 'age' with mean of 'age'

# (No print statements. Use these variables separately wherever needed.)
