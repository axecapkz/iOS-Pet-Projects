//
//  NothingVC.swift
//  RickandMortyApp
//
//  Created by Azamat Kenjebayev on 7/31/22.
//

import UIKit

class NothingVC: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private let scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        return view
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Look Morty! \n There's nothing there!"
        label.textColor = #colorLiteral(red: 0.7155807614, green: 0.8470743895, blue: 0.2515230179, alpha: 1)
        label.font = .systemFont(ofSize: 21, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let emptyResponseImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "empty-response")
        imageView.image = image
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        view.backgroundColor = #colorLiteral(red: 0.1324388087, green: 0.1576339602, blue: 0.1870785356, alpha: 1)
//        scrollViewContainer.addSubview(label)
//        scrollViewContainer.addSubview(emptyResponseImage)
        scrollViewContainer.addArrangedSubview(emptyResponseImage)
        scrollViewContainer.addArrangedSubview(label)
        configureLayout()
        
        let backBarBtnItem = UIBarButtonItem()
        backBarBtnItem.title = "Back"
        navigationController?.navigationBar.backItem?.backBarButtonItem = backBarBtnItem
        backBarBtnItem.tintColor = #colorLiteral(red: 0.7155807614, green: 0.8470743895, blue: 0.2515230179, alpha: 1)
    }

}

extension NothingVC {
    private func configureLayout() {
        
        emptyResponseImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            emptyResponseImage.widthAnchor.constraint(equalToConstant:325),
//            emptyResponseImage.heightAnchor.constraint(equalToConstant: 400),
            emptyResponseImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            emptyResponseImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50)
        ])
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            label.topAnchor.constraint(equalTo: emptyResponseImage.bottomAnchor, constant: 30)
        ])
        
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        scrollViewContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

    }
}
