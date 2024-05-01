//
//  CustomTableViewCell.swift
//  BookmarkAppUIKit
//
//  Created by Azamat Kenjebayev on 4/18/24.
//

import UIKit
import SDWebImage

protocol CustomTableViewCellDelegate: AnyObject {
    func openLink(_ url: URL)
}

class CustomTableViewCell: UITableViewCell {
    
    weak var delegate: CustomTableViewCellDelegate?
    
    private var arrowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var linkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 238/255, alpha: 1)
        contentView.addSubview(arrowImage)
        contentView.addSubview(nameLabel)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(arrowImage.snp.leading).offset(-10)
            make.centerY.equalToSuperview()
        }
        
        arrowImage.snp.makeConstraints { make in
            make.width.equalTo(18)
            make.height.equalTo(32)
            make.right.equalToSuperview().offset(-18)
            make.centerY.equalToSuperview()
        }
    }
    
    func configure(name: LinkModel) {
        nameLabel.text = name.title
        linkLabel.text = name.link
        if let imageUrl = URL(string: name.imageUrl) {
            arrowImage.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "default_placeholder"))
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func openLink() {
        openURL()
    }
    
    private func openURL() {
        if let urlString = linkLabel.text, let url = URL(string: "https://" + urlString) {
            delegate?.openLink(url)
        }
    }
}
