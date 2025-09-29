import numpy as np
matrix=np.arange(9).reshape(3,3)
print(matrix.shape)
print(matrix.size)
print(matrix.ndim)
randnum=np.random.normal(size=100)
print(randnum)
print(np.mean(randnum))
print(np.std(randnum))