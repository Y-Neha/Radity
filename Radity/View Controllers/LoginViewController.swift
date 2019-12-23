//
//  LoginViewController.swift
//  Radity
//
//  Created by Neha Yadav on 19/12/19.
//  Copyright © 2019 Neha Yadav. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    let imageview = ViewBuilder.imageView()
    let containerView = ViewBuilder.containerView()
    let emailTextfield = ViewBuilder.textfield()
    let passwordTextfield = ViewBuilder.textfield()
    let vStack = ViewBuilder.stackview()
    let loginButtton = ViewBuilder.button()
    let hStack = ViewBuilder.stackview()
    let forgetPasswordLabel = ViewBuilder.label()
    let createAccountLabel = ViewBuilder.label()
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoginView()
    }
    
    func setupLoginView() {
        view.addSubview(imageview)
        view.addSubview(containerView)
        containerView.addSubview(vStack)
        containerView.addSubview(hStack)
        
        setupImageView()
        setupContainerView()
        setupVStack()
        setupEmailField()
        setupPasswordField()
        setupLoginButton()
        setupHStack()
        setupLabels()
        
    }
    
    func setupImageView() {
//        let imageHeight = view.frame.height * 2/3
        let imageHeight = view.frame.height / 2
        imageview.image = #imageLiteral(resourceName: "splash")
        imageview.contentMode = .scaleAspectFill
        imageview.fillHorizontally(parent: view)
        imageview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageview.heightAnchor.constraint(equalToConstant: imageHeight).isActive = true
    }
    
    func setupContainerView() {
        containerView.fillHorizontally(parent: view)
        containerView.topAnchor.constraint(equalTo: imageview.bottomAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setupVStack() {
        vStack.axis = .vertical
        vStack.distribution = .fillEqually
        vStack.spacing = 12
        
        vStack.fillHorizontally(parent: containerView, margin: 20)
        vStack.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        
        vStack.addArrangedSubview(emailTextfield)
        vStack.addArrangedSubview(passwordTextfield)
        vStack.addArrangedSubview(loginButtton)
        vStack.addArrangedSubview(hStack)
        
    }
    
    func setupEmailField() {
        emailTextfield.placeholder = "Email"
        emailTextfield.textContentType = .emailAddress
        emailTextfield.layer.cornerRadius = 6
        emailTextfield.borderStyle = .roundedRect
        emailTextfield.layer.borderWidth = 1
        emailTextfield.layer.borderColor = UIColor(rgb: 0xC3D3D4).cgColor
        emailTextfield.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
    
    func setupPasswordField() {
        passwordTextfield.placeholder = "Password"
        passwordTextfield.isSecureTextEntry = true
        passwordTextfield.layer.cornerRadius = 6
        passwordTextfield.borderStyle = .roundedRect
        passwordTextfield.layer.borderWidth = 1
        passwordTextfield.layer.borderColor = UIColor(rgb: 0xC3D3D4).cgColor
        passwordTextfield.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
    
    func setupLoginButton() {
        loginButtton.setTitle("Login", for: .normal)
        loginButtton.addTarget(self, action: #selector(loginButtonPressed(sender:)), for: .touchUpInside)
        loginButtton.layer.cornerRadius = 6
        loginButtton.backgroundColor = UIColor(rgb: 0x020930)
    }
    
    func setupHStack() {
        hStack.axis = .horizontal
        hStack.distribution = .fillEqually
        
        hStack.addArrangedSubview(forgetPasswordLabel)
        hStack.addArrangedSubview(createAccountLabel)
    }
    
    func setupLabels() {
        forgetPasswordLabel.textAlignment = .center
        createAccountLabel.textAlignment = .center
        
        // TODO: vertical spacer, clickable label.
        
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        
        let passwordAttributedString = NSAttributedString(string: "Forget Password", attributes: underlineAttribute)
        forgetPasswordLabel.attributedText = passwordAttributedString
        
        let accountAttributedString = NSAttributedString(string: "Create an account", attributes: underlineAttribute)
        createAccountLabel.attributedText = accountAttributedString

    }
    
    
    
    
    @objc func loginButtonPressed(sender: UIButton) {
        print("clicked")
    }
}
