//
//  CryptoCoinDetailViewController.swift
//  CryptoCoinApp
//
//  Created by Azamat Kenjebayev on 4/25/24.
//

import UIKit
import SnapKit

class CryptoCoinDetailViewController: UIViewController {
    
    var cryptoCoin: CryptoListModel?
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setConstraints()
        setUI()
    }

    private func setUI() {
        guard let cryptoCoin = cryptoCoin else { return }
 
        let cryptoName = UILabel()
        cryptoName.text = cryptoCoin.name
        cryptoName.textAlignment = .center
        stackView.addArrangedSubview(cryptoName)
        
        let cryptoPriceLabel = UILabel()
        cryptoPriceLabel.text = "Price: \(cryptoCoin.currentPrice) USD"
        cryptoPriceLabel.textAlignment = .center
        stackView.addArrangedSubview(cryptoPriceLabel)
        
        let cryptoMarketCap = UILabel()
        cryptoMarketCap.text = "Market cap: \(cryptoCoin.marketCap)"
        cryptoMarketCap.textAlignment = .center
        stackView.addArrangedSubview(cryptoMarketCap)
        
        if let url = URL(string: cryptoCoin.image) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
                
            }.resume()
        }
    }
    
    private func setConstraints() {
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
            make.bottom.equalTo(stackView.snp.top).offset(-15)
        }
    }
    
}
