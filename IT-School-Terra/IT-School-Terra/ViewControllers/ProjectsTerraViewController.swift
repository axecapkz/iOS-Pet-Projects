//
//  ProjectsTerraViewController.swift
//  IT-School-Terra
//
//  Created by Azamat Kenjebayev on 8/12/22.
//

import UIKit

class ProjectsTerraViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let projectsLabel = UILabel(text: "Проекты Terra",
                                        font: .proDisplayBold18(),
                                        color: .specialBlack,
                                        line: 0)
    
    private let firstLabel = UILabel(text: "Terra Мастер-класс",
                                     font: .proDisplayBold18(),
                                     color: .specialBlack,
                                     line: 0)
    
    private let firstInfoLabel = UILabel(text: "Обучающие МК от топовых спикеров каждый четверг в Москва-Сити",
                                         font:  .proDisplayRegular12(),
                                         color: .specialDarkGray,
                                         line: 0)
    
    private let secondLabel = UILabel(text: "Школа управления",
                                      font: .proDisplayBold18(),
                                      color: .specialBlack,
                                      line: 0)
    
    private let secondInfoLabel = UILabel(text: "Добавляем после личного собеседования с руководителем данного проекта",
                                          font:  .proDisplayRegular12(),
                                          color: .specialDarkGray,
                                          line: 0)
    
    private let thirdLabel = UILabel(text: "Terra Мафия",
                                     font: .proDisplayBold18(),
                                     color: .specialBlack,
                                     line: 0)
    
    private let thirdInfoLabel = UILabel(text: "Развивающие игры в мафию оффлайн",
                                         font:  .proDisplayRegular12(),
                                         color: .specialDarkGray,
                                         line: 0)
    
    private let fourthLabel = UILabel(text: "Terra Управленческие поединки",
                                     font: .proDisplayBold18(),
                                     color: .specialBlack,
                                     line: 0)
    
    private let fourthInfoLabel = UILabel(text: "Управленческий поединок (УП) - это ролевая управлен-ческая игра, погружающая Вас в конфликтные и острые бизнес-переговоры, дающая возможность обрести навык отстаивания и достижения своих интересов",
                                         font:  .proDisplayRegular12(),
                                         color: .specialDarkGray,
                                         line: 0)
    
    private let fifthLabel = UILabel(text: "Terra HR",
                                     font: .proDisplayBold18(),
                                     color: .specialBlack,
                                     line: 0)
    
    private let fifthInfoLabel = UILabel(text: "Обучающие МК от топовых спикеров каждый четверг в Москва-Сити",
                                         font:  .proDisplayRegular12(),
                                         color: .specialDarkGray,
                                         line: 0)
    
    private let sixthLabel = UILabel(text: "Terra English",
                                   font: .proDisplayBold18(),
                                   color: .specialBlack,
                                   line: 0)
    
    private let sixthInfoLabel = UILabel(text: "Английский язык",
                                       font:  .proDisplayRegular12(),
                                       color: .specialDarkGray,
                                       line: 0)
    
    private let seventhLabel = UILabel(text: "Terra Онлайн-Школа",
                                     font: .proDisplayBold18(),
                                     color: .specialBlack,
                                     line: 0)
    
    private let seventhInfoLabel = UILabel(text: "Онлайн-школа на платформе GetCourse",
                                         font:  .proDisplayRegular12(),
                                         color: .specialDarkGray,
                                         line: 0)
    
    //MARK: - Buttons
    
    private lazy var telegramTMCButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "TelegramIcon")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(telegramTMCButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var telegramSchoolButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "TelegramIcon")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(telegramSchoolButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var telegramMafiaButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "TelegramIcon"), for: .normal)
        button.addTarget(self, action: #selector(telegramMafiaButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var telegramBattleControlButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "TelegramIcon")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(telegramBattleControlButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var telegramHRButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "TelegramIcon")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(telegramHRButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var telegramEnglishButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "TelegramIcon")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(telegramEnglishButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var telegramOnlineSchoolButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "TelegramIcon")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(telegramOnlineSchoolButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Lines
    
    private let firstLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let secondLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let thirdLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let fourthLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let fifthLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let sixthLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let seventhLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let eighthLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var firstStackView = UIStackView()
    private var secondStackView = UIStackView()
    private var thirdStackView = UIStackView()
    private var fourthStackView = UIStackView()
    private var fifthStackView = UIStackView()
    private var sixthStackView = UIStackView()
    private var seventhStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupUIStackView() {
        firstStackView = UIStackView(arrangedSubviews:
                                        [firstLabel,
                                         firstInfoLabel,
                                         firstLineView],
                                     axis: .vertical,
                                     spacing: 1)
        
        secondStackView = UIStackView(arrangedSubviews:
                                        [secondLabel,
                                         secondInfoLabel,
                                         secondLineView],
                                       axis: .vertical,
                                       spacing: 1)
        
        thirdStackView = UIStackView(arrangedSubviews:
                                        [thirdLabel,
                                         thirdInfoLabel,
                                         thirdLineView],
                                     axis: .vertical,
                                     spacing: 1)
        
        fourthStackView = UIStackView(arrangedSubviews:
                                        [fourthLabel,
                                         fourthInfoLabel,
                                         fourthLineView],
                                    axis: .vertical,
                                    spacing: 1)
        
        fifthStackView = UIStackView(arrangedSubviews:
                                        [fifthLabel,
                                         fifthInfoLabel,
                                         fifthLineView],
                                     axis: .vertical,
                                     spacing: 1)
        
        sixthStackView = UIStackView(arrangedSubviews:
                                        [sixthLabel,
                                         sixthInfoLabel,
                                         sixthLineView],
                                     axis: .vertical,
                                     spacing: 1)
        
        seventhStackView = UIStackView(arrangedSubviews:
                                        [seventhLabel,
                                         seventhInfoLabel,
                                         seventhLineView],
                                     axis: .vertical,
                                     spacing: 1)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        setupUIStackView()
        view.addSubview(eighthLineView)
        view.addSubview(scrollView)
        scrollView.addSubview(projectsLabel)
        scrollView.addSubview(firstStackView)
        scrollView.addSubview(secondStackView)
        scrollView.addSubview(thirdStackView)
        scrollView.addSubview(fourthStackView)
        scrollView.addSubview(fifthStackView)
        scrollView.addSubview(sixthStackView)
        scrollView.addSubview(seventhStackView)
        scrollView.addSubview(telegramTMCButton)
        scrollView.addSubview(telegramSchoolButton)
        scrollView.addSubview(telegramMafiaButton)
        scrollView.addSubview(telegramBattleControlButton)
        scrollView.addSubview(telegramHRButton)
        scrollView.addSubview(telegramEnglishButton)
        scrollView.addSubview(telegramOnlineSchoolButton)
    }
    
    @objc private func telegramTMCButtonTap() {
        print("telegramTMCButtonTap pressed")
    }
    
    @objc private func telegramSchoolButtonTap() {
        print("telegramSchoolButtonTap pressed")
    }
    
    @objc private func telegramMafiaButtonTap() {
        print("telegramMafiaButtonTap pressed")
    }
    
    @objc private func telegramBattleControlButtonTap() {
        print("telegramBattleControlButtonTap pressed")
    }
    
    @objc private func telegramHRButtonTap() {
        print("telegramHRButtonTap pressed")
    }
    
    @objc private func telegramEnglishButtonTap() {
        print("telegramEnglishButtonTap pressed")
    }
    
    @objc private func telegramOnlineSchoolButtonTap() {
        print("telegramOnlineSchoolButtonTap pressed")
    }
}

extension ProjectsTerraViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            eighthLineView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            eighthLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            eighthLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            eighthLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: eighthLineView.bottomAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            projectsLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            projectsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            projectsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60)
        ])
        
        NSLayoutConstraint.activate([
            firstStackView.topAnchor.constraint(equalTo: projectsLabel.bottomAnchor, constant: 23),
            firstStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            firstStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            firstStackView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            secondStackView.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 10),
            secondStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            secondStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            secondStackView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            secondLineView.heightAnchor.constraint(equalToConstant: 1),
            firstLineView.heightAnchor.constraint(equalToConstant: 1),
            thirdLineView.heightAnchor.constraint(equalToConstant: 1),
            fourthLineView.heightAnchor.constraint(equalToConstant: 1),
            fifthLineView.heightAnchor.constraint(equalToConstant: 1),
            sixthLineView.heightAnchor.constraint(equalToConstant: 1),
            seventhLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            thirdStackView.topAnchor.constraint(equalTo: secondStackView.bottomAnchor, constant: 10),
            thirdStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            thirdStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            thirdStackView.heightAnchor.constraint(equalToConstant: 70)
        ])

        NSLayoutConstraint.activate([
            fourthStackView.topAnchor.constraint(equalTo: thirdStackView.bottomAnchor, constant: 10),
            fourthStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            fourthStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            fourthStackView.heightAnchor.constraint(equalToConstant: 100)
        ])

        NSLayoutConstraint.activate([
            fifthStackView.topAnchor.constraint(equalTo: fourthStackView.bottomAnchor, constant: 10),
            fifthStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            fifthStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            fifthStackView.heightAnchor.constraint(equalToConstant: 70)
        ])

        NSLayoutConstraint.activate([
            sixthStackView.topAnchor.constraint(equalTo: fifthStackView.bottomAnchor, constant: 10),
            sixthStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            sixthStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            sixthStackView.heightAnchor.constraint(equalToConstant: 70)
        ])

        NSLayoutConstraint.activate([
            seventhStackView.topAnchor.constraint(equalTo: sixthStackView.bottomAnchor, constant: 10),
            seventhStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            seventhStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            seventhStackView.heightAnchor.constraint(equalToConstant: 70),
            seventhStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            telegramTMCButton.centerYAnchor.constraint(equalTo: firstStackView.centerYAnchor),
            telegramTMCButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            telegramTMCButton.heightAnchor.constraint(equalToConstant: 18),
            telegramTMCButton.widthAnchor.constraint(equalToConstant: 19)
        ])
        
        NSLayoutConstraint.activate([
            telegramSchoolButton.centerYAnchor.constraint(equalTo: secondStackView.centerYAnchor),
            telegramSchoolButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            telegramSchoolButton.heightAnchor.constraint(equalToConstant: 18),
            telegramSchoolButton.widthAnchor.constraint(equalToConstant: 19)
        ])

        NSLayoutConstraint.activate([
            telegramMafiaButton.centerYAnchor.constraint(equalTo: thirdStackView.centerYAnchor),
            telegramMafiaButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            telegramMafiaButton.heightAnchor.constraint(equalToConstant: 18),
            telegramMafiaButton.widthAnchor.constraint(equalToConstant: 19)
        ])

        NSLayoutConstraint.activate([
            telegramBattleControlButton.centerYAnchor.constraint(equalTo: fourthStackView.centerYAnchor),
            telegramBattleControlButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            telegramBattleControlButton.heightAnchor.constraint(equalToConstant: 18),
            telegramBattleControlButton.widthAnchor.constraint(equalToConstant: 19)
        ])
        NSLayoutConstraint.activate([
            telegramHRButton.centerYAnchor.constraint(equalTo: fifthStackView.centerYAnchor),
            telegramHRButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            telegramHRButton.heightAnchor.constraint(equalToConstant: 18),
            telegramHRButton.widthAnchor.constraint(equalToConstant: 19)
        ])

        NSLayoutConstraint.activate([
            telegramEnglishButton.centerYAnchor.constraint(equalTo: sixthStackView.centerYAnchor),
            telegramEnglishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            telegramEnglishButton.heightAnchor.constraint(equalToConstant: 18),
            telegramEnglishButton.widthAnchor.constraint(equalToConstant: 19)
        ])

        NSLayoutConstraint.activate([
            telegramOnlineSchoolButton.centerYAnchor.constraint(equalTo: seventhStackView.centerYAnchor),
            telegramOnlineSchoolButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            telegramOnlineSchoolButton.heightAnchor.constraint(equalToConstant: 18),
            telegramOnlineSchoolButton.widthAnchor.constraint(equalToConstant: 19)
        ])
    }
}
