//
//  ViewController.swift
//  Dicee
//
//  Created by murad on 14.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "GreenBackground")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "DiceeLogo")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let diceOneImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "DiceOne")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let diceTwoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "DiceTwo")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let rollButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Roll", for: .normal)
        button.backgroundColor = UIColor(red: 142 / 255, green: 41 / 255, blue: 37 / 255, alpha: 1.0)
        button.layer.cornerRadius = 10
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(backgroundImageView)
        view.addSubview(logoImageView)
        view.addSubview(diceOneImageView)
        view.addSubview(diceTwoImageView)
        view.addSubview(rollButton)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            logoImageView.heightAnchor.constraint(equalToConstant: 150),
            
            diceOneImageView.widthAnchor.constraint(equalToConstant: 120),
            diceOneImageView.heightAnchor.constraint(equalToConstant: 120),
            diceOneImageView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 30),
            diceOneImageView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -20),
            
            diceTwoImageView.widthAnchor.constraint(equalToConstant: 120),
            diceTwoImageView.heightAnchor.constraint(equalToConstant: 120),
            diceTwoImageView.topAnchor.constraint(equalTo: diceOneImageView.topAnchor),
            diceTwoImageView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 20),
            
            rollButton.topAnchor.constraint(equalTo: diceOneImageView.bottomAnchor, constant: 35),
            rollButton.widthAnchor.constraint(equalToConstant: 150),
            rollButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}

