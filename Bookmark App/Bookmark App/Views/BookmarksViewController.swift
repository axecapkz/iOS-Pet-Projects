//
//  SecondScreenVC.swift
//  BookmarkAppUIKit
//
//  Created by Azamat Kenjebayev on 4/18/24.
//

import UIKit
import WebKit

class BookmarksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var links: [LinkModel] = LinkStorage.linkModels
    
    private var topLabel: UILabel = {
    let label = UILabel()
        label.text = "Bookmark App"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    private var addedLabel: UILabel = {
    let label = UILabel()
        label.text = "List"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    private var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Save your first bookmark"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add bookmark", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonAddPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonAddPressed() {
        showAlert()
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 238/255, alpha: 1)
        return tableView
    }()
    
    private func addLink(title: String, link: String) {
        self.links.append(LinkModel(title: title, link: link))
        LinkStorage.linkModels.append(LinkModel(title: title, link: link))
        self.tableView.reloadData()
        checkLinks()
    }
    
    private func checkLinks() {
        if links.isEmpty {
            tableView.isHidden = true
            topLabel.isHidden = false
            addedLabel.isHidden = true
        } else {
            tableView.isHidden = false
            topLabel.isHidden = true
            addedLabel.isHidden = false
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Change", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Save", style: .default) {_ in
            guard let title = alert.textFields?[0].text, title != "" else {return}
            guard let link = alert.textFields?[1].text, link != "" else {return}
            self.addLink(title: title, link: link)
        }
        alert.addTextField { (title) in
            title.placeholder = "Bookmark Title"}
        alert.addTextField { (link) in
            link.placeholder = "Bookmark Link"}
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in
        }))
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        checkLinks()
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 238/255, alpha: 1)
        [topLabel, mainLabel, addedLabel, addButton, tableView].forEach {
            $0?.translatesAutoresizingMaskIntoConstraints = false
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Links")
        view.addSubview(topLabel)
        view.addSubview(mainLabel)
        view.addSubview(addButton)
        view.addSubview(addedLabel)
        view.addSubview(tableView)
        setContraints()
    }

    func setContraints() {
        topLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(56)
            make.centerX.equalTo(view.snp.centerX)
        }

        addedLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(56)
            make.centerX.equalTo(view.snp.centerX)
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(119)
            make.bottom.equalTo(view.snp.bottom).offset(-110)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }

        mainLabel.snp.makeConstraints { make in
            make.width.equalTo(358)
            make.height.equalTo(92)
            make.centerY.equalTo(view.snp.centerY)
            make.centerX.equalTo(view.snp.centerX)
        }

        addButton.snp.makeConstraints { make in
            make.width.equalTo(358)
            make.height.equalTo(52)
            make.bottom.equalTo(view.snp.bottom).offset(-50)
            make.left.equalTo(view.snp.left).offset(16)
            make.right.equalTo(view.snp.right).offset(-16)
        }
    }
}

extension BookmarksViewController: CustomTableViewCellDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.links.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Links", for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        cell.delegate = self
        cell.configure(name: links[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            links.remove(at: indexPath.row)
            LinkStorage.linkModels.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            checkLinks()
        }
    }
    
    func openLink(_ url: URL) {
        let webVC = WebViewController()
        webVC.url = url
        navigationController?.pushViewController(webVC, animated: true)
    }
}

