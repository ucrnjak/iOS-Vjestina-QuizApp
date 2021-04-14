//
//  LoginViewController.swift
//  QuizApp
//
//  Created by Ursa Crnjak on 12/04/2021.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController, ConstraintRelatableTarget {
    
    private var popQuizLabel: UILabel!
    private var stackView: UIStackView!
    private var emailTextField: TextFieldWithPadding!
    private var passwordTextField: TextFieldWithPadding!
    private var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        
        buildLabel()
        buildStackView()
        
    }
    
    @objc func loginButtonPressed(_: UIButton) {
        let email = emailTextField.text
        let password = passwordTextField.text
        
        switch DataService().login(email: email!, password: password!) {
        case LoginStatus.success:
            print("Success")
        default:
            let alert = UIAlertController(title: "Invalid!", message: "Please provide valid email and password.", preferredStyle: UIAlertController.Style.alert)

            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

            self.present(alert, animated: true, completion: nil)
            
            print("Invalid email")
        }
        
    }

    
    private func buildLabel() {
        
        popQuizLabel = UILabel()
        popQuizLabel.text = "PopQuiz"
        popQuizLabel.textColor = .white
        popQuizLabel.font = UIFont(name: "SourceSansPro", size: 32.0)
        popQuizLabel.font = UIFont.boldSystemFont(ofSize: 32.0)
        popQuizLabel.textAlignment = .center

        view.addSubview(popQuizLabel)
        addLabelConstraints()
    }
    
    private func buildStackView() {
        stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        
        generateStackViewElements()
        
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
        
        view.addSubview(stackView)
        addStackConstraints()
    }
    
    private func addLabelConstraints() {
        popQuizLabel.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(120)
        }
    }
    
    private func addStackConstraints() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: popQuizLabel.bottomAnchor, constant: 144).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32).isActive = true
        //stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -400).isActive = true
        
    }
    
    private func generateStackViewElements() {
        
        emailTextField = TextFieldWithPadding()
        emailTextField.placeholder = "Email"
        emailTextField.autocapitalizationType = .none
        emailTextField.backgroundColor = .white
        emailTextField.layer.cornerRadius = 22
        emailTextField.clipsToBounds = true
        emailTextField.layer.masksToBounds = false
        emailTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        passwordTextField = TextFieldWithPadding()
        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = .white
        passwordTextField.layer.cornerRadius = 22
        passwordTextField.clipsToBounds = true
        passwordTextField.isSecureTextEntry = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(#colorLiteral(red: 0.2470588235, green: 0.2470588235, blue: 0.2470588235, alpha: 1), for: .normal)
        loginButton.backgroundColor = .white
        loginButton.layer.cornerRadius = 22
        loginButton.clipsToBounds = true
        loginButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        loginButton.addTarget(self, action: #selector(self.loginButtonPressed(_ :)), for: .touchUpInside)
        
    }

    
    func assignbackground() {
            let background = UIImage(named: "Untitled design (1)")

            var imageView : UIImageView!
            imageView = UIImageView(frame: view.bounds)
            imageView.contentMode =  UIView.ContentMode.scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = background
            imageView.center = view.center
            view.addSubview(imageView)
            self.view.sendSubviewToBack(imageView)
        }
    
}
