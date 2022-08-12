//
//  ViewController.swift
//  RickandMortyApp
//
//  Created by Azamat Kenjebayev on 7/30/22.
//

import UIKit

class MainVC: UIViewController {


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
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose section"
        label.font = .systemFont(ofSize: 21, weight: .semibold)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.7155807614, green: 0.8470743895, blue: 0.2515230179, alpha: 1)
        return label
    }()
    
    private lazy var buttonLabel: UILabel = {
        let label = UILabel()
        label.text = "Characters"
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    private lazy var buttonLabel1: UILabel = {
        let label = UILabel()
        label.text = "Locations"
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    private lazy var buttonLabel2: UILabel = {
        let label = UILabel()
        label.text = "Episodes"
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    private lazy var overLayer: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.backgroundColor = .white.withAlphaComponent(0.5)
        return label
    }()
    
    private lazy var overLayer1: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.backgroundColor = .white.withAlphaComponent(0.5)
        return label
    }()
    
    private lazy var overLayer2: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.backgroundColor = .white.withAlphaComponent(0.5)
        return label
    }()
    
    private let characters: UIButton = {
        let view = UIButton()
        let image = UIImage(named: "rm-characters")
        view.setBackgroundImage(image, for: .normal)
        view.setTitleColor(UIColor.black, for: .normal)
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        view.layer.cornerCurve = .continuous
        return view
    }()
    
    private let locations: UIButton = {
        let view = UIButton()
        let image = UIImage(named: "rm-locations")
        view.setBackgroundImage(image, for: .normal)
        view.setTitleColor(UIColor.black, for: .normal)
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        view.layer.cornerCurve = .continuous
        return view
    }()
    
    private let episodes: UIButton = {
        let view = UIButton()
        let image = UIImage(named: "rm-episodes")
        view.setBackgroundImage(image, for: .normal)
        view.setTitleColor(UIColor.black, for: .normal)
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        view.layer.cornerCurve = .continuous
        return view
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1324388087, green: 0.1576339602, blue: 0.1870785356, alpha: 1)
        view.addSubview(scrollView)

        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(titleLabel)
        scrollViewContainer.addArrangedSubview(characters)
        scrollViewContainer.addArrangedSubview(locations)
        scrollViewContainer.addArrangedSubview(episodes)
        scrollViewContainer.applyShadow(cornerRadius: 16)
        characters.addSubview(overLayer)
        characters.addSubview(buttonLabel)
        locations.addSubview(overLayer1)
        locations.addSubview(buttonLabel1)
        episodes.addSubview(overLayer2)
        episodes.addSubview(buttonLabel2)
        setupConstraints()
        
        characters.addTarget(self, action: #selector(charactersButton), for: .touchUpInside)
        locations.addTarget(self, action: #selector(locationsButton), for: .touchUpInside)
        episodes.addTarget(self, action: #selector(episodesButton), for: .touchUpInside)
    }
    
    @objc func charactersButton(){
        let nextVC = CharactersVC()
        self.navigationController?.pushViewController(nextVC, animated: false)
        print("Characters pressed")
    }

    @objc func locationsButton(){
        let nextVC = NothingVC()
        self.navigationController?.pushViewController(nextVC, animated: false)
        print("Locations pressed")
    }

    @objc func episodesButton(){
        let nextVC = NothingVC()
        self.navigationController?.pushViewController(nextVC, animated: false)
        print("Episodes pressed")
    }
}
    

extension MainVC {
    private func setupConstraints() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40)
        ])
        
        buttonLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonLabel.centerXAnchor.constraint(equalTo: characters.centerXAnchor),
            buttonLabel.centerYAnchor.constraint(equalTo: characters.centerYAnchor)
        ])
        
        buttonLabel1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonLabel1.centerXAnchor.constraint(equalTo: locations.centerXAnchor),
            buttonLabel1.centerYAnchor.constraint(equalTo: locations.centerYAnchor)
        ])
        
        buttonLabel2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonLabel2.centerXAnchor.constraint(equalTo: episodes.centerXAnchor),
            buttonLabel2.centerYAnchor.constraint(equalTo: episodes.centerYAnchor)
        ])
        
        overLayer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overLayer.centerXAnchor.constraint(equalTo: characters.centerXAnchor),
            overLayer.heightAnchor.constraint(equalToConstant: 200),
            overLayer.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        characters.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characters.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        overLayer1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overLayer1.centerXAnchor.constraint(equalTo: locations.centerXAnchor),
            overLayer1.heightAnchor.constraint(equalToConstant: 200),
            overLayer1.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        locations.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locations.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        
        overLayer2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overLayer2.centerXAnchor.constraint(equalTo: episodes.centerXAnchor),
            overLayer2.heightAnchor.constraint(equalToConstant: 200),
            overLayer2.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        episodes.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            episodes.heightAnchor.constraint(equalToConstant: 200)
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
