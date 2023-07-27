import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    // This Add a new route to hangle a GET request. Each parameter to app.get is a path component in the URL. This route is invoked when a user enters http://localhost:8080/hello/vapor as the URL.
    app.get("hello", "vapor") { req -> String in
        return "Hello, Vapor!"
    }
    
    // Here you use :name to designate a dynamic parameter
    app.get("hello", ":name") { req throws -> String in
        // Extract the user's name, wich is passed in the Request object. If Vapor can't find a parameter called name, throw an error
        guard let name = req.parameters.get("name") else {
            throw Abort(.internalServerError)
        }
        // Return the name in the greeting
        return "Hello, \(name)!"
    }
    
    app.post("info") { req -> String in
        let data = try req.content.decode(InfoData.self)
        return "Hello, \(data.name)!"
    }
    
    app.post("infoV2") { req -> InfoResponse in
        let data = try req.content.decode(InfoData.self)
        return InfoResponse(request: data ,greeting: "Hello, \(data.name)!")
    }
}

// Content is the Vapor's rapper around Codable Protocol
struct InfoData: Content {
    var name: String
}

struct InfoResponse: Content {
    let request: InfoData
    let greeting: String
}
