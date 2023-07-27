import Vapor
import Fluent

final class Acronym: Model {
    typealias IDValue = UUID
    
    static var schema: String = "acronyms"
    
    @ID var id: IDValue?
    @Field(key: "short") var short: String
    @Field(key: "long") var long: String
    
    required init() {}
    
    init(id: IDValue?, short: String, long: String) {
        self.id = id
        self.short = short
        self.long = long
    }
}

// MARK: - Content Management
extension Acronym: Content {}
