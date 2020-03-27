//
//  ViewController.swift
//  LocalizableTutorial
//
//  Created by Macbook Pro 15 on 3/26/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var words: [String] = []
    lazy var button = UIButton(type: .system)
    lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 32, weight: .black)
        label.textAlignment = .center
        label.text = "Spanish"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        words.append(contentsOf: [
            NSLocalizedString("Hello", comment: ""),
            NSLocalizedString("Bye", comment: ""),
            NSLocalizedString("I love you", comment: ""),
            NSLocalizedString("I love fruits", comment: "")
        ])
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        button.frame = CGRect(x: screenWidth / 2, y: screenHeight / 2, width: 150, height: 50)
        button.center = CGPoint(x: screenWidth / 2, y: screenHeight / 2)
        button.setTitle(words.randomElement(), for: .normal)
        button.addTarget(self, action: #selector(self.selectRandomWord), for: .touchUpInside)
        self.view?.addSubview(button)
        setupLabel()
    }
    
    fileprivate func setupLabel() {
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
//            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
    }
    
    @objc func selectRandomWord() {
        button.setTitle(words.randomElement(), for: .normal)
    }
}
