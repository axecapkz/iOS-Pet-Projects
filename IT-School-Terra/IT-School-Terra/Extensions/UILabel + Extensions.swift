//
//  UILabel + Extensions.swift
//  IT-School-Terra
//
//  Created by Azamat Kenjebayev on 8/12/22.
//

import UIKit

extension UILabel {
    convenience init(text: String = "", font: UIFont?, color: UIColor, line: Int) {
        self.init()
        
        self.numberOfLines = line
        self.text = text
        self.font = font
        self.textColor = color
        self.textAlignment = .left
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

// let nameLabel = UILabel(text: "Какой-то текст", font: UIFont.systemFont(ofSize: 21), color: .specialBlack, line: 1)
