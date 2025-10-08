class Student:
    Name=None
    Marks=[]
    def __init__(self, Name, Marks):
        self.Name=Name
        self.Marks=Marks
    
    def AvgMarks(self):
       return sum(self.Marks)/len(self.Marks)
        
if __name__=='__main__':
    s1=Student("Atul",[90,89,94,94,90])
    print(s1.AvgMarks())
