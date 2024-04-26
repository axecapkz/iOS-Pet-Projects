//
//  LinkModel.swift
//  BookmarkAppUIKit
//
//  Created by Azamat Kenjebayev on 4/18/24.
//

import Foundation

class LinkModel: Codable {
    var title: String
    var link: String
    
    init(title: String, link: String) {
        self.title = title
        self.link = link
    }
}
