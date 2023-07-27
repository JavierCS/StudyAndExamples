import UIKit

class Person: NSObject {
    var name: String
    var lastName: String
    var age: Int
    
    init (name: String, lastName: String, age: Int) {
        self.name = name
        self.lastName = lastName
        self.age = age
    }
}

var str = "Hello, playground"
var me = Person(name: "Javier", lastName: "Cruz", age: 25)

let mirror = Mirror(reflecting: me)

print("\nMirror children:")
for child in mirror.children {
    print(child.label as Any)
    print(child.value)
}

print("\nCustom Mirror:")
print(mirror.customMirror)

print("\nMirror Description:")
print(mirror.description)

print("\nMirror Display Style:")
print(mirror.displayStyle as Any)

print("\nMirror Subject Type:")
print(mirror.subjectType)

print("\nMirror Super Class Mirror")
print(mirror.superclassMirror as Any)

class MyViewController : UIViewController {
    @objc var name: String = "John"
}

print(#keyPath(MyViewController.name))
