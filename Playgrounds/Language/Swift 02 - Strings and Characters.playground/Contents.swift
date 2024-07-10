import UIKit

/*:
# Strings And Characters
*/

//MARK: - String Literal

/**
 You can include predefined String values within your code as string literals. A string literal is a sequence of characters surrounded by double quotation marks (")
 */

let someString = "Some string literal value"
print("==== SomeString ====")
print(someString)

//MARK: - Multiline String Literals

/**
 A sequence of characters surrounded by three double quotation marks
 */

var quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
print("==== Quotation ====")
print(quotation)

let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""
print("==== SingleLineString & MultilineString ====")
print(singleLineString)
print(multilineString)

let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
print("==== Soft Wrapped Quotation ====")
print(softWrappedQuotation)

let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""
print("==== Line Breaks ====")
print(lineBreaks)

//MARK: - Special Characters in String Literal

/**
 String literals can include the following special characters:
 The escaped special characters \0 (null character), \\ (backslash), \t (horizontal tab), \n (line feed), \r (carriage return), \" (double quotation mark) and \' (single quotation mark)
 An arbitrary Unicode scalar value, written as \\u{n}, where n is a 1–8 digit hexadecimal number (Unicode is discussed in Unicode below)
 */

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496

/**
 Because multiline string literals use three double quotation marks instead of just one, you can include a double quotation mark (") inside of a multiline string literal without escaping it. To include the text """ in a multiline string, escape at least one of the quotation marks.
 */

//let threeDoubleQuotationMarks = """
//Escaping the first quotation mark \"""
//Escaping all three quotation marks \"\"\"
//"""

// MARK: - Extended String Delimiters

/**
 You can place a string literal within extended delimiters to include special characters in a string without invoking their effect. You place your string within quotation marks (") and surround that with number signs (#). For example, printing the string literal #"Line 1\nLine 2"# prints the line feed escape sequence (\n) rather than printing the string across two lines.
 
 If you need the special effects of a character in a string literal, match the number of number signs within the string following the escape character (\). For example, if your string is #"Line 1\nLine 2"# and you want to break the line, you can use #"Line 1\#nLine 2"# instead. Similarly, ###"Line1\###nLine2"### also breaks the line.
 
 String literals created using extended delimiters can also be multiline string literals. You can use extended delimiters to include the text """ in a multiline string, overriding the default behavior that ends the literal.
 */

let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#

// MARK: - Initializing an Empty String

/**
 To create an empty String value as the starting point for building a longer string, either assign an empty string literal to a variable or initialize a new String instance with initializer syntax.
 */

var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax
// these two strings are both empty, and are equivalent to each other

// MARK: - String Mutability

/**
 You indicate whether a particular String can be modified (or mutated) by assigning it to a variable (in which case it can be modified), or to a constant (in which case it can’t be modified).
 */

var variableString = "Horse"
variableString += " and carriage"
// variableString is now "Horse and carriage"

let constantString = "Highlander"
//constantString += " and another Highlander"
// this reports a compile-time error - a constant string cannot be modified

// MARK: - String are Value Types

/**
 Swift’s String type is a value type. If you create a new String value, that String value is copied when it’s passed to a function or method, or when it’s assigned to a constant or variable. In each case, a new copy of the existing String value is created, and the new copy is passed or assigned, not the original version.
 */

let stringOne = "Test"
var stringTwo = stringOne
print("\(stringOne) is equal to \(stringTwo)")
stringTwo = "Test Two"
print("\(stringOne) now is diferent to \(stringTwo)")

// MARK: - Working With Characters

/**
 You can access the individual Character values for a String by iterating over the string with a for-in loop.
 */

for character in "Dog!🐶" {
    print(character)
}

/**
 Alternatively, you can create a stand-alone Character constant or variable from a single-character string literal by providing a Character type annotation.
 */

let exclamationMark: Character = "!"

/**
 String values can be constructed by passing an array of Character values as an argument to its initializer.
 */

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
// Prints "Cat!🐱"

// MARK: - Concatenating Strings and Characters

/**
 String values can be added together (or concatenated) with the addition operator (+) to create a new String value.
 */

let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
// welcome now equals "hello there"

/**
 You can also append a String value to an existing String variable with the addition assignment operator (+=).
 */

var instruction = "look over"
instruction += string2
// instruction now equals "look over there"

/**
 You can append a Character value to a String variable with the String type’s append() method.
 */

welcome.append(exclamationMark)

// MARK: - String Interpolation

/**
 String interpolation is a way to construct a new String value from a mix of constants, variables, literals, and expressions by including their values inside a string literal. You can use string interpolation in both single-line and multiline string literals.
 */

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5"

/**
 To use string interpolation inside a string that uses extended delimiters, match the number of number signs after the backslash to the number of number signs at the beginning and end of the string.
 */

print(#"6 times 7 is \#(6 * 7)."#)
// Prints "6 times 7 is 42."

// MARK: - Unicode

/**
 Unicode is an international standard for encoding, representing, and processing text in different writing systems. It enables you to represent almost any character from any language in a standardized form, and to read and write those characters to and from an external source such as a text file or web page.
 */

let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e followed by
// eAcute is é, combinedEAcute is é

let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
// precomposed is 한, decomposed is 한

let enclosedEAcute: Character = "\u{E9}\u{20DD}"
// enclosedEAcute is é⃝

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
// regionalIndicatorForUS is 🇺🇸

// MARK: - Counting Characters

/**
 To retrieve a count of the Character values in a string, use the count property of the string
 */

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")
// Prints "unusualMenagerie has 40 characters"

/**
 Note that Swift’s use of extended grapheme clusters for Character values means that string concatenation and modification may not always affect a string’s character count.
 */

var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in cafe is 4"

word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in café is 4"

// MARK: - Accessing and Modifying a String

/**
 You access and modify a string through its methods and properties, or by using subscript syntax.
 */

// MARK: String Indices

/**
 Each String value has an associated index type, String.Index, which corresponds to the position of each Character in the string.
 */

var greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a

/**
 Use the indices property to access all of the indices of individual characters in a string.
 */

for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}

// MARK: Inserting and Removing

/**
 To insert a single character into a string at a specified index, use the insert(_:at:) method, and to insert the contents of another string at a specified index, use the insert(contentsOf:at:) method.
 */

welcome.remove(at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there"

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
// welcome now equals "hello"


// MARK: Substrings

/**
 When you get a substring from a string — for example, using a subscript or a method like prefix(_:) — the result is an instance of Substring, not another string. Substrings in Swift have most of the same methods as strings, which means you can work with substrings the same way you work with strings. However, unlike strings, you use substrings for only a short amount of time while performing actions on a string. When you’re ready to store the result for a longer time, you convert the substring to an instance of String.
 */

greeting = "Hello, world!"
let englishGreetingIndex = greeting.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greeting[..<englishGreetingIndex]
// beginning is "Hello"

// Convert the result to a String for long-term storage.
let newString = String(beginning)

// MARK: Comparing Strings

/**
 Swift provides three ways to compare textual values: string and character equality, prefix equality, and suffix equality.
 */

// MARK: String and Character Equality

/**
 String and character equality is checked with the “equal to” operator (==) and the “not equal to” operator (!=).
 */

quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}
// Prints "These two strings are considered equal"

/**
 Two String values (or two Character values) are considered equal if their extended grapheme clusters are canonically equivalent. Extended grapheme clusters are canonically equivalent if they have the same linguistic meaning and appearance, even if they’re composed from different Unicode scalars behind the scenes.
 */

// "Voulez-vous un café?" using LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}
// Prints "These two strings are considered equal"

/**
 Conversely, LATIN CAPITAL LETTER A (U+0041, or "A"), as used in English, is not equivalent to CYRILLIC CAPITAL LETTER A (U+0410, or "А"), as used in Russian. The characters are visually similar, but don’t have the same linguistic meaning.
 */

let latinCapitalLetterA: Character = "\u{41}"

let cyrillicCapitalLetterA: Character = "\u{0410}"

if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters aren't equivalent.")
}
// Prints "These two characters aren't equivalent."

// MARK: Prefix and Suffix Equality

/**
 To check whether a string has a particular string prefix or suffix, call the string’s hasPrefix(_:) and hasSuffix(_:) methods, both of which take a single argument of type String and return a Boolean value.
 */

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

/**
 You can use the hasPrefix(_:) method with the romeoAndJuliet array to count the number of scenes in Act 1 of the play
 */

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")
// Prints "There are 5 scenes in Act 1"

/**
 Similarly, use the hasSuffix(_:) method to count the number of scenes that take place in or around Capulet’s mansion and Friar Lawrence’s cell
 */

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
// Prints "6 mansion scenes; 2 cell scenes"

// MARK: - UTF-8 Representation

/**
 You can access a UTF-8 representation of a String by iterating over its utf8 property. This property is of type String.UTF8View, which is a collection of unsigned 8-bit (UInt8) values, one for each byte in the string’s UTF-8 representation
 */

let dogString = "Dog‼🐶"
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// Prints "68 111 103 226 128 188 240 159 144 182 "

// MARK: - UTF-16 Representation

/**
 You can access a UTF-16 representation of a String by iterating over its utf16 property. This property is of type String.UTF16View, which is a collection of unsigned 16-bit (UInt16) values, one for each 16-bit code unit in the string’s UTF-16 representation.
 */

for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 55357 56374 "

// MARK: - Unicode Scalar Representation

/**
 You can access a Unicode scalar representation of a String value by iterating over its unicodeScalars property. This property is of type UnicodeScalarView, which is a collection of values of type UnicodeScalar.
 Each UnicodeScalar has a value property that returns the scalar’s 21-bit value, represented within a UInt32 value.
 */

for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 128054 "

for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
}
// D
// o
// g
// ‼
// 🐶
