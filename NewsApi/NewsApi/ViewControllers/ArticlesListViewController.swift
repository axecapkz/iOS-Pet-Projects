//
//  ViewController.swift
//  NewsApi
//
//  Created by Azamat Kenjebayev on 4/30/24.
//

import UIKit
import SnapKit

class ArticlesListViewController: UIViewController {
    
    private let tableView = UITableView()
    private let viewModel = ArticlesListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Articles List"
        setTableView()
        bindViewModel()
        viewModel.fetchArticles()
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
    
    private func bindViewModel() {
        viewModel.reloadTableViewClosure = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.showErrorClosure = { error in
            print("Error fetching articles: \(error.localizedDescription)")
        }
    }
}

extension ArticlesListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! CustomTableViewCell
        let article = viewModel.articles[indexPath.row]
        cell.configure(with: article)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewModel = ArticlesDetailViewModel()
        detailViewModel.article = viewModel.articles[indexPath.row]
        let detailViewController = ArticlesDetailViewController(viewModel: detailViewModel)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}



