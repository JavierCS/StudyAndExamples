/*:
# Enumerations
*/

/**
 An enumeration defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code.
 
 Enumeration cases can specify associated values of any type to be stored along with each different case value, much as unions or variants do in other languages. You can define a common set of related cases as part of one enumeration, each of which has a different set of values of appropriate types associated with it.
 */

// MARK: - Enumeration Syntax

enum CompassPoint {
    case north
    case south
    case east
    case west
}

/**
 Multiple cases can appear on a single line, separated by commas
 */

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

/**
 Each enumeration definition defines a new type. Like other types in Swift, their names (such as CompassPoint and Planet) start with a capital letter.
 */

var directionToHead = CompassPoint.west

/**
 You can set it to a different CompassPoint value using a shorter dot syntax
 */

directionToHead = .east

// MARK: - Matching Enumeration Values with a Switch Statement

directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}
// Prints "Watch out for penguins"

/**
 As described in Control Flow, a switch statement must be exhaustive when considering an enumeration’s cases.
 */

let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}
// Prints "Mostly harmless"

// MARK: - Iterating over Enumeration Cases

/**
 For some enumerations, it’s useful to have a collection of all of that enumeration’s cases. You enable this by writing : CaseIterable after the enumeration’s name.
 */

enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")
// Prints "3 beverages available"

for beverage in Beverage.allCases {
    print(beverage)
}

// MARK: - Asociated Values

/**
 It’s useful to be able to store values of other types alongside these case values. This additional information is called an associated value, and it varies each time you use that case as a value in your code.
 
 You can define Swift enumerations to store associated values of any given type, and the value types can be different for each case of the enumeration if needed. Enumerations similar to these are known as discriminated unions, tagged unions, or variants in other programming languages.
 */

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

/**
 You can create new barcodes using
 */

var productBarcode = Barcode.upc(8, 85909, 51226, 3)

/**
 You can assing the same product a different type of barcode
 */

productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

/**
 the associated values are extracted as part of the switch statement. You extract each associated value as a constant (with the let prefix) or a variable (with the var prefix) for use within the switch case’s body
 */

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
// Prints "QR code: ABCDEFGHIJKLMNOP."

switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}
// Prints "QR code: ABCDEFGHIJKLMNOP."

// MARK: - Raw Values

/**
 As an alternative to associated values, enumeration cases can come prepopulated with default values (called raw values), which are all of the same type.
 */

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

// MARK: - Implicitly Assigned Raw Values

/**
 When you’re working with enumerations that store integer or string raw values, you don’t have to explicitly assign a raw value for each case. When you don’t, Swift automatically assigns the values for you.
 */

enum PlanetWithRawValue: Int, CaseIterable {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

enum CompassPointWithRawValue: String, CaseIterable {
    case north, south, east, west
}

PlanetWithRawValue.allCases.forEach({ enumCase in
    print(enumCase.rawValue)
})

CompassPointWithRawValue.allCases.forEach { enumCase in
    print(enumCase.rawValue)
}

// MARK: - Initializing from a Raw Value

/**
 If you define an enumeration with a raw-value type, the enumeration automatically receives an initializer that takes a value of the raw value’s type (as a parameter called rawValue) and returns either an enumeration case or nil.
 */

let possiblePlanet = PlanetWithRawValue(rawValue: 7)
// possiblePlanet is of type Planet? and equals Planet.uranus

// MARK: - Recursive Enumerations

/**
 A recursive enumeration is an enumeration that has another instance of the enumeration as the associated value for one or more of the enumeration cases. You indicate that an enumeration case is recursive by writing indirect before it, which tells the compiler to insert the necessary layer of indirection.
 */

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

//indirect enum ArithmeticExpression {
//    case number(Int)
//    case addition(ArithmeticExpression, ArithmeticExpression)
//    case multiplication(ArithmeticExpression, ArithmeticExpression)
//}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

/**
 A recursive function is a straightforward way to work with data that has a recursive structure. For example, here’s a function that evaluates an arithmetic expression
 */

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))
