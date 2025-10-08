marks = {
    "Alice": 88,
    "Bob": 76,
    "Charlie": 92,
    "Diana": 85,
    "Ethan": 79,
    "Atul": 95,
    "George": 68,
    "Hannah": 81,
    "Ivan": 74,
    "Julia": 90
}
max_marks=max(marks.values())
reverse_marks={v:k for k,v in marks.items()}
print(reverse_marks[max_marks])