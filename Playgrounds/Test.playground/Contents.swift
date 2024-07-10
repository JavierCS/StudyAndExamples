import Foundation

let queue = DispatchQueue(label: "xyz")
let backgroundWorkItem = DispatchWorkItem { }
let updateUIWorkItem = DispatchWorkItem { }

backgroundWorkItem.notify(queue: DispatchQueue.main,
                          execute: updateUIWorkItem)
queue.async(execute: backgroundWorkItem)

let json: String = """
{
    "nombre": "Javier",
    "edad": "26"
}
"""

class Person: Codable {
    var name: String?
    var age: Float?
    var iAge: Int?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try? container.decode(String.self, forKey: .name)
        age = try container.decode(Float.self, forKey: .age)
        if let age = self.age {
            iAge = Int(age)
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "nombre"
        case age = "edad"
    }
    
    func updateIntValue() {
        guard let age = self.age else { return }
        self.iAge = Int(age)
    }
}

func getPerson(from json: String) -> Person? {
    guard let jsonData = json.data(using: .utf8),
          let person = try? JSONDecoder().decode(Person.self, from: jsonData) else {
              return nil
          }
    return person
}

let javier = getPerson(from: json)
//javier?.updateIntValue()
print(javier?.iAge)
