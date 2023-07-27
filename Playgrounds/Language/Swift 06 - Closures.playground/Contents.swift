/*:
# Closures
*/

/**
 Closures are self-contained blocks of functionality that can be passed around and used in your code. Closures in Swift are similar to blocks in C and Objective-C and to lambdas in other programming languages.
 
 Global and nested functionas, are actually special cases of closures:
 - Global functionas are closures that have a name and don't capture any values.
 - Nested functions are closures that have a name and can capture values from ther enclosing function
 - Closure expressions are unnamed closures written in a lightweight syntax that can capture values from their surrounding context.
 */

// MARK: - The Sorted Method

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
print(names)
print(reversedNames)

// MARK: - Closure Expresion Syntax

/**
 Closure expression syntax has the following general form:
 { (<#parameters#>)-> <#return type#> in
    <#statements#>
 }
 */

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
print()
print(reversedNames)

// MARK: - Inferring Type From Context

/**
 Because the sorting closure is passed as an argument to a method, Swift can infer the types of its parameters and the type of the value it returns.
 */

///Because all of the types can be inferred, the return arrow (->) and the parentheses around the names of the parameters can also be omitted
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })
print("Reversed names using Type Inference From Context")
print(reversedNames)

// MARK: - Implicit Returns from Single-Expresion Closures

/**
 Single-expression closures can implicitly return the result of their single expression by omitting the return keyword from their declaration.
 */

reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })
print("Reversed names using Implicit Returns")
print(reversedNames)

// MARK: - Shorthand Argument Names

/**
 Swift automatically provides shorthand argument names to inline closures, which can be used to refer to the values of the closure’s arguments by the names $0, $1, $2, and so on.
 */

reversedNames = names.sorted(by: { $0 > $1 })

// MARK: - Trailing Closures

/**
 If you need to pass a closure expression to a function as the function´s argument and the closure expresion is long, it can be usefull to write it as a trailing closure instead.
 */

func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}

/**
 Here´s how you call this function without using a trailing closure
 */

someFunctionThatTakesAClosure(closure: {
    // closure´s body goes here
})

/**
 Here´s how you call this function with a trailing closure instead
 */

someFunctionThatTakesAClosure() {
    // trailing closure´s body goes here
}

/**
 If a closure expresion is provided as the function´s or method´s only argument and you provide that expresion as a trailing closure, you don´t neet  to write a pair of parentheses () after the funcion or method´s name when you call the function
 */

someFunctionThatTakesAClosure {
    // trailing closure´s body goes here
}

/**
 The string-sorting closure can be written outside of the sorted(by:) method´s parentheses as trailing closure
 */

reversedNames = names.sorted { $0 > $1 }

/**
 If a function takes multiple closures, you omit the argument label for the first trailing closure and you label the rmaining trailing closures
 */

//func loadPicture(from serverPat: Server, completion: (Picture) -> Void, onFailure: () -> Void) {
//    if let picture = download("photo.jpg", from: server) {
//        completion(picture)
//    } else {
//        onFailure()
//    }
//}
//
//loadPicture(from: someServer) { picture in
//    someView.currentPicture = picture
//} onFailure: {
//    print("Couldn't download the next picture.")
//}

// MARK: - Close Capturing / Closing Over

/**
 A closure can capture constants and variables from the surrounding context in wich it´s defined. The closure can then refer to and modify the values of those constants and variables from within its body, even if the original scope that defined the constantds and variables no longer exist.
 */

func makeIncrementer(forIncrement amonunt: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amonunt
        return runningTotal
    }
    return incrementer
}

let incrementer = makeIncrementer(forIncrement: 2)
print("Incrementer is in: \(incrementer())")
print("Incrementer is in: \(incrementer())")

func makeCounter() -> () -> Int {
    var count = 0
    func counter() -> Int {
        count += 1
        return count
    }
    return counter
}

let counter = makeCounter()
print(counter()) // Output: 1
print(counter()) // Output: 2

func appendLetter() -> (Character) -> String {
    var text = ""
    func append(_ letter: Character) -> String {
        text.append(letter)
        return text
    }
    return append
}

let letter = appendLetter()
print(letter("J"))
print(letter("a"))
print(letter("v"))
print(letter("i"))
print(letter("e"))
print(letter("r"))


// MARK: - Escaping Closures

/**
 A closure is said to scape a function when the closure is passed as an argument to the function, but is called after the function returns. When you declare a function that takes a closure as one of its parameters, you car write @escaping before the parameter´s type to indicate that the closure is allowed to scape.
 
 As an example, many functions that start an asynchronous operation take a closure argument as a completion handler. The function returns after it starts the operation, but the closure isn´t called until the operation is completed - the closure needs to scape, to be called later. For example:
 */

var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
// Prints "200"

completionHandlers.first?()
print(instance.x)
// Prints "100"

// MARK: - Autoclosures

/**
 An autoclosure is a closures that´s automaticalli created to wrap an expression that´s being passed as an argument to a function, It doesn´t mtake any arguments, and when it´s called, it returns the value of the expression that´s wrapped inside of it. This syntactic convenience lets you omit braces around a function´s parameter by writing a normal expresion instead of an explicit closure.
 */

var customersInLine = [
"Chris",
"Alex",
"Ewa",
"Barry",
"Daniella"
]

print(customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)

print("Now serving \(customerProvider())!")
print(customersInLine.count)

