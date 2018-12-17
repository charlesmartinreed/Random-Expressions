//
//  ViewController.swift
//  Random Gifts
//
//  Created by Charles Martin Reed on 12/17/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK:- Instance Properties
    let backgroundView = UIView()
    var prizeLabel = UILabel()
    let randomPrizeButton = UIButton()
    var prizeImageView = UIImageView()
    var prizeNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:- UI setup
        backgroundView.backgroundColor = .red
        view.addSubview(backgroundView)
        
        prizeLabel.text = "Prize \(prizeNumber)"
        prizeLabel.backgroundColor = .white
        prizeLabel.textAlignment = .center
        prizeLabel.font = UIFont.boldSystemFont(ofSize: 28)
        prizeLabel.layer.cornerRadius = 5
        view.addSubview(prizeLabel)
        
        prizeImageView.image = UIImage(named: "expression\(prizeNumber)")
        prizeImageView.contentMode = .scaleAspectFit
        prizeImageView.clipsToBounds = true
        prizeImageView.backgroundColor = .white
        prizeImageView.layer.cornerRadius = 5
        view.addSubview(prizeImageView)
        
        randomPrizeButton.setTitle("Random", for: .normal)
        randomPrizeButton.setTitleColor(.white, for: .normal)
        randomPrizeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        randomPrizeButton.backgroundColor = .black
        randomPrizeButton.layer.cornerRadius = 5
        view.addSubview(randomPrizeButton)
        
        randomPrizeButton.addTarget(self, action: #selector(randomButtonPressed), for: .touchUpInside)
        
        for subview in view.subviews {
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        setupConstraints()
        
    }

    func setupConstraints() {
        let backgroundViewConstraints = [
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        let prizeImageViewConstraints = [
            prizeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            prizeImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            prizeImageView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 24),
            prizeImageView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -24),
            prizeImageView.heightAnchor.constraint(equalToConstant: 300),
            prizeImageView.widthAnchor.constraint(equalToConstant: 200)
        ]
        
        let prizeLabelConstraints = [
            prizeLabel.bottomAnchor.constraint(equalTo: prizeImageView.topAnchor, constant: -24),
            prizeLabel.leadingAnchor.constraint(equalTo: prizeImageView.leadingAnchor, constant: 24),
            prizeLabel.trailingAnchor.constraint(equalTo: prizeImageView.trailingAnchor, constant: -24),
            prizeLabel.heightAnchor.constraint(equalToConstant: 40),
        ]
        
        let randomPrizeButtonConstraints = [
            randomPrizeButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -24),
            randomPrizeButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 24),
            randomPrizeButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -24),
            randomPrizeButton.heightAnchor.constraint(equalToConstant: 60)]
        
        let constraints = [backgroundViewConstraints, prizeImageViewConstraints, prizeLabelConstraints, randomPrizeButtonConstraints]
        for container in constraints {
            NSLayoutConstraint.activate(container)
        }
    }
    
    @objc func randomButtonPressed() {
        prizeNumber = Int.random(in: 1...7)
        
        UIView.animate(withDuration: 1, animations: {
            self.prizeLabel.alpha = 0
            self.prizeImageView.alpha = 0
        }) { (_) in
            
            self.prizeImageView.image = UIImage(named: "expression\(self.prizeNumber)")
            self.prizeLabel.text = "Prize \(self.prizeNumber)"
            self.prizeLabel.alpha = 1
            self.prizeImageView.alpha = 1
            
            
        }
    }

}

