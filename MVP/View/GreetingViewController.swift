//
//  ViewController.swift
//  MVP
//
//  Created by Alex Cruz on 11/16/19.
//  Copyright © 2019 Alex Cruz. All rights reserved.
//

import UIKit

class GreetingViewController : UIViewController, GreetingView {
    
    // =============
    // MARK: - Enums
    // =============
    
    
    // =================
    // MARK: - Variables
    // =================
    private var presenter: GreetingPresenter!
    private let showGreetingButton = UIButton()
    private let greetingLabel = UILabel()
    
    private let buttonWidth: CGFloat = 130
    private let buttonHeight: CGFloat = 50

}

// ================
// MARK: Life Cycle
// ================
extension GreetingViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        createModel()
        self.showGreetingButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        setUpView()
    }
}

// =============
// MARK: Actions
// =============
extension GreetingViewController {
    @objc private func didTapButton(button: UIButton) {
        self.presenter.showGreeting()
    }
    
    internal func setGreeting(greeting: String) {
        self.greetingLabel.text = greeting
    }
}

// =============
// MARK: - Setup
// =============
extension GreetingViewController {
    private func setUpView() {
        showGreetingButton.setTitle("Press me", for: .normal)
        showGreetingButton.backgroundColor = .red
        showGreetingButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(showGreetingButton)
        NSLayoutConstraint.activate([
             showGreetingButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
             showGreetingButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
             showGreetingButton.widthAnchor.constraint(equalToConstant: buttonWidth),
             showGreetingButton.heightAnchor.constraint(equalToConstant: buttonHeight)
        ])
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(greetingLabel)
        NSLayoutConstraint.activate([
             greetingLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
             greetingLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 300)
        ])
    }
}

// ================
// MARK: Data Setup
// ================
extension GreetingViewController {
    private func createModel() {
        // Assembling of MVP
        let model = Person(firstName: "David", lastName: "Blaine")
        self.presenter = GreetingPresenter(view: self, person: model)
    }
}

