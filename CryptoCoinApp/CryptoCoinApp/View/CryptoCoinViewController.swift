//
//  ViewController.swift
//  CryptoCoinApp
//
//  Created by Azamat Kenjebayev on 4/25/24.
//

import UIKit
import SnapKit
import AlamofireImage

class CryptoCoinViewController: UIViewController {
    
    private let tableView = UITableView()
    private var cryptoData = [CryptoListModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Crypto List"
        setTableView()
        fetchCryptoCoinsData()
    }
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CryptoCoinTableViewCell.self, forCellReuseIdentifier: "CryptoCell")
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    private func fetchCryptoCoinsData() {
        NetworkManager.shared.fetchData { [weak self] (cryptoCoin, error) in
            guard let self = self else { return }
            
            if let error = error {
                print("Something gone wrong -> \(error.localizedDescription)")
                return
            }
            
            if let cryptoCoin = cryptoCoin {
                self.cryptoData  = cryptoCoin
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension CryptoCoinViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoCoinTableViewCell
        
        let cryptoCoin = cryptoData[indexPath.row]
        cell.coinLabel.text = "\(cryptoCoin.name)"
        if let url = URL(string: cryptoCoin.image) {
            cell.coinImage.af.setImage(withURL: url)
        }
        return cell
    }
}

extension CryptoCoinViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = CryptoCoinDetailViewController()
        detailViewController.cryptoCoin = cryptoData[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
