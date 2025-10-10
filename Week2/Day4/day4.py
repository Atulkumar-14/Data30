import seaborn as sns
import matplotlib.pyplot as plt
db =sns.get_dataset_names()
print(db) # show all dataset present in sns as a list
tips=sns.load_dataset('tips')
sns.boxplot(tips,x='day',y='total_bill')
plt.tight_layout()
plt.xlabel('Day')
plt.ylabel("Bills")
plt.title("Day vs Bills vs time")
plt.show()