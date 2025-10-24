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
