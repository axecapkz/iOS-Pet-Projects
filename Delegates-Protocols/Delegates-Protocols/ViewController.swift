//
//  ViewController.swift
//  Delegates-Protocols
//
//  Created by Azamat Kenjebayev on 8/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var showResetButton: Bool = false
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var selectButton: UIButton = {
        let button = UIButton()
        button.setTitle("Choose a side", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.layer.cornerCurve = .continuous
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(chooseSide), for: .touchUpInside)
        return button
    }()
    
    lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back to Main Screen", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .systemRed
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.layer.cornerCurve = .continuous
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(resetScreen), for: .touchUpInside)
        return button
    }()
    
    private lazy var showName: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = .systemFont(ofSize: 27, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(logo)
        view.addSubview(showName)
        view.addSubview(selectButton)
        view.addSubview(resetButton)
        if showResetButton == false {
        resetButton.isHidden = true
        }
        setConstraints()
        self.navigationItem.setHidesBackButton(true, animated: true)
 
    }
    
    @objc func chooseSide() {
        let nextVC = SelectSideViewController()
        self.navigationController?.pushViewController(nextVC, animated: false)
        nextVC.selectionDelegate = self
        resetButton.isHidden = false
        print("Select button pressed")
    }
    
    @objc func resetScreen() {
        let nextVC = ViewController()
        self.navigationController?.pushViewController(nextVC, animated: false)
        print("Reset button pressed")
    }
    
    private func setConstraints() {
       
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.widthAnchor.constraint(equalToConstant: 350)
        ])
        
        NSLayoutConstraint.activate([
            showName.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 30),
            showName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showName.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            selectButton.topAnchor.constraint(equalTo: showName.bottomAnchor, constant: 100),
            selectButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            selectButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            selectButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            resetButton.topAnchor.constraint(equalTo: selectButton.bottomAnchor, constant: 15),
            resetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            resetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])

    }

}

extension ViewController: SideSelectionDelegate {
    func didTapChoice(image: UIImage, name: String, color: UIColor) {
        logo.image = image
        showName.text = name
        view.backgroundColor = color
    }
}
