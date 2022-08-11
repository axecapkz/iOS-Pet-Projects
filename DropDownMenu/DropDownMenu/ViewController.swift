//
//  ViewController.swift
//  DropDownMenu
//
//  Created by Azamat Kenjebayev on 8/11/22.
//

import UIKit

class CellClass: UITableViewCell {
    
}

class ViewController: UIViewController {
    
    private let transparentView = UIView()
    private let tableView = UITableView()
    private var selectedButton = UIButton()
    private var dataSource = [String]()
    
    private lazy var selectButton: UIButton = {
        let button = UIButton()
        button.setTitle("Choose your fruit", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.cornerCurve = .continuous
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .red
        button.layer.borderWidth = 1
        button.layer.cornerCurve = .continuous
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(buttonResetPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonPressed(){
        dataSource = ["Apple", "Mango", "Orange"]
        selectedButton = selectButton
        addTransparentView(frames: selectButton.frame)
    }
    
    @objc func buttonResetPressed(){
        selectButton.setTitle("Choose your fruit", for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(selectButton)
        view.addSubview(resetButton)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CellClass.self, forCellReuseIdentifier: "Cell")
        
        setConstraints()
        
    }
    
    private func addTransparentView(frames: CGRect) {
        let window = UIApplication.shared.keyWindow
        transparentView.frame = window?.frame ?? self.view.frame
        self.view.addSubview(transparentView)
        
        tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y, width: frames.width, height: 0)
        self.view.addSubview(tableView)
        tableView.layer.cornerRadius = 5
        
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        tableView.reloadData()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
        transparentView.addGestureRecognizer(tapGesture)
        transparentView.alpha = 0
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0.5
            self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height + 5, width: frames.width, height: CGFloat(self.dataSource.count * 50))
        }, completion: nil)
        
    }
    
    @objc func removeTransparentView(){
        let frames = selectedButton.frame
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0.0
            self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
        }, completion: nil)
    }
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedButton.setTitle(dataSource[indexPath.row], for: .normal)
        removeTransparentView()
    }
    
    private func setConstraints() {
        selectButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            selectButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            selectButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            selectButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resetButton.topAnchor.constraint(equalTo: selectButton.bottomAnchor, constant: 50),
            resetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            resetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resetButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        selectButton.setTitle(dataSource[indexPath.row], for: .normal)
        removeTransparentView()
    }
}


