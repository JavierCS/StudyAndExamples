/*:
# The Basics
*/

/**
 Swift is a type-safe language, which means the language helps you to be clear about the types of values your code can work with.
 */

// MARK: - Declaring Constants and Variables

let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

/**
 You can declare multiple constants or multiple variables on a single line, separated by commas.
 */

var x = 0.0, y = 0.0, z = 0.0

// MARK: - Type Annotations

/**
 You can provide a type annotation when you declare a constant or variable, to be clear about the kind of values the constant or variable can store.
 */

var welcomeMessage: String

/**
 You can define multiple related variables of the same type on a single line, separated by commas, with a single type annotation after the final variable name.
 */

var red, green, blue: Double

// MARK: - Naming Constatns And Variables

/**
 Constant and variable names can contain almost any character, including Unicode characters.
 */

var π = 3.14159
var 你好 = "你好世界"
var 🐶🐮 = "dogcow"

let crazyStringCount: Int = String(["\(π)", 你好, 🐶🐮].joined(separator: " ")).count

// MARK: - Semicolons

/**
 Unlike many other languages, Swift doesn’t require you to write a semicolon (;) after each statement in your code, although you can do so if you wish. However, semicolons are required if you want to write multiple separate statements on a single line.
 */

let cat = "🐱"; print(cat)

// MARK: - Integers

/**
 Swift provides signed and unsigned integers in 8, 16, 32, and 64 bit forms. These integers follow a naming convention similar to C, in that an 8-bit unsigned integer is of type UInt8, and a 32-bit signed integer is of type Int32. Like all types in Swift, these integer types have capitalized names.
 */

// MARK: Integer Bounds

/**
 You can access the minimum and maximum values of each integer type with its min and max properties.
 */

let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max  // maxValue is equal to 255, and is of type UInt8

// MARK: - Type Safety and Type Inference

/**
 Swift is a type-safe language. A type safe language encourages you to be clear about the types of values your code can work with. If part of your code requires a String, you can’t pass it an Int by mistake.
 
 Because Swift is type safe, it performs type checks when compiling your code and flags any mismatched types as errors. This enables you to catch and fix errors as early as possible in the development process.
 
 If you don’t specify the type of value you need, Swift uses type inference to work out the appropriate type. Type inference enables a compiler to deduce the type of a particular expression automatically when it compiles your code, simply by examining the values you provide.
 */

/**
 If you assign a literal value of 42 to a new constant without saying what type it is, Swift infers that you want the constant to be an Int, because you have initialized it with a number that looks like an intege.
 */

let meaningOfLife = 42 // meaningOfLife is inferred to be of type Int

/**
 If you don’t specify a type for a floating-point literal, Swift infers that you want to create a Double.
 */

let pi = 3.14159 // pi is inferred to be of type Double

/**
 If you combine integer and floating-point literals in an expression, a type of Double will be inferred from the context.
 */

let anotherPi = 3 + 0.14159 // anotherPi is also inferred to be of type Double

// MARK: - Numeric Literals

/**
 Integer literals can be written as:
 A decimal number, with no prefix
 A binary number, with a 0b prefix
 An octal number, with a 0o prefix
 A hexadecimal number, with a 0x prefix
 */

let decimalInteger = 17 // 17 in decimal notation
let binaryInteger = 0b10001 // 17 in binary notation
let octalInteger = 0o21 // 17 in octal notation
let hexadecimalInteger = 0x11 // 17 in hexadecimal notation

/**
 Floating-point literals can be decimal (with no prefix), or hexadecimal (with a 0x prefix). They must always have a number (or hexadecimal number) on both sides of the decimal point. Decimal floats can also have an optional exponent, indicated by an uppercase or lowercase e; hexadecimal floats must have an exponent, indicated by an uppercase or lowercase p
 */

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

/**
 Numeric literals can contain extra formatting to make them easier to read. Both integers and floats can be padded with extra zeros and can contain underscores to help with readability. Neither type of formatting affects the underlying value of the literal.
 */

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

// MARK: - Type Aliases

/**
 Type aliases define an alternative name for an existing type. You define type aliases with the typealias keyword.
 Type aliases are useful when you want to refer to an existing type by a name that’s contextually more appropriate, such as when working with data of a specific size from an external source.
 */

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min // maxAmplitudeFound is now 0

// MARK: - Booleans

/**
 Swift has a basic Boolean type, called Bool. Boolean values are referred to as logical, because they can only ever be true or false. Swift provides two Boolean constant values, true and false
 */

let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}

// MARK: - Tuples

/**
 Tuples group multiple values into a single compound value. The values within a tuple can be of any type and don’t have to be of the same type as each other.
 */

let http404Error = (404, "Not Found")

/**
 You can decompose a tuple’s contents into separate constants or variables, which you then access as usual
 */

let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// Prints "The status code is 404"
print("The status message is \(statusMessage)")
// Prints "The status message is Not Found"

/**
 If you only need some of the tuple’s values, ignore parts of the tuple with an underscore (_) when you decompose the tuple
 */

let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
// Prints "The status code is 404"

/**
 Alternatively, access the individual element values in a tuple using index numbers starting at zero
 */

print("The status code is \(http404Error.0)")
// Prints "The status code is 404"
print("The status message is \(http404Error.1)")
// Prints "The status message is Not Found"

/**
 You can name the individual elements in a tuple when the tuple is defined
 */

let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
// Prints "The status code is 200"
print("The status message is \(http200Status.description)")
// Prints "The status message is OK"

// MARK: - Optionals

/**
 You use optionals in situations where a value may be absent. An optional represents two possibilities: Either there is a value, and you can unwrap the optional to access that value, or there isn’t a value at all
 
 The concept of optionals doesn’t exist in C or Objective-C. For these types, Objective-C methods typically return a special value (such as NSNotFound) to indicate the absence of a value. Swift’s optionals let you indicate the absence of a value for any type at all, without the need for special constants.
 */

/**
 The example below uses the initializer to try to convert a String into an Int
 Because the initializer might fail, it returns an optional Int, rather than an Int. An optional Int is written as Int?, not Int. The question mark indicates that the value it contains is optional, meaning that it might contain some Int value, or it might contain no value at all.
 */

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber is inferred to be of type "Int?", or "optional Int"

// MARK: Nil

/**
 You set an optional variable to a valueless state by assigning it the special value ni.
 */

var serverResponseCode: Int? = 404
// serverResponseCode contains an actual Int value of 404
serverResponseCode = nil
// serverResponseCode now contains no value

// MARK: If Statements and Forced Unwrapping

/**
 You can use an if statement to find out whether an optional contains a value by comparing the optional against nil. You perform this comparison with the “equal to” operator (==) or the “not equal to” operator (!=).
 If an optional has a value, it’s considered to be “not equal to” nil
 */

if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}
// Prints "convertedNumber contains some integer value."

if convertedNumber != nil {
    // The exclamation point effectively says, “I know that this optional definitely has a value; please use it.” This is known as forced unwrapping of the optional’s value
    print("convertedNumber has an integer value of \(convertedNumber!).")
}
// Prints "convertedNumber has an integer value of 123."

// MARK: - Optional Binding

/**
 You use optional binding to find out whether an optional contains a value, and if so, to make that value available as a temporary constant or variable.
 */

if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" couldn't be converted to an integer")
}
// Prints "The string "123" has an integer value of 123"

/**
 If you don’t need to refer to the original, optional constant or variable after accessing the value it contains, you can use the same name for the new constant or variable
 */
