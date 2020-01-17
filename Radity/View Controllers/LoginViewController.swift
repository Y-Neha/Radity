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
    let containerView = ViewBuilder.view()
    let emailTextfield = ViewBuilder.textfield()
    let passwordTextfield = ViewBuilder.textfield()
    let vStack = ViewBuilder.stackview()
    let loginButtton = ViewBuilder.button()
    let hStack = ViewBuilder.stackview()
    let forgetPasswordLabel = ViewBuilder.label()
    let createAccountLabel = ViewBuilder.label()
    let verticalLine = ViewBuilder.view()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoginView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard(notification: )), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyboard(notification: )), name: UIResponder.keyboardWillHideNotification, object: nil)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func hideKeyboard(notification: Notification) {
        view.center.y = view.frame.height/2
    }
    
    
    @objc func showKeyboard(notification: Notification) {
        
        guard let keyboardHeight = getKeyboardHeight(notification: notification) else { return }
        
        var bottomOffset: CGFloat = .zero
        
        if(emailTextfield.isEditing) {
            bottomOffset = getOffset(textfield: emailTextfield)
        } else if(passwordTextfield.isEditing) {
            bottomOffset = getOffset(textfield: passwordTextfield)
        }
        print(bottomOffset)
        view.center.y = view.frame.height/2 - abs(bottomOffset - keyboardHeight)
    }
    
    func getOffset(textfield: UITextField) -> CGFloat {
        let bottom = containerView.frame.origin.y + textfield.frame.origin.y + textfield.frame.height + 30
        return view.frame.height - bottom
    }
    
    func getKeyboardHeight(notification: Notification) -> CGFloat? {
        return (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height
    }
    
    func setupLoginView() {
        view.addSubview(imageview)
        view.addSubview(containerView)
        containerView.addSubview(vStack)
        containerView.addSubview(hStack)
        containerView.backgroundColor = .white
        
        setupImageView()
        setupContainerView()
        setupVStack()
        setupEmailField()
        setupPasswordField()
        setupLoginButton()
        setupHStack()
        setupLabels()
        setupVerticalLine()
    }
    
    func setupImageView() {
        imageview.image = #imageLiteral(resourceName: "splash")
        imageview.contentMode = .scaleAspectFill
        imageview.fillHorizontally(parent: view)
        imageview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -140).isActive = true
    }
    
    func setupContainerView() {
        containerView.fillHorizontally(parent: view)
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        containerView.layer.cornerRadius = 8
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
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
        emailTextfield.delegate = self
        passwordTextfield.isSecureTextEntry = true
    }
    
    func setupPasswordField() {
        passwordTextfield.placeholder = "Password"
        passwordTextfield.isSecureTextEntry = true
        passwordTextfield.layer.cornerRadius = 6
        passwordTextfield.borderStyle = .roundedRect
        passwordTextfield.layer.borderWidth = 1
        passwordTextfield.layer.borderColor = UIColor(rgb: 0xC3D3D4).cgColor
        passwordTextfield.heightAnchor.constraint(equalToConstant: 56).isActive = true
        passwordTextfield.delegate = self
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
        forgetPasswordLabel.isUserInteractionEnabled = true
        createAccountLabel.textAlignment = .center
        createAccountLabel.isUserInteractionEnabled = true
        
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        
        let passwordAttributedString = NSAttributedString(string: "Forget Password", attributes: underlineAttribute)
        forgetPasswordLabel.attributedText = passwordAttributedString
        
        let accountAttributedString = NSAttributedString(string: "Create an account", attributes: underlineAttribute)
        createAccountLabel.attributedText = accountAttributedString
        
        setupTapRecognizer()
    }
    
    func setupVerticalLine() {
        hStack.addSubview(verticalLine)
        verticalLine.widthAnchor.constraint(equalToConstant: 1).isActive = true
        verticalLine.backgroundColor = .gray
        verticalLine.centerXAnchor.constraint(equalTo: hStack.centerXAnchor).isActive = true
        verticalLine.topAnchor.constraint(equalTo: hStack.topAnchor, constant: 20).isActive = true
        verticalLine.bottomAnchor.constraint(equalTo: hStack.bottomAnchor, constant: -20).isActive = true
    }
    
    func setupTapRecognizer() {
        let forgetGestureResponder = UITapGestureRecognizer(target: self, action: #selector(handleForgetPassword(sender:)))
        forgetPasswordLabel.addGestureRecognizer(forgetGestureResponder)
        
        let createPasswordResponder = UITapGestureRecognizer(target: self, action: #selector(handleCreateAccountWorkflow(sender:)))
        createAccountLabel.addGestureRecognizer(createPasswordResponder)
    }
    
    
    
    @objc func loginButtonPressed(sender: UIButton) {
        //TODO: embedd navctrl, push tab, hide navbar here
        navigationController?.pushViewController(TabBarController(), animated: true)
    }
    
    @objc func handleForgetPassword(sender: UILabel) {
        print("handleForgetPassword")
    }
    
    @objc func handleCreateAccountWorkflow(sender: UILabel) {
        print("handleCreateAccountWorkflow")
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}

extension LoginViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct LoginViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return LoginViewController().view
    }
    
    func updateUIView(_ view: UIView, context: Context) {
        
    }
}
@available(iOS 13.0, *)
struct LoginViewController_Preview: PreviewProvider {
    static var previews: some View {
        LoginViewRepresentable()
    }
}

#endif
