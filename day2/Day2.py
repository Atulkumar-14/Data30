error=True
while error:
    try:
        num=int(input("Enter the Number"))
        error=False
    except ValueError:
        error=True
        print("Invalid Input")

for i in range(1,11):
    print(f"{num} x {i} = {num*i}")