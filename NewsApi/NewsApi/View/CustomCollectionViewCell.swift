//
//  CustomCollectionViewCell.swift
//  NewsApi
//
//  Created by Azamat Kenjebayev on 5/14/24.
//

import UIKit
import SnapKit
import AlamofireImage

class CustomCollectionViewCell: UICollectionViewCell {

    let articleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        return label
    }()

    let articleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        contentView.addSubview(articleLabel)
        articleLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }

        contentView.addSubview(articleImage)
        articleImage.snp.makeConstraints { make in
            make.top.equalTo(articleLabel.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

    func configure(with article: ArticleListModel) {
        articleLabel.text = article.title
        articleImage.image = nil

        if let urlString = article.urlToImage, let url = URL(string: urlString) {
            articleImage.af.setImage(withURL: url)
        } else {
            articleImage.image = UIImage(named: "placeholder_image")
        }
    }
}

