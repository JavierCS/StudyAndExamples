/*:
# Concurrency
*/

/**
 Swift is a type-safe language, which means the language helps you to be clear about the types of values your code can work with.
 */

import Foundation

// MARK: - Defining and Calling Asynchronous Functions

func listPhotos(inGallery name: String) async throws -> [String] {
    try await Task.sleep(for: .seconds(2))
    return ["IMG001", "IMG99", "IMG0404"]
}

func nonThrowingListPhotos() async -> Result<[String], Error> {
    do {
        let photos = try await listPhotos(inGallery: "Test")
        return .success(photos)
    } catch {
        return .failure(error)
    }
}

let photos = try await listPhotos(inGallery: "Test")
let nonThrowingPhotosResult = await nonThrowingListPhotos()
