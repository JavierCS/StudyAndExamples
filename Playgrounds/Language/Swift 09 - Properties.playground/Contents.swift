/*:
 # Properties
 */

/**
 Properties associate values with a particular class, structure or enumeration
 */

import Foundation

// MARK: - Stored Properties

/**
 In it's simple form, a stored property is a constant or variable that's stored as part of an instance of a particular class or structure, you can provide default value for a Stored Property, you can also set or modify the initial value of a stored property during initialization
 */

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

// MARK: - Stored Properties of Constant Structure Instances

/**
 Because rangeOfFourItems is declared as a constant, it isn't possible to change its firstValue property, even though it's a variable property
 
 This behavior is due to structures being value types. When an instance of a value type is marked as a constant, so are all of its properties
 The same isn't  true for classes, wich are reference types. If you assing an instance of a reference type, you can still change that instance's variable properties.
 */

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 6

// MARK: - Lazy Stored Properties

/**
 Is a property whose initial value isn´t calculated until the first time it´s used. Lazy properties are useful when the initial value of a property is depent on outside factors whose values aren´t known until after an instance's initiation is complete.
 
 Lazy Properties are also useful when the initial value of a property requires complex or computationally expensive setup that shound't be performed unless ot until it's needed.
 */

class DataImporter {
    /*
     DataImporter is a class to import data from an external file.
     The class is assumed to take a nontrivial amount of time to initialize.
     */
    var fileName = "data.txt"
    // the DataImporter class would provide data importing functionality here
}

class DataManager {
    lazy var importer = DataImporter()
    var data: [String] = []
    // the DataManager class would provide data management functionality here
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// the DataImporter instance of the importer property hasn't yet been created
print(manager.importer.fileName)
// the DataImporter instance of the importer property has now been created

// MARK: - Stored Properties and Instance Variables

/**
 In addition to properties, you can use instance variables as backing store for the values stored in a property.
 */

// MARK: - Computed Properties

/**
 In additional to stored properties, classes, structures and enumerations can define computed properties, which don't acctually store a value, they provide a getter and an optional setter to retrive and set other properties and values directly.
 */

struct Point {
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 0.0
    var height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(
    origin: Point(),
    size: Size(width: 10.0, height: 10.0)
)
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("Square origin is now at (\(square.origin.x), \(square.origin.y))")

// MARK: - Shorthand Setter Declaration

/**
 If a computed property's setter doesn't define a name for the new value to be set, a default name of 'newValue' is used
 */

struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

// MARK: - Shorthand Getter Declaration

/**
 If the entire body of a getter is a single expression, the gettet implicitly returns that expression.
 */

struct CompactRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            Point(x: origin.x + (size.width / 2),
                  y: origin.y + (size.height / 2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

// MARK: - Read-Only Computed Properties

/**
 A computed property with a getter and no setter is known as read-only computed property. A read-only computed property always returns a value, and can be accessed thought dot syntax, but can´t be set to a different value.
 */

struct Cuboid {
    var width = 0.0
    var height = 0.0
    var depth = 0.0
    
    var volume: Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("The volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

// MARK: - Property Observers

/**
 Property observers observe and respond to changes in a property's value. Property observers are called everytime a property's value si set, even if the new value is the same as the property's current value
 
 You can add property observers in:
 - Stored properties that you define
 - Stored properties that you inherit
 - Computed propertis that you inherit
 
You have the option to define either or both of these observers on a property
 - willSet: is called just before the value is stored
 - didSet: is called immediatly afther the new value is stored
 */

class StepCounter {
    var totalSteps: Int = 0 {
        willSet (newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            guard totalSteps > oldValue else { return }
            print("Added \(totalSteps - oldValue) steps")
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896

// MARK: - Property Wrapper

/**
 A property wrapper adds a layer of separation between code that manages how a property is stored and the code that defines a property
 */

@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}

struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.height)

rectangle.height = 10
print(rectangle.height)

rectangle.height = 24
print(rectangle.height)

struct SmallRectangleTwo {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    var height: Int {
        get { return _height.wrappedValue }
        set { _height.wrappedValue = newValue }
    }
    var width: Int {
        get { return _width.wrappedValue }
        set { _width.wrappedValue = newValue }
    }
}

// MARK: - Setting Initial Values for Wrapped Properties

@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int
    
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum) }
    }
    
    init() {
        maximum = 12
        number = 0
    }
    
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}

var zeroRectangle = ZeroRectangle()
print(zeroRectangle.height, zeroRectangle.width)

struct UnitRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber var width: Int = 1
}

var unitRetangle = UnitRectangle()
print(unitRetangle.height, unitRetangle.width)

struct NarrowRectangle {
    @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
}

var narrowRectangle = NarrowRectangle()
print(narrowRectangle.height, narrowRectangle.width)

narrowRectangle.height = 100
narrowRectangle.width = 100
print(narrowRectangle.height, narrowRectangle.width)

struct MixedRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber(maximum: 9) var width: Int = 2
}

var mixedRectangle = MixedRectangle()
print(mixedRectangle.height)

mixedRectangle.height = 20
print(mixedRectangle.height)

// MARK: - Project a Value From a Property Wrapper

/**
 In Addition to the wrapped value, an Property Wrapper can expose aditional functionality by defining a projected value
 */

@propertyWrapper
struct VerySmallNumber {
    private var number: Int
    private(set) var projectedValue: Bool
    
    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }
    
    init() {
        number = 0
        projectedValue = false
    }
}

struct SomeStructure {
    @VerySmallNumber var someNumber: Int
}

var someStructure = SomeStructure()
someStructure.someNumber = 4
print(someStructure.$someNumber)
someStructure.someNumber = 55
print(someStructure.$someNumber)

/**
 When you access a projected value from code that’s part of the type, like a property getter or an instance method, you can omit self. before the property name, just like accessing other properties.
 */

enum SizeEnum {
    case small
    case large
}

struct SizedRectangle {
    @VerySmallNumber var height: Int
    @VerySmallNumber var width: Int
    
    mutating func resize(to size: SizeEnum) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 100
        }
        return $height && $width
    }
}

var sizedRectangle = SizedRectangle()
print(sizedRectangle.resize(to: .large), sizedRectangle.resize(to: .small))

// MARK: - Global and Local Variables

/**
 The capabilities described above about computing and observing properties are also available for global variables and local variables.
 */

/// Global constants and variables are always computed lazily, unlike lazy stored properties, global constants and variables  don't need to be marked  with the lazy modifier

// MARK: - Type Properties

/**
 You can also define properties that belong to the type itself, not to any instance of that type. There will no ever be one copy of these properties, no matter how many instances of that type you create. These kind of properties are called type properties
 */

struct SomeStructureTwo {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

print(SomeStructureTwo.storedTypeProperty)
SomeStructureTwo.storedTypeProperty = "Another value."
print(SomeStructureTwo.storedTypeProperty)
print(SomeEnumeration.computedTypeProperty)
print(SomeClass.computedTypeProperty)
