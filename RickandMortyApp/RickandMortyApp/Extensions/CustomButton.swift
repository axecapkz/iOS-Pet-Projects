//
//  CustomButton.swift
//  RickandMortyApp
//
//  Created by Azamat Kenjebayev on 8/2/22.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(titleColor: UIColor, title: String){
        super.init(frame: .zero)
        setTitleColor(titleColor, for: .normal)
        setTitle(title, for: .normal)
        configure()
    }
    
    func configure(){
        titleLabel?.font = .systemFont(ofSize: 19, weight: .semibold)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
