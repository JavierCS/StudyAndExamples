import NIOSSL
import Fluent
import FluentSQLiteDriver
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

//    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)
    app.databases.use(.sqlite(.memory), as: .sqlite)

    app.migrations.add(CreateAcronym())
    
    try await app.autoMigrate()

    // register routes
    try routes(app)
}
