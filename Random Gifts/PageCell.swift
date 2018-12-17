//
//  Page.swift
//  Random Gifts
//
//  Created by Charles Martin Reed on 12/17/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    //MARK:- Page composition
    var page: Page? {
        didSet {
            guard let unwrappedPage = page else { return }
            
            prizeLabel.text = unwrappedPage.prizeLabelText
            prizeImageView.image = UIImage(named: unwrappedPage.prizeImage)
            
        }
    }
    
    //MARK:- UI Properties
    var pageNumber = 1
    
    private let prizeBackgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .red
        
        return backgroundView
    }()
    
    private let prizeLabel: UILabel = {
        let label = UILabel()
        label.text = "Prize #"
        label.backgroundColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.layer.cornerRadius = 5
        
        return label
        
    }()
    
    private let randomPrizeButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Random", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        
        return button
        
    }()
    
    private let prizeImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "expression1")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 5
    
        return imageView
    }()
    
    //MARK:- Init statements
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    private func setupLayout() {
        let prizeBackgroundView = UIView()
        addSubview(prizeBackgroundView)
        prizeBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        let backgroundViewConstraints = [
            prizeBackgroundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            prizeBackgroundView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            prizeBackgroundView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            prizeBackgroundView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ]
        
        prizeBackgroundView.addSubview(prizeImageView)
        
        let prizeImageViewConstraints = [
            prizeImageView.centerXAnchor.constraint(equalTo: prizeBackgroundView.centerXAnchor),
            prizeImageView.centerYAnchor.constraint(equalTo: prizeBackgroundView.centerYAnchor),
            prizeImageView.leadingAnchor.constraint(equalTo: prizeBackgroundView.leadingAnchor, constant: 24),
            prizeImageView.trailingAnchor.constraint(equalTo: prizeBackgroundView.trailingAnchor, constant: -24),
            prizeImageView.heightAnchor.constraint(equalToConstant: 300),
            prizeImageView.widthAnchor.constraint(equalToConstant: 200)
        ]
        
        prizeBackgroundView.addSubview(prizeLabel)
        
        let prizeLabelConstraints = [
            prizeLabel.bottomAnchor.constraint(equalTo: prizeImageView.topAnchor, constant: -24),
            prizeLabel.leadingAnchor.constraint(equalTo: prizeImageView.leadingAnchor, constant: 24),
            prizeLabel.trailingAnchor.constraint(equalTo: prizeImageView.trailingAnchor, constant: -24),
            prizeLabel.heightAnchor.constraint(equalToConstant: 40),
            ]
        
        prizeBackgroundView.addSubview(randomPrizeButton)
        
        let randomPrizeButtonConstraints = [
            randomPrizeButton.bottomAnchor.constraint(equalTo: prizeBackgroundView.bottomAnchor, constant: -24),
            randomPrizeButton.leadingAnchor.constraint(equalTo: prizeBackgroundView.leadingAnchor, constant: 24),
            randomPrizeButton.trailingAnchor.constraint(equalTo: prizeBackgroundView.trailingAnchor, constant: -24),
            randomPrizeButton.heightAnchor.constraint(equalToConstant: 60)]
        
        let constraints = [backgroundViewConstraints, prizeImageViewConstraints, prizeLabelConstraints, randomPrizeButtonConstraints]
        
        for container in constraints {
            NSLayoutConstraint.activate(container)
        }
    }
 
}
