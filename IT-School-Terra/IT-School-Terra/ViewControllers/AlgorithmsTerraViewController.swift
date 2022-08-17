//
//  AlgoritmsTerraViewController.swift
//  IT-School-Terra
//
//  Created by Azamat Kenjebayev on 8/12/22.
//

import UIKit

class AlgorithmsTerraViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let algorithmsLabel = UILabel(text: "Алгоритмы Terra",
                                         font: .proDisplayBold18(),
                                         color: .specialBlack,
                                         line: 0)
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        view.applyShadow(cornerRadius: 5)
        return view
    }()
  
    private let firstLabel = UILabel(text: "Участники Терры не имеют права что либо продавать друг другу",
                                     font: .proDisplay18(),
                                     color: .specialBlack,
                                     line: 0)
    
    private let secondLabel = UILabel(text: "Любой участник Терры должен выполнять договоренности, либо передоговариваться. Просто не выполнять договоренности недопустимо",
                                      font: .proDisplay18(),
                                      color: .specialBlack,
                                      line: 0)
    
    private let thirdLabel = UILabel(text: "Наставники Терры являются реальными практиками, собствен-никами бизнеса. Наставник Терры не может заниматься консалтингом или инфобизнесом",
                                     font: .proDisplay18(),
                                     color: .specialBlack,
                                     line: 0)
    
    private let fourthLabel = UILabel(text: "Терра нужна дли того, чтобы каждый участник помогал людям получать помощь от других людей",
                                    font: .proDisplay18(),
                                    color: .specialBlack,
                                    line: 0)
    
    private let fifthLabel = UILabel(text: "Если Терра помогает вам, то ваш долг помогать другим людям. Вы можете раз в неделю пожервтовать в какой нибудь благотворительный фонд на ваш выбор, либо можете стать наставником и учить других людей",
                                     font: .proDisplay18(),
                                     color: .specialBlack,
                                     line: 0)
    
    private let sixthLabel = UILabel(text: "Если кто-то в Терре нарушает данные алгоритмы, то сообщив об этом руководству Терры вы сильно можете помочь сообществу",
                                     font: .proDisplay18(),
                                     color: .specialBlack,
                                     line: 0)
    
    private let seventhLabel = UILabel(text: "Впервую очередь клуб даёт возмож-ность развить навыки ведения бизнеса в одной из 4 ступеней (старт, запуск, прорыв, опора). Но, также, помимо развития навыков ведения бизнеса, Терра предлагает несколько других направление для личностного и профессионального роста.",
                                       font: .proDisplay18(),
                                       color: .specialBlack,
                                       line: 0)
    
    
    private let firstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AlgoritmsTerra1")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AlgoritmsTerra2")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let thirdImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AlgoritmsTerra3")
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.specialGreen.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
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
    
    private var firstStackView = UIStackView()
    private var secondStackView = UIStackView()
    private var imagesStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupUIStackView() {
        firstStackView = UIStackView(arrangedSubviews:
                                        [firstImageView,
                                         firstLabel,
                                         firstLineView,
                                         secondLabel,
                                         secondLineView,
                                         thirdLabel,
                                         thirdLineView,
                                         fourthLabel,
                                         fourthLineView,
                                         fifthLabel ],
                                     axis: .vertical,
                                     spacing: 14)
        
        imagesStackView = UIStackView(arrangedSubviews:
                                        [secondImageView,
                                         thirdImageView],
                                      axis: .horizontal,
                                      spacing: 10)
        
        secondStackView = UIStackView(arrangedSubviews:
                                        [ sixthLabel,
                                          fifthLineView,
                                          seventhLabel],
                                       axis: .vertical,
                                       spacing: 14)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        setupUIStackView()
        view.addSubview(sixthLineView)
        view.addSubview(scrollView)
        scrollView.addSubview(algorithmsLabel)
        scrollView.addSubview(containerView)
        containerView.addSubview(firstImageView)
        containerView.addSubview(firstStackView)
        containerView.addSubview(imagesStackView)
        containerView.addSubview(secondStackView)
    }
}

extension AlgorithmsTerraViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            sixthLineView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            sixthLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            sixthLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            sixthLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: sixthLineView.bottomAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -1)
        ])
        
        NSLayoutConstraint.activate([
            algorithmsLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 12),
            algorithmsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            algorithmsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: algorithmsLabel.bottomAnchor, constant: 17),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30),
        ])
        
        NSLayoutConstraint.activate([
            firstImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            firstImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            firstImageView.widthAnchor.constraint(equalToConstant: 326),
            firstImageView.heightAnchor.constraint(equalToConstant: 219)
        ])
        
        NSLayoutConstraint.activate([
            secondLineView.heightAnchor.constraint(equalToConstant: 1),
            firstLineView.heightAnchor.constraint(equalToConstant: 1),
            thirdLineView.heightAnchor.constraint(equalToConstant: 1),
            fourthLineView.heightAnchor.constraint(equalToConstant: 1),
            fifthLineView.heightAnchor.constraint(equalToConstant: 1),
        ])
        
        NSLayoutConstraint.activate([
            firstStackView.topAnchor.constraint(equalTo: firstImageView.bottomAnchor, constant: 12),
            firstStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            firstStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            imagesStackView.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 12),
            imagesStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            imagesStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            secondStackView.topAnchor.constraint(equalTo: imagesStackView.bottomAnchor, constant: 12),
            secondStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            secondStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            secondStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -17),
        ])
    }
}
