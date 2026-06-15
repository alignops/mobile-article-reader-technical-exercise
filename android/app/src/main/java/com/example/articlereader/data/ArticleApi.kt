package com.example.articlereader.data

import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.GET

interface ArticleService {
    @GET("posts")
    suspend fun getArticles(): List<Article>
}

/** Builds and exposes the Retrofit-backed [ArticleService]. */
object ArticleApi {

    private const val BASE_URL = "https://jsonplaceholder.typicode.com/"

    val service: ArticleService by lazy {
        Retrofit.Builder()
            .baseUrl(BASE_URL)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(ArticleService::class.java)
    }
}
