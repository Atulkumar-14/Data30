import numpy as np
from scipy import stats

# Sample data: heights of two groups (in cm)
group1 = np.array([170, 165, 180, 175, 168])
group2 = np.array([160, 162, 158, 165, 161])

# Perform independent two-sample t-test
t_stat, p_value = stats.ttest_ind(group1, group2)

print("T-statistic:", t_stat)
print("P-value:", p_value)
if p_value < 0.05:
    print("Reject the null hypothesis: The means are significantly different.")
else:
    print("Fail to reject the null hypothesis: The means are not significantly different.")

# Sample data: study hours vs exam scores
study_hours = np.array([2, 4, 6, 8, 10])
exam_scores = np.array([50, 55, 65, 70, 75])

# Pearson correlation
corr_coef, p_value = stats.pearsonr(study_hours, exam_scores)

print("Pearson correlation coefficient:", corr_coef)
print("P-value:", p_value)
if p_value < 0.05:
    print("Reject the null hypothesis: There is a significant correlation.")
else:
    print("Fail to reject the null hypothesis: There is no significant correlation.")
