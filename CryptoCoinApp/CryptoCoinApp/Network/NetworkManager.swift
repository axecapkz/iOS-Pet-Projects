//
//  NetworkManager.swift
//  CryptoCoinApp
//
//  Created by Azamat Kenjebayev on 4/25/24.
//

import UIKit
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let baseURL = "https://api.coingecko.com/api/v3"
    private let endpoint = "/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"
    
//    func fetchData(completion: @escaping ([CryptoListModel]?, Error?) -> Void) {
//        guard let url = URL(string: "\(baseURL)\(endpoint)") else {
//            let error = NSError(domain: "Invalid URL", code: 0, userInfo: nil)
//            completion(nil, error)
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data else {
//                completion(nil, error)
//                return
//            }
//            
//            do {
//                let decoder = JSONDecoder()
//                let cryptoList = try decoder.decode([CryptoListModel].self, from: data)
//                completion(cryptoList, nil)
//                print("Crypto coins: \(cryptoList)")
//            } catch {
//                completion(nil, error)
//            }
//        }.resume()
//    }
    
    func fetchData(completion: @escaping ([CryptoListModel]?, Error?) -> Void) {
        let url = "\(baseURL)\(endpoint)"

        AF.request(url).responseDecodable { (response: DataResponse<[CryptoListModel], AFError>) in
            switch response.result {
            case .success(let cryptoList):
                completion(cryptoList, nil)
                print("Crypto coins: \(cryptoList)")
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}

