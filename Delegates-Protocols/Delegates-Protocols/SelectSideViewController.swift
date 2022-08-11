//
//  RebelViewController.swift
//  Delegates-Protocols
//
//  Created by Azamat Kenjebayev on 8/10/22.
//

import UIKit

protocol SideSelectionDelegate {
    func didTapChoice(image: UIImage, name: String, color: UIColor)
}

class SelectSideViewController: UIViewController {
    
    var selectionDelegate: SideSelectionDelegate!
    
    lazy var showResetButton: Bool = false
    
    private lazy var rebelImageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "rebel"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(rebelButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var imperialImageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "imperial"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(imperialButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var chooseYourSideLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose Your Side"
        label.textColor = .yellow
        label.font = .systemFont(ofSize: 33, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(chooseYourSideLabel)
        view.addSubview(imperialImageButton)
        view.addSubview(rebelImageButton)
        
        setConstraints()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @objc func rebelButtonTapped(){
        _ = navigationController?.popViewController(animated: true)
        selectionDelegate.didTapChoice(image: UIImage(named: "luke")!, name: "Luke SkyWalker", color: .cyan)
        print("Rebel selected")
    }
    
    @objc func imperialButtonTapped(){
        _ = navigationController?.popViewController(animated: true)
        selectionDelegate.didTapChoice(image: UIImage(named: "vader")!, name: "Darth Vader", color: .red)
        print("Imperial selected")
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            chooseYourSideLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            chooseYourSideLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imperialImageButton.topAnchor.constraint(equalTo: chooseYourSideLabel.bottomAnchor, constant: 70),
            imperialImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imperialImageButton.heightAnchor.constraint(equalToConstant: 150),
            imperialImageButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            rebelImageButton.topAnchor.constraint(equalTo: imperialImageButton.bottomAnchor, constant: 50),
            rebelImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rebelImageButton.heightAnchor.constraint(equalToConstant: 150),
            rebelImageButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        
    }
}
