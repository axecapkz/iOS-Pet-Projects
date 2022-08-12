//
//  LocationsVC.swift
//  RickandMortyApp
//
//  Created by Azamat Kenjebayev on 7/31/22.
//

import UIKit

class LocationsVC: UIViewController {

    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Locations screen"
        label.textColor = #colorLiteral(red: 0.7155807614, green: 0.8470743895, blue: 0.2515230179, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1324388087, green: 0.1576339602, blue: 0.1870785356, alpha: 1)
        view.addSubview(label)
        confiureLayout()
    }
    
    private func confiureLayout(){
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

}
