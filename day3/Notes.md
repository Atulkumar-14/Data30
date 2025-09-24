# 🐍 Python Data Structures Complete Guide 📊

## ═══════════════════════════════════════════════════════════════════════════════════════════

> 💡 **Linear Explanation**: Think of data structures as different containers 📦 - lists are flexible boxes, tuples are sealed packages, sets are unique item collections, and dictionaries are labeled filing cabinets!

## ┌─────────────────────────────────────────────────────────────────────────────────────────┐
## │ 1️⃣ 📋 Lists - Flexible Ordered Collections 🔄                                        │
## └─────────────────────────────────────────────────────────────────────────────────────────┘

Lists are **mutable** 🔄, **ordered** 📏, and can store **duplicate** values.

### 💻 **Creating & Accessing Lists:**

```python
# 📋 Creating lists
fruits = ['apple', 'banana', 'cherry']  # 🍎 String list
numbers = [1, 2, 3, 4, 5]              # 🔢 Integer list
mixed = [1, 'hello', 3.14, True]       # 🎯 Mixed types
empty = []                              # 📦 Empty list

print(f"🍎 Fruits: {fruits}")
print(f"🔢 Numbers: {numbers}")

# 📍 Indexing (access elements)
print(f"First fruit: {fruits[0]}")     # apple
print(f"Last number: {numbers[-1]}")   # 5

# ✂️ Slicing (extract portions)
print(f"First 2 fruits: {fruits[:2]}")      # ['apple', 'banana']
print(f"Last 2 numbers: {numbers[-2:]}")    # [4, 5]
print(f"Every 2nd item: {numbers[::2]}")    # [1, 3, 5]
```

### 💻 **Essential List Methods:**

```python
# 📝 Working with a sample list
colors = ['red', 'green', 'blue']

# ➕ Adding elements
colors.append('yellow')           # 📎 Add to end
colors.insert(1, 'orange')       # 📍 Insert at position
colors.extend(['purple', 'pink']) # 📋 Add multiple items

print(f"After additions: {colors}")
# ['red', 'orange', 'green', 'blue', 'yellow', 'purple', 'pink']

# ❌ Removing elements
colors.remove('orange')    # 🗑️ Remove first occurrence
popped = colors.pop()      # 📤 Remove and return last item
popped_idx = colors.pop(1) # 📤 Remove at specific index
del colors[0]              # 🗑️ Delete at index

print(f"After removals: {colors}")
print(f"Popped items: {popped}, {popped_idx}")

# 🔄 List operations
numbers = [3, 1, 4, 1, 5, 9, 2, 6]
print(f"Original: {numbers}")

numbers.sort()             # 📈 Sort in place (ascending)
print(f"Sorted: {numbers}")

numbers.reverse()          # 🔄 Reverse in place
print(f"Reversed: {numbers}")

# 🔍 Finding elements
position = numbers.index(5)        # 📍 Find index of first occurrence
count = numbers.count(1)           # 🔢 Count occurrences
print(f"Position of 5: {position}, Count of 1: {count}")
```

### 💻 **List Comprehensions (Advanced):**

```python
# 🚀 List comprehensions - create lists efficiently
squares = [x**2 for x in range(5)]           # [0, 1, 4, 9, 16]
evens = [x for x in range(10) if x % 2 == 0] # [0, 2, 4, 6, 8]

print(f"Squares: {squares}")
print(f"Even numbers: {evens}")

# 🎯 Practical example: filter and transform
prices = [19.99, 25.50, 12.75, 30.00]
discounted = [price * 0.9 for price in prices if price > 15]
print(f"Discounted prices (>$15): {discounted}")
```

## ═══════════════════════════════════════════════════════════════════════════════════════════
## 2️⃣ 📦 Tuples - Immutable Ordered Collections 🔒

Tuples are **immutable** 🔒, **ordered** 📏, and can store **duplicate** values.

### 💻 **Creating & Using Tuples:**

```python
# 📦 Creating tuples
coordinates = (3, 4)              # 📍 2D point
rgb_color = (255, 128, 0)        # 🎨 RGB values
person = ('Alice', 25, 'Engineer') # 👤 Person info
single = (42,)                    # ⚠️ Single element (note comma!)
empty_tuple = ()                  # 📦 Empty tuple

print(f"📍 Coordinates: {coordinates}")
print(f"👤 Person: {person}")

# 📍 Accessing tuple elements (same as lists)
print(f"X coordinate: {coordinates[0]}")  # 3
print(f"Person name: {person[0]}")        # Alice
print(f"RGB red: {rgb_color[0]}")         # 255

# ✂️ Slicing works too
print(f"RGB green & blue: {rgb_color[1:]}")  # (128, 0)
```

### 💻 **Tuple Unpacking (Very Powerful!):**

```python
# 🎯 Tuple unpacking - extract values into variables
point = (10, 20)
x, y = point  # 📦 Unpack into separate variables
print(f"X: {x}, Y: {y}")

# 👤 Unpacking person info
person_info = ('Bob', 30, 'Designer', 'New York')
name, age, job, city = person_info
print(f"Name: {name}, Age: {age}, Job: {job}, City: {city}")

# 🔄 Variable swapping using tuples
a, b = 5, 10
print(f"Before swap: a={a}, b={b}")
a, b = b, a  # 🔄 Elegant swap!
print(f"After swap: a={a}, b={b}")

# 📊 Function returning multiple values
def get_stats(numbers):
    return min(numbers), max(numbers), sum(numbers)

data = [1, 2, 3, 4, 5]
minimum, maximum, total = get_stats(data)  # 📦 Unpack return values
print(f"Min: {minimum}, Max: {maximum}, Sum: {total}")
```

### 💻 **When to Use Tuples:**

```python
# 🎯 Tuples are perfect for:

# 1. 📍 Coordinates and points
locations = [(0, 0), (1, 1), (2, 4), (3, 9)]  # List of coordinate tuples

# 2. 🗃️ Database-like records
employees = [
    ('Alice', 'Engineering', 75000),
    ('Bob', 'Marketing', 65000),
    ('Charlie', 'Sales', 70000)
]

# 3. 🎨 RGB/RGBA colors
colors = {
    'red': (255, 0, 0),
    'green': (0, 255, 0),
    'blue': (0, 0, 255),
    'purple': (128, 0, 128)
}

# 4. 🔑 Dictionary keys (tuples are hashable, lists are not!)
chess_board = {
    (0, 0): 'Rook',
    (0, 1): 'Knight', 
    (0, 2): 'Bishop'
}

print(f"Piece at (0,1): {chess_board[(0, 1)]}")
```

## ┌─────────────────────────────────────────────────────────────────────────────────────────┐
## │ 3️⃣ 🎯 Sets - Unique Item Collections ✨                                              │
## └─────────────────────────────────────────────────────────────────────────────────────────┘

Sets store **unique** ✨ items, are **unordered** 🔄, and are **mutable** 🔧.

### 💻 **Creating & Basic Operations:**

```python
# 🎯 Creating sets
fruits = {'apple', 'banana', 'cherry'}          # 🍎 Set literal
numbers = set([1, 2, 3, 3, 4, 4, 5])           # 🔢 From list (duplicates removed)
empty_set = set()                                # ⚠️ Empty set (not {})

print(f"🍎 Fruits: {fruits}")
print(f"🔢 Numbers: {numbers}")  # {1, 2, 3, 4, 5} - duplicates gone!

# ➕ Adding elements
fruits.add('orange')           # 📎 Add single item
fruits.update(['grape', 'kiwi'])  # 📋 Add multiple items
print(f"After additions: {fruits}")

# ❌ Removing elements
fruits.remove('banana')        # 🗑️ Remove (raises error if not found)
fruits.discard('mango')        # 🗑️ Remove (no error if not found)
popped_item = fruits.pop()     # 📤 Remove and return arbitrary item
print(f"After removals: {fruits}")
print(f"Popped: {popped_item}")

# 🔍 Membership testing (very fast!)
print(f"Is 'apple' in fruits? {'apple' in fruits}")
print(f"Is 'banana' in fruits? {'banana' in fruits}")
```

### 💻 **Powerful Set Operations:**

```python
# 🧮 Set theory operations
set_a = {1, 2, 3, 4, 5}
set_b = {4, 5, 6, 7, 8}

print(f"Set A: {set_a}")
print(f"Set B: {set_b}")

# 🔗 Union (all elements from both sets)
union = set_a | set_b  # or set_a.union(set_b)
print(f"Union (A | B): {union}")  # {1, 2, 3, 4, 5, 6, 7, 8}

# 🎯 Intersection (common elements)
intersection = set_a & set_b  # or set_a.intersection(set_b)
print(f"Intersection (A & B): {intersection}")  # {4, 5}

# ➖ Difference (elements in A but not B)
difference = set_a - set_b  # or set_a.difference(set_b)
print(f"Difference (A - B): {difference}")  # {1, 2, 3}

# 🔄 Symmetric difference (elements in either A or B, but not both)
sym_diff = set_a ^ set_b  # or set_a.symmetric_difference(set_b)
print(f"Symmetric difference (A ^ B): {sym_diff}")  # {1, 2, 3, 6, 7, 8}

# 🎯 Practical example: Remove duplicates from list
numbers_with_dupes = [1, 2, 2, 3, 3, 3, 4, 4, 5]
unique_numbers = list(set(numbers_with_dupes))
print(f"Original: {numbers_with_dupes}")
print(f"Unique: {unique_numbers}")
```

### 💻 **Real-World Set Applications:**

```python
# 🌍 Practical set usage examples

# 1. 📚 Finding common interests
alice_hobbies = {'reading', 'swimming', 'cooking', 'gaming'}
bob_hobbies = {'gaming', 'cooking', 'hiking', 'photography'}

common_hobbies = alice_hobbies & bob_hobbies
print(f"Alice & Bob's common hobbies: {common_hobbies}")

# 2. 📧 Email validation (remove duplicates)
email_list = ['user1@email.com', 'user2@email.com', 'user1@email.com', 'user3@email.com']
unique_emails = list(set(email_list))
print(f"Unique emails: {unique_emails}")

# 3. 🏷️ Tag management
post1_tags = {'python', 'programming', 'tutorial', 'beginner'}
post2_tags = {'python', 'advanced', 'tutorial', 'datastructures'}

all_tags = post1_tags | post2_tags          # All unique tags
python_posts = post1_tags & post2_tags      # Common tags
beginner_only = post1_tags - post2_tags     # Tags unique to post1

print(f"All tags: {all_tags}")
print(f"Common tags: {python_posts}")
print(f"Beginner-only tags: {beginner_only}")
```

## ═══════════════════════════════════════════════════════════════════════════════════════════
## 4️⃣ 🗂️ Dictionaries - Key-Value Mappings 🔑

Dictionaries store **key-value pairs** 🔑, are **mutable** 🔧, and **ordered** 📏 (Python 3.7+).

### 💻 **Creating & Accessing Dictionaries:**

```python
# 🗂️ Creating dictionaries
student = {
    'name': 'Alice',
    'age': 20,
    'grade': 'A',
    'courses': ['Math', 'Physics', 'Chemistry']
}

# 🔑 Different key types
mixed_keys = {
    'string_key': 'value1',
    42: 'numeric key',
    (1, 2): 'tuple key',
    True: 'boolean key'
}

# 📦 Empty dictionary
empty_dict = {}  # or dict()

print(f"👤 Student: {student}")

# 📍 Accessing values
print(f"Student name: {student['name']}")           # Direct access
print(f"Student age: {student.get('age')}")         # Safe access
print(f"GPA: {student.get('gpa', 'Not found')}")    # Default value

# ✏️ Modifying dictionaries
student['age'] = 21                    # Update existing key
student['gpa'] = 3.8                   # Add new key
student['courses'].append('Biology')   # Modify nested list

print(f"Updated student: {student}")
```

### 💻 **Essential Dictionary Methods:**

```python
# 🗂️ Working with dictionary data
inventory = {
    'apples': 50,
    'bananas': 30,
    'oranges': 25,
    'grapes': 40
}

print(f"🍎 Inventory: {inventory}")

# 🔑 Getting keys, values, and items
keys = list(inventory.keys())          # ['apples', 'bananas', 'oranges', 'grapes']
values = list(inventory.values())      # [50, 30, 25, 40]
items = list(inventory.items())        # [('apples', 50), ('bananas', 30), ...]

print(f"🔑 Keys: {keys}")
print(f"📊 Values: {values}")
print(f"🎯 Items: {items[:2]}...")  # First 2 items

# 🔄 Iterating through dictionaries
print("\n📋 Inventory report:")
for fruit, quantity in inventory.items():
    print(f"  {fruit}: {quantity} units")

# 🔄 Different iteration styles
print("\n🔑 Just keys:")
for key in inventory:  # Default iteration over keys
    print(f"  {key}")

print("\n📊 Just values:")
for value in inventory.values():
    print(f"  {value} units")

# 🔍 Dictionary operations
total_fruits = sum(inventory.values())
most_stocked = max(inventory, key=inventory.get)
print(f"\n📊 Total fruits: {total_fruits}")
print(f"🏆 Most stocked: {most_stocked} ({inventory[most_stocked]} units)")
```

### 💻 **Advanced Dictionary Techniques:**

```python
# 🚀 Dictionary comprehensions
squares = {x: x**2 for x in range(5)}        # {0: 0, 1: 1, 2: 4, 3: 9, 4: 16}
filtered = {k: v for k, v in squares.items() if v > 5}  # {3: 9, 4: 16}

print(f"🔢 Squares: {squares}")
print(f"🔍 Filtered (>5): {filtered}")

# 🔄 Merging dictionaries (Python 3.9+)
dict1 = {'a': 1, 'b': 2}
dict2 = {'c': 3, 'd': 4}
merged = dict1 | dict2  # or {**dict1, **dict2}
print(f"🔗 Merged: {merged}")

# 🎯 Nested dictionaries (like JSON data)
company = {
    'name': 'TechCorp',
    'employees': {
        'engineering': [
            {'name': 'Alice', 'salary': 75000},
            {'name': 'Bob', 'salary': 80000}
        ],
        'marketing': [
            {'name': 'Charlie', 'salary': 65000}
        ]
    },
    'location': 'San Francisco'
}

# 📍 Accessing nested data
alice_salary = company['employees']['engineering'][0]['salary']
print(f"💰 Alice's salary: ${alice_salary:,}")

# 🔄 Safe nested access
marketing_count = len(company.get('employees', {}).get('marketing', []))
print(f"👥 Marketing team size: {marketing_count}")

# 🗂️ Dictionary as a simple database
users_db = {
    'user123': {
        'username': 'alice_codes',
        'email': 'alice@example.com',
        'posts': 25,
        'followers': 150
    },
    'user456': {
        'username': 'bob_designs',
        'email': 'bob@example.com', 
        'posts': 42,
        'followers': 300
    }
}

# 🔍 Query the "database"
def find_user_by_username(username):
    for user_id, user_data in users_db.items():
        if user_data['username'] == username:
            return user_id, user_data
    return None, None

user_id, user_info = find_user_by_username('alice_codes')
if user_info:
    print(f"👤 Found user {user_id}: {user_info}")
```

---
---

# 📚 Topic Summary: What We Learned 🎓

## 🎯 **Key Learning Points** 📊

• 📋 **Lists - Flexible Arrays**: Mutable, ordered collections supporting indexing, slicing, and methods like append(), remove(), sort() for dynamic data storage and manipulation in algorithms and data processing

• 📦 **Tuples - Immutable Records**: Fixed, ordered collections perfect for coordinates, database records, and function returns, featuring powerful unpacking for elegant variable assignment and data exchange

• 🎯 **Sets - Unique Collections**: Unordered collections eliminating duplicates with fast membership testing and mathematical operations (union, intersection, difference) ideal for data deduplication and set theory applications

• 🗂️ **Dictionaries - Key-Value Mapping**: Flexible, ordered mappings using keys() values() items() and get() methods, essential for data structures, configuration management, and representing real-world relationships in applications