import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    // Register a new route at /api/acronyms that accepts a POST request and returns EventLoopFuture<Acronym>. It returns the acronym once it’s saved.
    app.post("api", "acronyms") { req -> EventLoopFuture<Acronym> in
        // Decode the request’s JSON into an Acronym model using Codable.
        let acronym = try req.content.decode(Acronym.self)
        // Save the model using Fluent and the database from Request.
        return acronym.save(on: req.db).map {
            // save(on:) returns EventLoopFuture<Void> so use map to return the acronym when the save completes.
            acronym
        }
    }

//    try app.register(collection: TodoController())
}
