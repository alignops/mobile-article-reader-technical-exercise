import Foundation

/// Loads articles from the remote endpoint.
struct ArticleService {

    private let endpoint = URL(string: "https://jsonplaceholder.typicode.com/posts")!

    func fetchArticles() async throws -> [Article] {
        let (data, response) = try await URLSession.shared.data(from: endpoint)

        guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode([Article].self, from: data)
    }
}
