import Foundation

/// Drives the article list screen.
final class ArticleListViewModel: ObservableObject {

    @Published var articles: [Article] = []
    @Published var bookmarkedIDs: Set<Int> = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service = ArticleService()

    func loadArticles() {
        isLoading = true
        errorMessage = nil

        Task {
            do {
                let fetched = try await service.fetchArticles()
                self.articles = fetched
                self.isLoading = false
            } catch {
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
        }
    }

    func isBookmarked(_ articleID: Int) -> Bool {
        bookmarkedIDs.contains(articleID)
    }

    /// Toggle the bookmarked state of the article with the given id.
    ///
    /// TODO: Not implemented yet. Tapping the bookmark button on a row should
    /// add `articleID` to `bookmarkedIDs` if it isn't there, or remove it if it
    /// is — and the row's icon should update to match.
    func toggleBookmark(_ articleID: Int) {
        // TODO: implement me
    }
}
