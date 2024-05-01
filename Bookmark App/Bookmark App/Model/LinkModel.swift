//
//  LinkModel.swift
//  BookmarkAppUIKit
//
//  Created by Azamat Kenjebayev on 4/18/24.
//

import Foundation

struct LinkModel: Codable {
    var title: String
    var link: String
    var imageUrl: String

    private enum CodingKeys: String, CodingKey {
        case title, link, imageUrl
    }
}
