import matplotlib.pyplot as plt
import seaborn as sns
help(sns)
sns.get_dataset_names()
data=sns.load_dataset('iris')
print(data)
data.head(12)
data.info()
data.describe()
data['species'].value_counts()
data['species'].value_counts().plot(kind='bar')
data.columns
for col in data.columns:
    if data[col].isnull().any():
        print(f"Column '{col}' has missing values")
    else:
        print(f"Column '{col}' has no  missing values")
    
    
data.isnull().sum().sum() # count total missing values
sns.pairplot(data, hue='species', diag_kind='kde')  
plt.suptitle('Iris Dataset Relationships 🌸', y=1.02)
plt.show()
