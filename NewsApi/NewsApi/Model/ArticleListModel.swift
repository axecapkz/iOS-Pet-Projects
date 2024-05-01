//
//  ArticleListModel.swift
//  NewsApi
//
//  Created by Azamat Kenjebayev on 4/30/24.
//

struct Articles: Codable {
    let articles: [ArticleListModel]
}

struct ArticleListModel: Codable {
    let title: String
    let description: String?
    let urlToImage: String?
}
