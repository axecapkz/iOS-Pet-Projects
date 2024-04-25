//
//  CryptoCoinTableViewCell.swift
//  CryptoCoinApp
//
//  Created by Azamat Kenjebayev on 4/25/24.
//

import UIKit
import SnapKit

class CryptoCoinTableViewCell: UITableViewCell {
    
    let coinLabel: UILabel = {
        let title = UILabel()
        title.text = "No coin"
        title.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return title
    }()
    
    let coinImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        contentView.addSubview(coinLabel)
        coinLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(16)
            make.centerY.equalTo(contentView)
        }
        
        contentView.addSubview(coinImage)
        coinImage.snp.makeConstraints { make in
            make.trailing.equalTo(contentView).offset(-16)
            make.centerY.equalTo(contentView)
            make.width.height.equalTo(30)
        }
    }
    
}
