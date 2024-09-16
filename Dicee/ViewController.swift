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
    
    var diceOneImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "DiceOne")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var diceTwoImageView: UIImageView = {
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
    
    let topContainerView = UIView()
    let middleContainerView = UIView()
    let bottomContainerView = UIView()
    var mainStackView = UIStackView()
    var diceStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    private func configureUI() {
        setupBackgroundImageView()
        setupMainStackView()
        setupContainersView()
        setupElementsInContainerViews()
        
        rollButton.addTarget(self, action: #selector(rollDice), for: .touchUpInside)
    }
    
    private func setupContainersView() {
        let containersView = [topContainerView, middleContainerView, bottomContainerView]
        
        containersView.forEach {
            mainStackView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupMainStackView() {
        mainStackView = UIStackView(arrangedSubviews: [topContainerView, middleContainerView, bottomContainerView])
        
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillEqually
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setupElementsInContainerViews() {
        topContainerView.addSubview(logoImageView)
        bottomContainerView.addSubview(rollButton)
        
        setupDiceStackView()
        
        NSLayoutConstraint.activate([
            
            logoImageView.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor),
            
            rollButton.widthAnchor.constraint(equalToConstant: 150),
            rollButton.centerXAnchor.constraint(equalTo: bottomContainerView.centerXAnchor),
            rollButton.centerYAnchor.constraint(equalTo: bottomContainerView.centerYAnchor)
        ])
    }
    
    private func setupDiceStackView() {
        diceStackView = UIStackView(arrangedSubviews: [diceOneImageView, diceTwoImageView])
        diceStackView.translatesAutoresizingMaskIntoConstraints = false
        diceStackView.axis = .horizontal
        diceStackView.spacing = 50
        diceStackView.alignment = .center
        diceStackView.distribution = .fillEqually
        
        middleContainerView.addSubview(diceStackView)
        
        NSLayoutConstraint.activate([
            diceStackView.centerXAnchor.constraint(equalTo: middleContainerView.centerXAnchor),
            diceStackView.centerYAnchor.constraint(equalTo: middleContainerView.centerYAnchor)
        ])
    }
    
    private func setupBackgroundImageView() {
        view.addSubview(backgroundImageView)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    @objc private func rollDice() {
        diceOneImageView.image = DiceModel.randomDiceImage()
        diceTwoImageView.image = DiceModel.randomDiceImage()
    }
}

