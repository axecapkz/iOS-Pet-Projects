//
//  CryptoListModel.swift
//  CryptoCoinApp
//
//  Created by Azamat Kenjebayev on 4/25/24.
//

import Foundation

struct CryptoListModel: Codable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let currentPrice: Double
    let marketCap: Double
    let marketCapRank: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case name
        case image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
    }
}
