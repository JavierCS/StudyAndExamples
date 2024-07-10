/*:
# Structures and Classes
*/

// MARK: - Comparing Structures and Classes

/**
 Both can:
 - Define properties to store values
 - Define methods to provide functionality
 - Define subscripts to provide acces to their values using subscript syntax
 - Dine initializers to set up their initial state
 - Be extenden to expand their unctionality beyond a default implementation
 - Conform to protocols to provide standard functionaly of a certain kind
 
 Classes have additional capabilities that structures don't have
 - Inheritance enables one class to inherit the characteristics of another
 - Type casting enables you to check and interpret the type of a class instance at run time
 - Deinitilizer enable an instance of a class to free up any resources it has assigned.
 - Reference counting allows more than one reference to a class instance
 
 Structures have additional capabilities that classes don't have
 - Memberwize Initilizers
 */

// MARK: - Derfinition Syntax

/**
 Structures and classes have a similar definition syntax. You introduce structures with the struct keyword and classes with the class keyword.
 */

struct SomeStructure {
    // structure definition goes here
}

class SomeClass {
    // class definition goes here
}

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// MARK: - Structure and Class Instances

/**
 The syntax for creating instances is very similar for both structures and classes
 */

let someResolution = Resolution()
let someVideoMode = VideoMode()

// MARK: - Accessing Properties

/**
 You can access the properties of an instance using dot syntax
 */

print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")

/**
 You can also use dot syntax to assign a new value to a variable property
 */

someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")

// MARK: - Memberwise Initializers for Structure Types

/**
 All structures have an automatically generated memberwize initilizer, wich you can use to initilize the member properties of new structure instances.
 */

let vga = Resolution(width: 640, height: 480)

/**
 Unlike structures, class instances don't receive a default memberwize initilizer
 */

// MARK: - Structures and Enumerations Are Value Types

/**
 A value type is a type whose is copied when it's assigned to a variable or constant, or whe it's passed to a function
 */

/**
 Collections defined by the standard library like arrays, dictionaries, and strings use an optimization to reduce the performance cost of copying. Instead of making a copy immediately, these collections share the memory where the elements are stored between the original instance and any copies. If one of the copies of the collection is modified, the elements are copied just before the modification.
 */

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048

print("hd width resolution is \(hd.width)")
print("cinema width resolution is \(cinema.width)")

/**
 The ssame behavior applies to enumerations
 */

enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}

var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()

print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")

// MARK: - Classes Are Reference Types

/**
 Unlike value types, reference types are not copied when they're assigned to a variable or constant, or when they're passed to a function. Rather than a copy, a reference to the same existing instance is used.
 */

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The alsoTenEighty frame rate is \(alsoTenEighty.frameRate)")
print("The tenEighty frame rate is \(tenEighty.frameRate)")

// MARK: Identity Operators

/**
 Because classes are reference types, it's posible for multiple constants and variables to refer the same single instance of a class behind the scenes. This is different for structures and enumerations, because the're always copied
 */

if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoModel instance")
}

/**
 Note that identical (===) does'nt mean the same thing as equal (==). Identical to means that two constants or variables of class type refer the same class instance. Equal to means that two instance are considered equal or equivalent in value
 */
