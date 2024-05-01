//
//  ViewController.swift
//  NewsApi
//
//  Created by Azamat Kenjebayev on 4/30/24.
//

import UIKit
import SnapKit
import Alamofire
import AlamofireImage

class ArticlesListViewController: UIViewController {
    
    private let tableView = UITableView()
    private var articleData = [ArticleListModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Articles List"
        setTableView()
        fetchArticlesData()
    }
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "ArticleCell")
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func fetchArticlesData() {
        NetworkManager.shared.fetchData { [weak self] (articleList, error) in
            guard let self = self else { return }
            
            if let error = error {
                print("Error fetching articles: \(error.localizedDescription)")
                return
            }
            
            if let articleList = articleList {
                self.articleData = articleList
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension ArticlesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! CustomTableViewCell
        
        let article = articleData[indexPath.row]
        cell.articleLabel.text = article.title
        
        cell.articleImage.image = nil
        
        if let urlString = article.urlToImage, let url = URL(string: urlString) {
            cell.articleImage.af.setImage(withURL: url)
        } else {
            cell.articleImage.image = UIImage(named: "placeholder_image")
        }
        
        return cell
    }
}

extension ArticlesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = ArticlesDetailViewController()
        detailViewController.article = articleData[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}


