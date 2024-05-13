//
//  ArticlesDetailViewController.swift
//  NewsApi
//
//  Created by Azamat Kenjebayev on 4/30/24.
//

import UIKit
import SnapKit
import AlamofireImage

class ArticlesDetailViewController: UIViewController {
    
    private let viewModel: ArticlesDetailViewModel
    var article: ArticleListModel?

    private let scrollView = UIScrollView()

    private let contentView = UIView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    private let imageView = UIImageView()
    
    init(viewModel: ArticlesDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    private func setupUI() {
        guard let article = viewModel.article else {
            return
        }

        titleLabel.text = article.title
        descriptionLabel.text = article.description

        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(view)
        }

        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(8)
        }
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.lessThanOrEqualTo(contentView.safeAreaLayoutGuide).offset(-20)
        }

        if let urlString = article.urlToImage, let url = URL(string: urlString) {
            imageView.af.setImage(withURL: url)
        } else {
            imageView.image = UIImage(named: "placeholder_image")
        }
    }
}
