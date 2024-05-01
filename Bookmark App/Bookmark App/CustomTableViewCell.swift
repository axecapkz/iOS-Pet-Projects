//
//  CustomTableViewCell.swift
//  BookmarkAppUIKit
//
//  Created by Azamat Kenjebayev on 4/18/24.
//

import UIKit
import SnapKit

protocol CustomTableViewCellDelegate: AnyObject {
    func openLink(_ url: URL)
}

class CustomTableViewCell: UITableViewCell {
    
    weak var delegate: CustomTableViewCellDelegate?
    
    private var arrowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "arrow")
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
    
    private var linkModel: LinkModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 238/255, alpha: 1)
        contentView.addSubview(arrowImage)
        contentView.addSubview(nameLabel)
        setConstraints()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        contentView.addGestureRecognizer(tapGesture)
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
        linkModel = name
    }
    
    @objc func cellTapped() {
        if let urlString = linkModel?.link, let url = URL(string: "https://" + urlString) {
            delegate?.openLink(url)
        }
    }
}
