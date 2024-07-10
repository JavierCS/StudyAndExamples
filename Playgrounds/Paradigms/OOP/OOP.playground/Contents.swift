import UIKit

class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func sayHello() {
        print("Hello, my name is: \(name)")
    }
}

class Javier: Person {
    func sayHelloAndTellMeYourAge() {
        print("Hello my name is: \(self.name)")
    }
}
