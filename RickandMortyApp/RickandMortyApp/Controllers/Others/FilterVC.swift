import UIKit

class FilterVC: UIViewController {
    
    private var firstFilterStackView = UIStackView()
    private var secondFilterStackView = UIStackView()
    private var thirdFilterStackView = UIStackView()
    private var fourthFilterStackView = UIStackView()
    
    private var fifthFilterStackView = UIStackView()
    private var sixthFilterStackView = UIStackView()
    private var seventhFilterStackView = UIStackView()
    private var eighthFilterStackView = UIStackView()
    private var ninethFilterStackView = UIStackView()
    
    private lazy var filterStatus = UILabel(text: "Status", font: .systemFont(ofSize: 19, weight: .semibold), color: #colorLiteral(red: 0.7155807614, green: 0.8470743895, blue: 0.2515230179, alpha: 1), line: 1)
    
    private lazy var filterResetButton = CustomButton(titleColor: .red, title: "Reset")
    
    private lazy var filterGender = UILabel(text: "Gender", font: .systemFont(ofSize: 19, weight: .semibold), color: #colorLiteral(red: 0.7155807614, green: 0.8470743895, blue: 0.2515230179, alpha: 1), line: 1)
    
    private lazy var filterReset2Button = CustomButton(titleColor: .systemRed, title: "Reset")
    
    private lazy var applyFilters: UIButton = {
        let button = UIButton()
        button.setTitle("Apply filters", for: .normal)
        button.layer.borderColor = #colorLiteral(red: 0.7155807614, green: 0.8470743895, blue: 0.2515230179, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 15
        button.layer.cornerCurve = .continuous
        button.setTitleColor(UIColor(red: 0.7155807614, green: 0.8470743895, blue: 0.2515230179, alpha: 1), for: .normal)
        return button
    }()

    private lazy var circle = UILabel(text: "●", font: .systemFont(ofSize: 19, weight: .semibold), color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), line: 1)
    private lazy var circle1 = UILabel(text: "●", font: .systemFont(ofSize: 19, weight: .semibold), color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), line: 1)
    private lazy var circle2 = UILabel(text: "●", font: .systemFont(ofSize: 19, weight: .semibold), color: #colorLiteral(red: 0.7155807614, green: 0.8470743895, blue: 0.2515230179, alpha: 1), line: 1)
    private lazy var circle3 = UILabel(text: "●", font: .systemFont(ofSize: 19, weight: .semibold), color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), line: 1)
    private lazy var circle4 = UILabel(text: "●", font: .systemFont(ofSize: 19, weight: .semibold), color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), line: 1)
    private lazy var circle5 = UILabel(text: "●", font: .systemFont(ofSize: 19, weight: .semibold), color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), line: 1)
    private lazy var circle6 = UILabel(text: "●", font: .systemFont(ofSize: 19, weight: .semibold), color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), line: 1)
        
    private lazy var labelAlive = UILabel(text: "Alive", font: .systemFont(ofSize: 19, weight: .regular), color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), line: 1)
    private lazy var labelDead = UILabel(text: "Dead", font: .systemFont(ofSize: 19, weight: .regular), color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), line: 1)
    private lazy var labelUnknown = UILabel(text: "Unknown", font: .systemFont(ofSize: 19, weight: .regular), color: #colorLiteral(red: 0.7155807614, green: 0.8470743895, blue: 0.2515230179, alpha: 1), line: 1)
    
    private lazy var labelFemale = UILabel(text: "Female", font: .systemFont(ofSize: 19, weight: .regular), color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), line: 1)
    private lazy var labelMale = UILabel(text: "Male", font: .systemFont(ofSize: 19, weight: .regular), color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), line: 1)
    private lazy var labelGenderless = UILabel(text: "Genderless", font: .systemFont(ofSize: 19, weight: .regular), color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), line: 1)
    private lazy var labelUnknown1 = UILabel(text: "Unknown", font: .systemFont(ofSize: 19, weight: .regular), color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), line: 1)
    
    private func setupUIStackView() {
        firstFilterStackView = UIStackView(arrangedSubviews:
                                        [filterStatus,
                                         filterResetButton],
                                     axis: .horizontal,
                                           spacing: 0)
        secondFilterStackView = UIStackView(arrangedSubviews:
                                                [ circle,
                                                  labelAlive],
                                            axis: .horizontal,
                                            spacing: 0)
        thirdFilterStackView = UIStackView(arrangedSubviews:
                                            [circle1,
                                             labelDead],
                                           axis: .horizontal,
                                           spacing: 0)
        fourthFilterStackView = UIStackView(arrangedSubviews:
                                                [circle2,
                                                 labelUnknown],
                                            axis: .horizontal,
                                            spacing: 0)
        fifthFilterStackView = UIStackView(arrangedSubviews:
                                            [filterGender,
                                            filterReset2Button],
                                           axis: .horizontal,
                                           spacing: 0)
        sixthFilterStackView = UIStackView(arrangedSubviews:
                                            [circle3,
                                            labelFemale],
                                           axis: .horizontal,
                                           spacing: 0)
        seventhFilterStackView = UIStackView(arrangedSubviews:
                                                [circle4,
                                                labelMale],
                                             axis: .horizontal,
                                             spacing: 0)
        eighthFilterStackView = UIStackView(arrangedSubviews:
                                                [circle5,
                                                labelGenderless],
                                            axis: .horizontal,
                                            spacing: 0)
        ninethFilterStackView = UIStackView(arrangedSubviews:
                                                [circle6,
                                                labelUnknown1],
                                            axis: .horizontal,
                                            spacing: 0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1324388087, green: 0.1576339602, blue: 0.1870785356, alpha: 1)
        setupUIStackView()
        view.addSubview(firstFilterStackView)
        view.addSubview(secondFilterStackView)
        view.addSubview(thirdFilterStackView)
        view.addSubview(fourthFilterStackView)
        view.addSubview(fifthFilterStackView)
        view.addSubview(sixthFilterStackView)
        view.addSubview(seventhFilterStackView)
        view.addSubview(eighthFilterStackView)
        view.addSubview(ninethFilterStackView)
        view.addSubview(applyFilters)
        setupConstraints()
        
        filterResetButton.addTarget(self, action: #selector(resetPressed), for: .touchUpInside)
        filterReset2Button.addTarget(self, action: #selector(reset2Pressed), for: .touchUpInside)
        applyFilters.addTarget(self, action: #selector(applyFiltersPressed), for: .touchUpInside)
    }
    
    @objc func resetPressed() {
        print("Reset button pressed")
    }
    
    @objc func reset2Pressed() {
        print("Reset2 button pressed")
    }
    
    @objc func applyFiltersPressed() {
        print("Apply filters button pressed")
    }

}

extension FilterVC {
    private func setupConstraints(){
        filterStatus.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            filterStatus.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            filterStatus.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21)
        ])
        filterResetButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            filterResetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45)
        ])
        
        circle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circle.topAnchor.constraint(equalTo: filterStatus.bottomAnchor, constant: 30),
            circle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21)
        ])
        labelAlive.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelAlive.leadingAnchor.constraint(equalTo: circle.trailingAnchor, constant: 50)
        ])
        
        circle1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circle1.topAnchor.constraint(equalTo: circle.bottomAnchor, constant: 10),
            circle1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21)
        ])
        labelDead.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelDead.leadingAnchor.constraint(equalTo: circle1.trailingAnchor, constant: 50)
        ])
        
        circle2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circle2.topAnchor.constraint(equalTo: circle1.bottomAnchor, constant: 10),
            circle2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21)
        ])
        labelUnknown.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelUnknown.leadingAnchor.constraint(equalTo: circle2.trailingAnchor, constant: 50)
        ])
        
        
        
        filterGender.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            filterGender.topAnchor.constraint(equalTo: circle2.bottomAnchor, constant: 30),
            filterGender.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21)
        ])
        
        filterReset2Button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            filterReset2Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45)
        ])
        
        circle3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circle3.topAnchor.constraint(equalTo: filterGender.bottomAnchor, constant: 30),
            circle3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21)
        ])
        
        labelFemale.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelFemale.leadingAnchor.constraint(equalTo: circle3.trailingAnchor, constant: 50)
        ])
        
        circle4.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circle4.topAnchor.constraint(equalTo: circle3.bottomAnchor, constant: 10),
            circle4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21)
        ])
        
        labelMale.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelMale.leadingAnchor.constraint(equalTo: circle4.trailingAnchor, constant: 50)
        ])

        circle5.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circle5.topAnchor.constraint(equalTo: circle4.bottomAnchor, constant: 10),
            circle5.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21)
        ])
        
        labelGenderless.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelGenderless.leadingAnchor.constraint(equalTo: circle5.trailingAnchor, constant: 50)
        ])
        
        circle6.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circle6.topAnchor.constraint(equalTo: circle5.bottomAnchor, constant: 10),
            circle6.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21)
        ])
        
        labelUnknown1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelUnknown1.leadingAnchor.constraint(equalTo: circle6.trailingAnchor, constant: 50)
        ])
        
        applyFilters.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            applyFilters.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            applyFilters.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            applyFilters.widthAnchor.constraint(equalToConstant: 300),
            applyFilters.heightAnchor.constraint(equalToConstant: 50)
        ])

    }
}
