//
//  UIView+Extension.swift
//  IT-School-Terra
//
//  Created by Azamat Kenjebayev on 8/12/22.
//

import UIKit

extension UIView {
    func applyShadow(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 0.30
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }
}

/* ТЕНЬ!
 Пример применения в ячейке:
 
 override func layoutSubviews() {
     super.layoutSubviews()
 
     applyShadow(cornerRadius: self.frame.width / 10)
 }
 
 Пример в работе с UI:
 titleLabel.applyShadow(cornerRadius: 5)
 */

