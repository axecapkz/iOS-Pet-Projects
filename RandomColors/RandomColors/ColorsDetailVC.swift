//
//  ColorsDetailVC.swift
//  RandomColors
//
//  Created by Azamat Kenjebayev on 4/4/22.
//

import UIKit

class ColorsDetailVC: UIViewController {

    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = color ?? .systemTeal
    }
}
