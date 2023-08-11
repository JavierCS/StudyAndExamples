import Vapor

func routes(_ app: Application) throws {
    /**
     All of the common HTTP methods are available as methods on Application. They accept one or more string arguments that represent the request's path separated by /
     */
    app.on(.GET, "hello", "vapor") { req async -> String in
        return "Hello, vapor!"
    }
    
    /**
     By using a path component prefixed with :, we indicate to the router that this is a dynamic component. Any string supplied here will now match this route. We can then use req.parameters to access the value of the string.
     */
    app.get("hello", "dynamic", ":name") { req async -> String in
        let name = req.parameters.get("name") ?? "Bitch"
        return "Hello, \(name)!"
    }
    
    /**
     Routes
     
     A route specifies a request handler for a given HTTP method and URI path. It can also store additional metadata.
     
     Methods
     
     Routes can be registered directly to your Application using various HTTP method helpers.
     These are the supported route helper methods:
     get
     post
     patch
     put
     delete
     
     In addition to the HTTP method helpers, there is an on function that accepts HTTP method as an input parameter.
     */
    
    // MARK: - Constant
    
    // responds to GET /foo/bar/baz
    app.get("foo", "bar", "baz") { req async -> String in
        print(req.parameters)
        return "Constant: /foo/bar/baz"
    }
    
    // MARK: - Parameter
    
    // responds to GET /foo/bar/baz
    // responds to GET /foo/qux/baz
    // ...
    app.get("foo", ":bar", "baz") { req async -> String in
        let parameter = req.parameters.get("bar")
        return "Parameter: /foo/\(parameter ?? "-")/baz"
    }
    
    // MARK: - Anything
    
    // responds to GET /foo/bar/baz
    // responds to GET /foo/qux/baz
    // ...
    app.get("foo", "*", "baz") { req async -> String in
        return "Anything: /foo/discartedValue/baz Parameters: \(req.parameters)"
    }
    
    // MARK: - Catchall
    
    // responds to GET /foo/bar
    // responds to GET /foo/bar/baz
    // ...
    app.get("foo", "**") { req async -> String in
        return "Catchall: \(req.url.path)"
    }
    
    // MARK: - Casting Parameters
    
    // responds to GET /number/42
    // responds to GET /number/1337
    // ...
    app.get("number", ":x") { req async throws -> String in
        guard let int = req.parameters.get("x", as: Int.self) else {
            throw Abort(.badRequest)
        }
        return "\(int) is a great number"
    }
    
    // MARK: - Hello Catchall
    app.get("hello", "**") { req async -> String in
        let name = req.parameters.getCatchall().joined(separator: ", ")
        return "Hello, \(name)!"
    }
    
    // MARK: - Body Streaming
    
    /**
     By default Vapor will limit  streaming body limit to 16 KB in size. You can configure this using app.routes. If a streaming body being collected exceeds the configured limit, a 413 Payload Too Large error will be thrown
     */
    app.routes.defaultMaxBodySize = "500kb"
    
    /**
     To configure request body collection strategy for an individual route, use the body parameter.
     */
    
    // Collects streaming bodies (up to 1mb in size) before calling this route.
    app.on(.POST, "listings", body: .collect(maxSize: "1mb")) { req -> HTTPStatus in
        // Handle request.
        return .ok
    }
    
    /**
     For large requests, like file uploads, collecting the request body in a buffer can potentially strain your system memory. To prevent the request body from being collected, use the stream strategy.
     
     When the request body is streamed, req.body.data will be nil. You must use req.body.drain to handle each chunk as it is sent to your route.
     */
    
    // Request body will not be collected into a buffer.
    app.on(.POST, "upload", body: .stream) { req -> HTTPStatus in
        // Handle request
        return .ok
    }
    
    // MARK: - Case Intensive Routing
    
    /**
     Default behavior for routing is both case-sensitive and case-preserving. Constant path components can alternately be handled in a case-insensitive and case-preserving manner for the purposes of routing; to enable this behavior, configure prior to application startup:
     
     app.routes.caseInsensitive = true
     */
    
    // MARK: - Viewing Routes
    
    /**
     You can access your application's routes by making the Routes service or using app.routes.
     */
    
    print(app.routes.all)
    
    /**
     Vapor also ships with a routes command that prints all available routes in an ASCII formatted table.
     $ swift run App routes
     */
    
    // MARK: - Metadata
    
    /**
     All route registration methods return the created Route. This allows you to add metadata to the route's userInfo dictionary. There are some default methods available, like adding a description.
     */
    
    app.get("hello", "metadata", ":name") { req async -> String in
        let name = req.parameters.get("name")!
        return "Hello, \(name)!"
    }.description("Says Hello")
    
    // MARK: - Route Groups
    
    /**
     Route grouping allows you to create a set of routes with a path prefix or specific middleware. Grouping supports a builder and closure based syntax.

     All grouping methods return a RouteBuilder meaning you can infinitely mix, match, and nest your groups with other route building methods.
     */
    
    // MARK: Path Prefix
    
    let users = app.grouped("users")
    
    // GET /users
    users.get { req async -> HTTPStatus in
        // Here you could fetch and return a user list
        return .ok
    }
    
    // POST /users
    users.post { req async -> HTTPStatus in
        // Here you could add a new user
        return .ok
    }
    
    users.group(":id") { user in
        // GET /users/:id
        user.get { req async -> HTTPStatus in
            let id = req.parameters.get("id")!
            // here you could look for a specific user by its id and return it to the client
            return .ok
        }
        
        // PATCH /users/:id
        user.patch { req async -> HTTPStatus in
            return .ok
        }
        
        // PUT /users/:id
        user.put { req async -> HTTPStatus in
            return .ok
        }
    }
    
    // MARK: - Redirections
    
    app.get("some", "old", "path") { req async -> Response in
        return req.redirect(to: "/some/new/path", redirectType: .permanent)
    }
    
    app.get("some", "new", "path") { req async -> String in
        return "/some/new/path output"
    }
}
