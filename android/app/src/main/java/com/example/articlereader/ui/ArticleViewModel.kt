package com.example.articlereader.ui

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.articlereader.data.Article
import com.example.articlereader.data.ArticleApi
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch

/** UI state for the article list screen. */
data class ArticleUiState(
    val isLoading: Boolean = false,
    val articles: List<Article> = emptyList(),
    val bookmarkedIds: Set<Int> = emptySet(),
    val errorMessage: String? = null,
)

class ArticleViewModel : ViewModel() {

    private val _uiState = MutableStateFlow(ArticleUiState())
    val uiState: StateFlow<ArticleUiState> = _uiState.asStateFlow()

    init {
        loadArticles()
    }

    fun loadArticles() {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true, errorMessage = null) }
            try {
                val articles = ArticleApi.service.getArticles()
                _uiState.update { it.copy(isLoading = false, articles = articles) }
            } catch (e: Exception) {
                _uiState.update {
                    it.copy(isLoading = false, errorMessage = e.message ?: "Something went wrong")
                }
            }
        }
    }

    /**
     * Toggle the bookmarked state of the article with the given id.
     *
     * TODO: Not implemented yet. Tapping the bookmark icon on a row should
     * add the article's id to [ArticleUiState.bookmarkedIds] if it isn't there,
     * or remove it if it is — and the row's icon should update to match.
     */
    fun toggleBookmark(articleId: Int) {
        // TODO: implement me
    }
}
