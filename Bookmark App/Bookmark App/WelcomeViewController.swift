//
//  ViewController.swift
//  Bookmark App
//
//  Created by Azamat Kenjebayev on 4/19/24.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
    
    private var bgImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bg")
        image.contentMode = .scaleToFill
        return image
    }()
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "Save all interesting links in one app"
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private var button: UIButton = {
        let button = UIButton()
        button.setTitle("Let’s start collecting", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
//        button.addAction(.init(handler: {_ in
//            self.buttonPressed()
//        }), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonPressed() {
        let nextVC = BookmarksViewController()
//        let nextVC = UINavigationController(rootViewController: SecondScreenVC())
        nextVC.modalPresentationStyle = .fullScreen
        navigationController?.present(nextVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(bgImage)
        view.addSubview(label)
        view.addSubview(button)
        setConstraints()
    }
    
    
    func setConstraints() {
        bgImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(bgImage.snp.bottom).offset(6)
            make.left.equalTo(16)
            make.width.equalTo(390)
            make.height.equalTo(92)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.width.equalTo(358)
            make.height.equalTo(58)
        }
        
    }
}
