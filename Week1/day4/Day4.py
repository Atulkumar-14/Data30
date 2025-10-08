import math
def prime(n):
    if n<=1:
        return False
    if n<3:
        return True
    i=2 
    end=math.isqrt(n)+1
    while i<end:
        if n%i==0:
            return False
        i+=1
    return True

print(prime(17))

try:
    with open("prime.txt",'w') as f:
        f.write("Prime Numbers from 1 to 100 list are below\n ")
except FileNotFoundError:
    f.close()

for i in range(1,100):
    if prime(i):
        with open("prime.txt",'a') as f:

            f.write(str(i)+"  ")
