//
//  ProfileCell.swift
//  RickandMortyApp
//
//  Created by Azamat Kenjebayev on 8/4/22.
//

import UIKit

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

class ProfileCell: UICollectionViewCell {

    private enum Constants {
        // MARK: contentView layout constants
        static let contentViewCornerRadius: CGFloat = 16.0

        // MARK: profileImageView layout constants
        static let imageHeight: CGFloat = 200.0


        // MARK: Generic layout constants
        static let verticalSpacing: CGFloat = 8.0
        static let horizontalPadding: CGFloat = 16.0
        static let profileDescriptionVerticalPadding: CGFloat = 8.0
    }

//    private let profileImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
//        return imageView
//    }()
    
    private let profileImageView: UIButton = {
        let imageView = UIButton()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let name: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.backgroundColor = .white.withAlphaComponent(0.5)
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()


    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
        profileImageView.addTarget(self, action: #selector(mortyProfile), for: .touchUpInside)
        
    }
    
    @objc func mortyProfile(){
        print("Morty profile pressed")
    }

    private func setupViews() {
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = Constants.contentViewCornerRadius
        contentView.backgroundColor = .white

        contentView.addSubview(profileImageView)
        contentView.addSubview(name)

    }


    private func setupLayouts() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: Constants.imageHeight)
        ])

        name.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            name.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            name.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            name.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            name.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with profile: Profile) {
        profileImageView.setImage(UIImage(named: profile.imageName), for: .normal)
        name.text = profile.name
    }
}


extension ProfileCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
