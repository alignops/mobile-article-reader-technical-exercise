import Foundation

/// A single article returned by the API.
///
/// The endpoint returns objects with `id`, `title`, and `body` fields.
/// We only need those three here.
struct Article: Identifiable, Codable {
    let id: Int
    let title: String
    let content: String
}
