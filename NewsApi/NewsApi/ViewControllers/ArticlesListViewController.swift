//
//  ViewController.swift
//  NewsApi
//
//  Created by Azamat Kenjebayev on 4/30/24.
//

import UIKit
import SnapKit

class ArticlesListViewController: UICollectionViewController {
    
    private let viewModel = ArticlesListViewModel()
    private var customCollectionView: UICollectionView! // Изменено название свойства

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .white
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "ArticleCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        bindViewModel()
        viewModel.fetchArticles()
    }

    private func bindViewModel() {
        viewModel.reloadCollectionViewClosure = { [weak self] in
            // Используйте безопасное развертывание collectionView здесь
            if let collectionView = self?.collectionView {
                collectionView.reloadData()
            } else {
                print("collectionView is nil")
            }
        }
        viewModel.showErrorClosure = { error in
            print("Error fetching articles: \(error.localizedDescription)")
        }
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10 // Минимальный отступ между строками
        layout.minimumInteritemSpacing = 10 // Минимальный отступ между ячейками в одной строке

        let width = (collectionView.bounds.width - 10 * 3) / 2 // Ширина ячейки для двух статей в одной строке
        let height: CGFloat = 250 // Высота ячейки (можете настроить под свои требования)

        layout.itemSize = CGSize(width: width, height: height) // Устанавливаем размер ячейки

        return layout
    }
}

extension ArticlesListViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.articles.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCell", for: indexPath) as! CustomCollectionViewCell
        let article = viewModel.articles[indexPath.item]
        cell.configure(with: article)
        return cell
    }
}

extension ArticlesListViewController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewModel = ArticlesDetailViewModel()
        detailViewModel.article = viewModel.articles[indexPath.item]
        let detailViewController = ArticlesDetailViewController(viewModel: detailViewModel)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
