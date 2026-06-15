import SwiftUI

struct ArticleListView: View {

    @StateObject private var viewModel = ArticleListViewModel()

    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Articles")
        }
        .onAppear {
            if viewModel.articles.isEmpty {
                viewModel.loadArticles()
            }
        }
    }

    @ViewBuilder
    private var content: some View {
        if viewModel.isLoading {
            ProgressView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else if let message = viewModel.errorMessage {
            ErrorView(message: message) {
                viewModel.loadArticles()
            }
        } else {
            List(viewModel.articles) { article in
                ArticleRow(
                    article: article,
                    isBookmarked: viewModel.isBookmarked(article.id),
                    onToggleBookmark: { viewModel.toggleBookmark(article.id) }
                )
            }
            .listStyle(.plain)
        }
    }
}

private struct ArticleRow: View {
    let article: Article
    let isBookmarked: Bool
    let onToggleBookmark: () -> Void

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title)
                    .font(.headline)
                Text(article.content)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(3)
            }
            Spacer(minLength: 0)
            Button(action: onToggleBookmark) {
                Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
            }
            .buttonStyle(.borderless)
            .accessibilityLabel(isBookmarked ? "Remove bookmark" : "Add bookmark")
        }
        .padding(.vertical, 4)
    }
}

private struct ErrorView: View {
    let message: String
    let onRetry: () -> Void

    var body: some View {
        VStack(spacing: 12) {
            Text("Couldn't load articles")
                .font(.headline)
            Text(message)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            Button("Retry", action: onRetry)
                .buttonStyle(.borderedProminent)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
