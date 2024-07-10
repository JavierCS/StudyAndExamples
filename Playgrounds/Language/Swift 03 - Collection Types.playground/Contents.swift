/*:
# Collection Types
*/

/**
 Swift provides three primary collection types, known as arrays, sets, and dictionaries, for storing collections of values.
 - Arrays are ordered collections of values.
 - Sets are unordered collections of unique values.
 - Dictionaries are unordered collections of key-value associations.
 */

// MARK: - Mutability of Collections

/**
 It's good practice to create immutable collections in all cases where the collection doesn't neet to chenge becaouse it enables the Swift compiler to optimize the performance of the collections you create
 */

print("\n=====")
print("Array")
print("=====\n")

// MARK: - Arrays

/**
 An array soteres values of the same type in an ordered list. The same value can appear ina an array multiple times at different positions
 */

// MARK: - Creating an Empty Array

var someInts: [Int] = []
print("someInts is of type [Int] with \(someInts.count) items.")

someInts.append(3)
print("someInts is of type [Int] with \(someInts.count) items.")
someInts = []
print("someInts is of type [Int] with \(someInts.count) items.")

// MARK: - Creating an Array with a Default Value

var threeDoubles = Array(repeating: 0.0, count: 3)
print("threeDoubles is of type [Double] with \(threeDoubles.count) items.")

// MARK: - Creating an Array by Adding Two Arrays Together

var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
print("anotherThreeDoubles is of type [Double] with \(anotherThreeDoubles.count) items.")

var sixDoubles = threeDoubles + anotherThreeDoubles
print("sixDoubles is of type [Double] with \(sixDoubles.count) items.")

// MARK: - Creating an Array with an Array Literal

var shoppingList: [String] = ["Eggs", "Milk"]

// MARK: - Accessing and Modifying an Array

/**
 Find the number of items
 */

print("The shopping list contains \(shoppingList.count) items.")

/**
 Use the Bool isEmpty as a shortcut for checking whether the count property is equal to 0
 */

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is't empty.")
}

/**
 Adding new items
 */

shoppingList.append("Flour")
shoppingList += ["Banking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

/**
 Retrieving values
 */

var firstItem = shoppingList[0] // shoppingList.first
shoppingList[0] = "Six eggs"

print(shoppingList)
shoppingList[4...6] = ["Bananas", "Apples"]
print(shoppingList)

shoppingList.insert("Maple Syrup", at: 0)
print(shoppingList)

/**
 Removing Items
 */

let mapleSyrup = shoppingList.remove(at: 0)
print(shoppingList)

let apples = shoppingList.removeLast()
print(shoppingList)

// MARK: - Iterating Over an Array

for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

print("\n====")
print("Sets")
print("====\n")

// MARK: - Sets
/**
 A set stores distinct values of the same type in a collection with no defined ordering. You can use a set instead of an array when the order of items isn't important, or when you need to ensure that an item only appears once
 */


// MARK: - Hash Values for Set Types
/**
 All of Swift's basic types (such as String, Int, Double and Bool) are hashable by default, you can use your custom types as set value types or dictionary key types by making them conform the Hashable protocol
 */

// MARK: - Creating and Initializing an Empty Set

/**
 The type of the letters variable is inferred to be Set<Character>, from the type of the initizlizer
 */

var letters: Set<Character> = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

/**
 Insertgin new values
 */

letters.insert("a")
print("letters is of type Set<Character> with \(letters.count) items.")
letters = []
print("letters is of type Set<Character> with \(letters.count) items.")

//MARK: - Creating a Set with an Array Literal

/**
 Because of Swit's type inference, you don't have to write the type of the Set's elements if you're initializing it with an array literal that contains values of just one type.
 */

var favoriteGenres: Set = ["Rock", "Classical", "Hip Hop"]
print(favoriteGenres)

// MARK: - Accessing and Modifying a Set

/**
 The Count property
 */

print("I have \(favoriteGenres.count) favorite music genres.")

/**
 The empty shortcut
 */
if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}

/**
 Adding elements
 */

favoriteGenres.insert("Jazz")
print(favoriteGenres)

/**
 Removing elements
 */

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}

/**
 Looking for elements
 */

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}

//MARK: - Iterating Over a Set
for genre in favoriteGenres {
    print(genre)
}

/**
 Swift's Set type doesn't have a defined ordering. To iterate over the values of a set in an specific order, use the sorted() method, wich returns the set's elements as an array sorted using the < operator.
 */

for genre in favoriteGenres.sorted() {
    print(genre)
}

// MARK: - Performing Set Operations

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

/**
 Union method creates a new set with all of the values in both sets
 */

let union = oddDigits.union(evenDigits).sorted()

/**
 Intersection method creates a new set with only the values common to both sets
 */

let intersection = oddDigits.intersection(evenDigits).sorted()

/**
 Subtracting method creates a new set with values not in the specified set
 */

let subtracting = oddDigits.subtracting(singleDigitPrimeNumbers).sorted()

/**
 SymmetricDifference method creates a new sit with values in either set, but not both
 */

let symmetricDifference = oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

// MARK: - Set Membership and Equality
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

/**
 Use the isSubset(of:) method to determine whether all of the values of a set are contained in the specified set.
 */

houseAnimals.isSubset(of: farmAnimals)

/**
 Use the isSuperset(of:) method to determine whether a set contains all of the values in a specified set.
 */

farmAnimals.isSuperset(of: houseAnimals)

/**
 Use the isStrictSubset(of:) or isStrictSuperset(of:) methods to determine whether a set is a subset or superset, but not equal to, a specified set.
 */

/**
 Use the isDisjoint(with:) method to determine whether tow sets have no values in common
 */

farmAnimals.isDisjoint(with: cityAnimals)

print("\n============")
print("Dictionaries")
print("============\n")
// MARK: - Dictionaries
/**
 A dictionary stores associations between keys of the same type and values of the same type in a collection with no defined ordering. Each value is associated with a unique key, wich acts as an identifier for that value withing the dictionary.
 */

/**
 The type of a Swift dictionary is written in full as Dictionary<Key, Value> where Key is the type of value that can be used as a dictionary key and must conform to the Hashable protocol, and Value is the type of  value that the dictionary sotres for those keys.
 */

// MARK: - Creating an Empty Dictionary

/**
 Creating an empty Dictionary
 */

var namesOfIntegers: [Int: String] = [:]

namesOfIntegers[16] = "sixteen"
print(namesOfIntegers)
namesOfIntegers = [:]
print(namesOfIntegers)

//MARK: Accessing and Modifying a Dictionary
/**
 Creating a Dictionary with a Dictionary Literal
 */

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
print("The airports dictionary contains \(airports.count) items.")

/**
 The isEmpty shortcut
 */

if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary isn't empty.")
}

/**
 Adding values
 */

airports["LHR"] = "London"
print(airports)

airports["LHR"] = "London Heathrow"
print(airports)

/**
 Updating values
 */

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

/**
 Checking for a key
 */

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("The aiport isn't in the airports dictionary.")
}

airports["APL"] = "Apple International"
print(airports)

/**
 Removing a Key-Value
 */

airports["APL"] = nil

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary doesn't contain a value for DUB.")
}

// MARK: - Iterating Over a Dictionary
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

let airportCodes = [String](airports.keys)
print(airportCodes)

let airportNames = [String](airports.values)
print(airportNames)
