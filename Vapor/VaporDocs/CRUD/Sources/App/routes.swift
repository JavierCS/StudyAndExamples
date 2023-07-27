import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    // MARK: - Create
    app.post("api", "acronyms") { req async throws -> HTTPStatus in
        let acronym = try req.content.decode(Acronym.self)
        try await acronym.save(on: req.db)
        return .ok
    }
    
    // MARK: - Read
    app.get("api", "acronyms") { req async throws -> Response in
        let acronyms = try await Acronym.query(on: req.db).all()
        if acronyms.count == 0 { return Response(status: .noContent) }
        let response = Response(status: .ok)
        try response.content.encode(acronyms)
        return response
    }
    
    // MARK: - Update
    app.put("api", "acronyms") { req async throws -> HTTPStatus in
        let updatedAcronym = try req.content.decode(Acronym.self)
        guard let currentAcronym = try await Acronym.find(updatedAcronym.id, on: req.db) else {
            return .notFound
        }
        currentAcronym.short = updatedAcronym.short
        currentAcronym.long = updatedAcronym.long
        try await currentAcronym.update(on: req.db)
        return .ok
    }
    
    // MARK: - Delete
    app.delete("api", "acronyms") { req async throws -> HTTPStatus in
        guard let stringId = req.headers.first(name: "id") else { return .badRequest }
        let id = UUID(uuidString: stringId)
        guard let acronymToDelete = try await Acronym.find(id, on: req.db) else { return .notFound }
        try await acronymToDelete.delete(on: req.db)
        return .ok
    }
    
//    try app.register(collection: TodoController())
}
