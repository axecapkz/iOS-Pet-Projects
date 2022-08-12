//
//  MortyVC.swift
//  RickandMortyApp
//
//  Created by Azamat Kenjebayev on 8/2/22.
//

import UIKit

class MortyVC: UIViewController {
    
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
    
    private lazy var morty: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "characters-morty")
        image.clipsToBounds = true
        image.layer.cornerRadius = 16
        image.layer.cornerCurve = .continuous
        return image
    }()
    
    private lazy var name = UILabel(text: "Name: ", font: .systemFont(ofSize: 18, weight: .semibold), color: #colorLiteral(red: 0.7155807614, green: 0.8470743895, blue: 0.2515230179, alpha: 1), line: 1)
    private lazy var status = UILabel(text: "Status: ", font: .systemFont(ofSize: 18, weight: .semibold), color: #colorLiteral(red: 0.7155807614, green: 0.8470743895, blue: 0.2515230179, alpha: 1), line: 1)
    private lazy var species = UILabel(text: "Species: ", font: .systemFont(ofSize: 18, weight: .semibold), color: #colorLiteral(red: 0.7155807614, green: 0.8470743895, blue: 0.2515230179, alpha: 1), line: 1)
    private lazy var gender = UILabel(text: "Gender: ", font: .systemFont(ofSize: 18, weight: .semibold), color: #colorLiteral(red: 0.7155807614, green: 0.8470743895, blue: 0.2515230179, alpha: 1), line: 1)
    private lazy var noname = UILabel(text: "...: ", font: .systemFont(ofSize: 18, weight: .semibold), color: #colorLiteral(red: 0.7155807614, green: 0.8470743895, blue: 0.2515230179, alpha: 1), line: 1)
    private lazy var nameMorty = UILabel(text: "Morty", font: .systemFont(ofSize: 18, weight: .regular), color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), line: 1)
    private lazy var alive = UILabel(text: "Alive", font: .systemFont(ofSize: 18, weight: .regular), color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), line: 1)
    private lazy var human = UILabel(text: "Human", font: .systemFont(ofSize: 18, weight: .regular), color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), line: 1)
    private lazy var male = UILabel(text: "Male", font: .systemFont(ofSize: 18, weight: .regular), color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), line: 1)
    private lazy var noStatus = UILabel(text: "...", font: .systemFont(ofSize: 18, weight: .regular), color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), line: 1)
    
    private var firstStackView = UIStackView()
    private var secondStackView = UIStackView()
    private var thirdStackView = UIStackView()
    private var fourthStackView = UIStackView()
    private var fifthStackView = UIStackView()
    
    private func setupUIStackView() {
        firstStackView = UIStackView(arrangedSubviews:
                                        [name,
                                         nameMorty],
                                     axis: .horizontal,
                                     spacing: 0)
        secondStackView = UIStackView(arrangedSubviews:
                                        [status,
                                         alive],
                                     axis: .horizontal,
                                     spacing: 0)
        thirdStackView = UIStackView(arrangedSubviews:
                                        [species,
                                         human],
                                     axis: .horizontal,
                                     spacing: 0)
        fourthStackView = UIStackView(arrangedSubviews:
                                        [gender,
                                         male],
                                     axis: .horizontal,
                                     spacing: 0)
        fifthStackView = UIStackView(arrangedSubviews:
                                        [noname,
                                         noStatus],
                                     axis: .horizontal,
                                     spacing: 0)
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1324388087, green: 0.1576339602, blue: 0.1870785356, alpha: 1)
        setupUIStackView()
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(morty)
        scrollViewContainer.addArrangedSubview(firstStackView)
        scrollViewContainer.addArrangedSubview(secondStackView)
        scrollViewContainer.addArrangedSubview(thirdStackView)
        scrollViewContainer.addArrangedSubview(fourthStackView)
        scrollViewContainer.addArrangedSubview(fifthStackView)
        setupConstraints()
        
        let backBarBtnItem = UIBarButtonItem()
        backBarBtnItem.title = ""
        navigationController?.navigationBar.backItem?.backBarButtonItem = backBarBtnItem
        backBarBtnItem.tintColor = #colorLiteral(red: 0.7155807614, green: 0.8470743895, blue: 0.2515230179, alpha: 1)
        
        
        let nav = self.navigationController?.navigationBar
        self.title = "Morty"
        nav?.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 23, weight: UIFont.Weight.bold), .foregroundColor: #colorLiteral(red: 0.7155807614, green: 0.8470743895, blue: 0.2515230179, alpha: 1)]
        nav?.barStyle = UIBarStyle.black
    }
}

extension MortyVC {
    private func setupConstraints() {
        
        morty.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            morty.heightAnchor.constraint(equalToConstant: 430)
        ])
        
        name.translatesAutoresizingMaskIntoConstraints = false
        status.translatesAutoresizingMaskIntoConstraints = false
        species.translatesAutoresizingMaskIntoConstraints = false
        gender.translatesAutoresizingMaskIntoConstraints = false
        noname.translatesAutoresizingMaskIntoConstraints = false
        
        nameMorty.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameMorty.centerXAnchor.constraint(equalTo: name.superview!.centerXAnchor, constant: 50)
        ])
        alive.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            alive.centerXAnchor.constraint(equalTo: status.superview!.centerXAnchor, constant: 50)
        ])
        human.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            human.centerXAnchor.constraint(equalTo: species.superview!.centerXAnchor, constant: 50)
        ])
        male.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            male.centerXAnchor.constraint(equalTo: gender.superview!.centerXAnchor, constant: 50)
        ])
        noStatus.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            noStatus.centerXAnchor.constraint(equalTo: noname.superview!.centerXAnchor, constant: 50)
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

