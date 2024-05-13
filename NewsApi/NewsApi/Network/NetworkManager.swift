//
//  NetworkManager.swift
//  NewsApi
//
//  Created by Azamat Kenjebayev on 4/30/24.
//

import UIKit
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    private let baseURL = "https://newsapi.org/v2"
    private let endpoint = "/everything?q=tesla&from=2024-04-13&sortBy=publishedAt&apiKey=3a1615c53f7c4e3fa5d042887f318502"
    
    func fetchData(completion: @escaping ([ArticleListModel]?, Error?) -> Void) {
        let url = "\(baseURL)\(endpoint)"
        
        AF.request(url).responseDecodable(of: Articles.self) { response in
            switch response.result {
            case .success(let articlesResponse):
                completion(articlesResponse.articles, nil)
            case .failure(let error):
                print("Error fetching articles: \(error.localizedDescription)")
                completion(nil, error)
            }
        }
    }
}

