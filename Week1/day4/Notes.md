# 🚀 Day 4: Functions & File Handling 📝🔧

═══════════════════════════════════════════════════════════════════════════════════════

## 🎯 Learning Objectives Today

┌─────────────────────────────────────────────────────────────────────────────────────┐
│ 🎪 **Master the Art of Creating Reusable Code Blocks** 🎭                          │
│ 📂 **Become a File Manipulation Wizard** 🧙‍♂️                                         │  
│ ⚡ **Write Cleaner, More Organized Programs** ✨                                    │
└─────────────────────────────────────────────────────────────────────────────────────┘

═══════════════════════════════════════════════════════════════════════════════════════

## 🔧 Functions: Your Code's Building Blocks 🏗️

### 🎪 What Are Functions? 🤔

Functions 🔧 are like **mini-programs** 📦 inside your main program. Think of them as **recipe cards** 📝 - you write the recipe once, then use it whenever you need it! 🍳

```python
# 🎯 Basic Function Structure
def function_name():  # 🏷️ Function definition
    """🔍 This is what the function does"""
    # 💻 Your code goes here
    return result  # 🎁 Send back the answer
```

### 🎭 Creating Your First Function 🌟

```python
# 🎪 Simple Greeting Function
def say_hello():  # 🎯 Define the function
    """👋 Prints a friendly greeting"""
    print("Hello! Welcome to Python! 🐍✨")

# 🚀 Call the function (use it)
say_hello()  # Output: Hello! Welcome to Python! 🐍✨
```

**📝 Linear Explanation:** A function is defined using the `def` keyword 🔑, followed by the function name and parentheses. The code inside runs when you "call" the function by writing its name with parentheses.

═══════════════════════════════════════════════════════════════════════════════════════

## 🎁 Parameters & Return Values: Making Functions Smart 🧠

### 📥 Passing Information Into Functions (Parameters) 📨

```python
# 🎯 Function with Parameters
def greet_person(name, age):  # 🏷️ Parameters go in parentheses
    """👤 Greets a specific person with their details"""
    print(f"Hi {name}! 👋 You are {age} years old! 🎂")
    
# 🚀 Using the function with arguments
greet_person("Alice", 25)  # 📤 Arguments: actual values you send
# Output: Hi Alice! 👋 You are 25 years old! 🎂

greet_person("Bob", 30)    # 📤 Different arguments, same function
# Output: Hi Bob! 👋 You are 30 years old! 🎂
```

### 🎁 Getting Results Back (Return Values) 📤

```python
# 🧮 Calculator Function
def add_numbers(num1, num2):  # 📥 Takes two numbers
    """➕ Adds two numbers and returns the result"""
    result = num1 + num2  # 🔢 Do the math
    return result         # 🎁 Send back the answer

# 🎯 Using the returned value
answer = add_numbers(5, 3)  # 📦 Store the result
print(f"5 + 3 = {answer}")  # Output: 5 + 3 = 8

# 🚀 Or use it directly
print(f"10 + 15 = {add_numbers(10, 15)}")  # Output: 10 + 15 = 25
```

**📝 Linear Explanation:** Parameters are like **mailboxes** 📮 - they receive information. Return values are like **delivery trucks** 🚚 - they bring results back to whoever called the function.

═══════════════════════════════════════════════════════════════════════════════════════

## 🎛️ Default & Keyword Arguments: Flexible Function Calls ✨

### 🔧 Default Arguments: Setting Backup Values 💾

```python
# 🎪 Function with default values
def create_user(name, age=18, city="Unknown"):  # 🏠 Default values
    """👤 Creates user profile with optional details"""
    print(f"User: {name} 👤")
    print(f"Age: {age} 🎂")
    print(f"City: {city} 🏙️")
    print("─" * 30)

# 🚀 Different ways to call the function
create_user("Alice")                    # 📤 Uses defaults for age & city
create_user("Bob", 25)                  # 📤 Uses default for city only  
create_user("Charlie", 30, "New York")  # 📤 All values provided
```

### 🏷️ Keyword Arguments: Call By Name 📛

```python
# 🎯 Using keyword arguments (order doesn't matter!)
create_user(city="London", name="Diana", age=28)  # 🔄 Mixed order is OK!

# 🎪 Mixed positional and keyword arguments
create_user("Eve", city="Paris")  # 📍 Skip age, specify city
```

**📝 Linear Explanation:** Default arguments are like having **spare batteries** 🔋 - if you don't provide a value, the function uses its backup. Keyword arguments let you **call by name** 🏷️ instead of position.

═══════════════════════════════════════════════════════════════════════════════════════

## ⚡ Lambda Functions: Quick & Tiny Functions 🐣

### 🎯 What Are Lambda Functions? 🤏

Lambda functions are **one-line mini-functions** ⚡ - perfect for simple tasks! Think of them as **sticky notes** 📝 instead of full letters 📄.

```python
# 🔧 Regular function vs Lambda function

# 📄 Traditional way
def square(x):
    """⬜ Squares a number"""
    return x * x

# ⚡ Lambda way (one line!)
square_lambda = lambda x: x * x  # 🎯 Same result, less code!

# 🚀 Both work the same way
print(square(5))        # Output: 25
print(square_lambda(5)) # Output: 25
```

### 🎪 Common Lambda Use Cases 🎭

```python
# 📊 List of numbers
numbers = [1, 2, 3, 4, 5]

# ⚡ Using lambda with map() - apply to all items
squares = list(map(lambda x: x ** 2, numbers))  # 🔢 Square each number
print(f"Squares: {squares}")  # Output: [1, 4, 9, 16, 25]

# 🔍 Using lambda with filter() - keep items that match
evens = list(filter(lambda x: x % 2 == 0, numbers))  # 📊 Keep even numbers
print(f"Even numbers: {evens}")  # Output: [2, 4]

# 📈 Using lambda with sorted() - custom sorting
words = ['apple', 'pie', 'banana', 'cherry']
by_length = sorted(words, key=lambda x: len(x))  # 📏 Sort by length
print(f"By length: {by_length}")  # Output: ['pie', 'apple', 'banana', 'cherry']
```

**📝 Linear Explanation:** Lambda functions are like **shortcuts** 🛣️ - they're perfect when you need a simple function for just one task and don't want to write a full function definition.

═══════════════════════════════════════════════════════════════════════════════════════

## 📂 File Handling: Reading & Writing Files 📝

### 🗃️ What Is File Handling? 📚

File handling lets your program **talk to files** 💬 on your computer - reading information from them 📖 or saving information to them 💾.

### 📖 Reading Files: Getting Information Out 📤

```python
# 📂 Method 1: Basic file reading
def read_file_basic(filename):
    """📖 Reads entire file content"""
    file = open(filename, "r")  # 🔓 Open file for reading
    content = file.read()       # 📝 Read all content
    file.close()                # 🔒 Always close the file!
    return content

# 🛡️ Method 2: Safe file reading (RECOMMENDED!)
def read_file_safe(filename):
    """📖 Safely reads file with automatic cleanup"""
    try:
        with open(filename, "r") as file:  # 🔐 Opens & auto-closes
            content = file.read()           # 📝 Read content
            return content
    except FileNotFoundError:  # 🚨 Handle missing files
        return "File not found! 📁❌"

# 🚀 Using the functions
content = read_file_safe("example.txt")
print(content)
```

### ✏️ Writing Files: Saving Information 📥

```python
# ✍️ Writing to files
def write_to_file(filename, text):
    """💾 Writes text to a file"""
    with open(filename, "w") as file:  # 📝 "w" = write mode
        file.write(text)               # ✍️ Write the content
    print(f"✅ Successfully wrote to {filename}")

# 📝 Example usage
message = """🌟 Welcome to Python File Handling! 🌟
This is line 1 📝
This is line 2 📝
Have a great day! 😊"""

write_to_file("greeting.txt", message)
```

### 📎 Appending to Files: Adding More Content 📊

```python
# ➕ Adding content without overwriting
def append_to_file(filename, new_text):
    """📎 Adds text to the end of existing file"""
    with open(filename, "a") as file:  # 📎 "a" = append mode
        file.write(new_text)           # ➕ Add to the end
    print(f"✅ Successfully appended to {filename}")

# 🚀 Example usage
append_to_file("greeting.txt", "\n🎉 This is a new line!")
```

### 📋 File Mode Reference Chart 📊

┌─────────────────────────────────────────────────────────────────────────────────────┐
│ **Mode** │ **Symbol** │ **Purpose** 🎯              │ **What Happens** 🔄        │
├──────────┼────────────┼─────────────────────────────┼─────────────────────────────┤
│ Read     │ **"r"** 📖 │ Read existing file          │ Error if file missing ❌    │
│ Write    │ **"w"** ✍️  │ Create/overwrite file       │ Erases old content 🗑️       │
│ Append   │ **"a"** ➕ │ Add to end of file          │ Keeps old content ✅        │
└─────────────────────────────────────────────────────────────────────────────────────┘

**📝 Linear Explanation:** File modes are like **keys** 🗝️ - they tell Python how you want to interact with the file. Always use `with open()` because it automatically closes files, like a **self-closing door** 🚪.

═══════════════════════════════════════════════════════════════════════════════════════

## 🎮 Practical Example: Complete File Manager 📁

```python
# 🎪 Complete File Operations Demo
def file_manager_demo():
    """📂 Demonstrates all file operations"""
    
    # ✍️ Create a sample file
    students = """🎓 Student Records 🎓
Alice,Math,95
Bob,Science,87
Charlie,English,92
Diana,History,89"""
    
    # 💾 Save to file
    with open("students.txt", "w") as file:
        file.write(students)
    print("✅ Created student records file!")
    
    # 📖 Read and display
    with open("students.txt", "r") as file:
        content = file.read()
        print("\n📋 File Contents:")
        print("─" * 30)
        print(content)
    
    # ➕ Add a new student
    with open("students.txt", "a") as file:
        file.write("\nEve,Art,96")
    print("\n✅ Added new student!")
    
    # 📊 Read line by line
    print("\n📚 Reading line by line:")
    print("─" * 30)
    with open("students.txt", "r") as file:
        for line_num, line in enumerate(file, 1):  # 🔢 Number each line
            print(f"Line {line_num}: {line.strip()}")

# 🚀 Run the demo
file_manager_demo()
```

═══════════════════════════════════════════════════════════════════════════════════════

## 🎯 What We Learned Today 📚

### • 🔧 **Functions Are Code Building Blocks** 🏗️
**Functions** help organize code into reusable pieces, like having a **toolbox** 🧰 where each tool has a specific job

### • 🎁 **Parameters & Returns Make Functions Smart** 🧠  
**Parameters** let functions receive information 📥, while **return values** send results back 📤, creating flexible and powerful code components

### • ⚡ **Lambda Functions Are Quick Solutions** 🚀
**Lambda functions** provide one-line shortcuts ⚡ for simple tasks, perfect for use with functions like `map()`, `filter()`, and `sorted()` 📊

### • 📂 **File Handling Connects Programs to Data** 🌐
**File operations** (`read "r"` 📖, `write "w"` ✍️, `append "a"` ➕) let programs interact with external files safely using the `with open()` pattern 🛡️