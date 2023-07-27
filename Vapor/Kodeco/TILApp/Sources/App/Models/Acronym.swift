//
//  Acronym.swift
//  
//
//  Created by jcruzsa on 09/01/23.
//

import Vapor
import Fluent

// Define a class that conforms to Model
final class Acronym: Model {
    // Specify the schema as required by Model. This is the name of the table in the database.
    static let schema: String = "acronyms"
    
    // Define an optional id property that stores the ID of the model, if one has been set. This is annotated with the @ID property wrapper. This tells fluent what to use to look up the model in the database.
    @ID var id: UUID?
    
    // Define two String properties to hold the acronym and its definition. The use the @Field property wrapper to denote a generic databse field. The key parameter is the name of the column in the database.
    @Field(key: "short") var short: String
    @Field(key: "long") var long: String
    
    // Provide an empty initializer required by Model. Fluent use this to initilize models returned from database queries.
    init() {}
    
    // Provide an initializer to create the model as required
    init(uuid: UUID? = nil, short: String, long: String) {
        self.id = id
        self.short = short
        self.long = long
    }
}

// Implementing Content for JSON Serialization
extension Acronym: Content {}



