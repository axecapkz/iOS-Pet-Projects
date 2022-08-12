//
//  CharactersVC.swift
//  RickandMortyApp
//
//  Created by Azamat Kenjebayev on 7/30/22.
//

import UIKit

class CharactersVC: UIViewController {

    var profiles: [Profile] = []

    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = #colorLiteral(red: 0.1324388087, green: 0.1576339602, blue: 0.1870785356, alpha: 1)
        return collectionView
    }()

    private enum LayoutConstant {
        static let spacing: CGFloat = 16.0
        static let itemHeight: CGFloat = 200.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayouts()
        populateProfiles()
        collectionView.reloadData()
        
        let backBarBtnItem = UIBarButtonItem()
        backBarBtnItem.title = ""
        navigationController?.navigationBar.backItem?.backBarButtonItem = backBarBtnItem
        backBarBtnItem.tintColor = #colorLiteral(red: 0.7155807614, green: 0.8470743895, blue: 0.2515230179, alpha: 1)
       
        
        
        let nav = self.navigationController?.navigationBar
        self.title = "Characters"
        nav?.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 23, weight: UIFont.Weight.bold), .foregroundColor: #colorLiteral(red: 0.7155807614, green: 0.8470743895, blue: 0.2515230179, alpha: 1)]
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = #colorLiteral(red: 0.7155807614, green: 0.8470743895, blue: 0.2515230179, alpha: 1)
  
        
        
        let customFilterButton = UIButton()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: customFilterButton)
        customFilterButton.setImage(UIImage(named: "icons8-filter-50"), for: .normal)
        customFilterButton.frame.size = CGSize(width: 5, height: 5)
        customFilterButton.addTarget(self, action: #selector(filterButton), for: .touchUpInside)

    }

    
    @objc func filterButton(){
        let nextVC = FilterVC()
        self.navigationController?.pushViewController(nextVC, animated: false)
        print("Filter button pressed")
    }
    
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.1324388087, green: 0.1576339602, blue: 0.1870785356, alpha: 1)
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: ProfileCell.identifier)

    }

    private func setupLayouts() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        
    }

    private func populateProfiles() {
        profiles = [
            Profile(name: "Morty", imageName: "characters-morty"),
            Profile(name: "", imageName: "empty"),
            Profile(name: "", imageName: "empty"),
            Profile(name: "", imageName: "empty"),
            Profile(name: "", imageName: "empty"),
            Profile(name: "", imageName: "empty"),
        ]
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CharactersVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profiles.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCell.identifier, for: indexPath) as! ProfileCell

        let profile = profiles[indexPath.row]
        cell.setup(with: profile)
        return cell
    }
}

extension CharactersVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = itemWidth(for: view.frame.width, spacing: LayoutConstant.spacing)

        return CGSize(width: width, height: LayoutConstant.itemHeight)
    }

    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 2

        let totalSpacing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow

        return floor(finalWidth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: LayoutConstant.spacing, left: LayoutConstant.spacing, bottom: LayoutConstant.spacing, right: LayoutConstant.spacing)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }
}



