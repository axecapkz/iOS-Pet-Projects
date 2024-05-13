//
//  ArticlesDetailViewModel.swift
//  NewsApi
//
//  Created by Azamat Kenjebayev on 5/13/24.
//

import Foundation

class ArticlesDetailViewModel {
    
    var article: ArticleListModel?
    
    var title: String {
        return article?.title ?? ""
    }
    
    var description: String? {
        return article?.description
    }
    
    var imageUrl: URL? {
        if let urlString = article?.urlToImage {
            return URL(string: urlString)
        }
        return nil
    }
}
