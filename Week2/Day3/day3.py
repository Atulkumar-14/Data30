import pandas as pd
import matplotlib.pyplot as plt
with open('sales.csv','w') as f:
    f.write("""Month,Sales
    January,12000
    February,13500
    March,15000
    April,16500
    May,17200
    June,18000
    July,19000
    August,21000
    September,22500
    October,24000
    November,26000
    December,28000
""")
    
data = pd.read_csv('sales.csv')
plt.plot(data['Month'],data['Sales'])
plt.xlabel('Months')
plt.ylabel("Sales")
plt.tight_layout()
plt.show()
