package com.example.articlereader.data

/**
 * A single article returned by the API.
 *
 * The endpoint returns objects with `id`, `title`, and `body` fields.
 * We only need those three here.
 */
data class Article(
    val id: Int,
    val title: String,
    val content: String,
)
