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