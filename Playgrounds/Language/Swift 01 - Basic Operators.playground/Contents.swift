/*:
# Basic Operators
*/

// MARK: - Assignment Operator

let b = 10
var a = 5
a = b

let (x,y) = (1,2)

// MARK: - Arithmetic Operatos

1 + 2   // Equals 3
5 - 3   // Equals 2
2 * 3   // Equals 6
10.0 / 2.5  //Equals 4
"Hello, " + "World" // Equals "Hello, World"

// MARK: - Remainder operator (a % b)

9 % 4   // Equals 1 a = (a = (b * someMultiplier) + remainder)
-9 % 4  // Equals -1

// MARK: - Unary Minus Operator

let three = 3
let minusThree = -three // Equals -3
let plusThree = -minusThree // Equals 3 or "minus minus three"

// MARK: - Unary Plus Operator

var minusSix = -6
let alsoMinusSix = +minusSix    // Also equals -6

// MARK: - Compound Assignment Operators

a = 1
a += 2  // a is now equal to 3 (a = a + 2)

// MARK: - Comparison Operatos

1 == 1   // true because 1 is equal to 1
2 != 1   // true because 2 is not equal to 1
2 > 1    // true because 2 is greater than 1
1 < 2    // true because 1 is less than 2
1 >= 1   // true because 1 is greater than or equal to 1
2 <= 1   // false because 2 is not less than or equal to 1

(1, "zebra") < (2, "apple")   // true because 1 is less than 2; "zebra" and "apple" are not compared
(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"

("blue", -1) < ("purple", 1)        // OK, evaluates to true
//("blue", false) < ("purple", true)  // Error because < can't compare Boolean values

// MARK: - Ternary Conditional Operator (question ? answer1 : answer2)

//if question {
//    answer1
//} else {
//    answer2
//}

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// rowHeight is equal to 90

// MARK: - Nil-CoalescingOperator (a ?? b)

//a != nil ? a! : b

let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"

// MARK: - Range Operators

// MARK: Closed Range Operator (a...b)
// Defines a range that runs from a to b, and include the values a and b.

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

// MARK: - Half-Open Range Operator (a..<b)
// Defines a range that runs from a to b, but doesn't include b.

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
// Person 1 is called Anna
// Person 2 is called Alex
// Person 3 is called Brian
// Person 4 is called Jack

// MARK: - One-Sided Ranges
// The closed range operator has an alternative form for ranges thath continue as far as possible in one direction

for name in names[2...] {
    print(name)
}
// Brian
// Jack


for name in names[...2] {
    print(name)
}
// Anna
// Alex
// Brian

for name in names[..<2] {
    print(name)
}
// Anna
// Alex

let range = ...5
range.contains(7)   // false
range.contains(4)   // true
range.contains(-1)  // true

// MARK: - Logical Operators

// MARK: Logical NOT Operator (!a)

let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"

// MARK: Logical AND Operator (a && b)

let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"

// MARK: - Logical OR Operator (a || b)

let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"
