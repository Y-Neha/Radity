//
//  NotificationViewController.swift
//  Radity
//
//  Created by Neha Yadav on 09/01/20.
//  Copyright © 2020 Neha Yadav. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
    
    let vStack = ViewBuilder.stackview()
    let profileButton = ViewBuilder.button()
    let favoritesButton = ViewBuilder.button()
    let marketButton = ViewBuilder.button()
    let upgradeButton = ViewBuilder.button()
    let settingsButton = ViewBuilder.button()
    let joinCommunityButton = ViewBuilder.button()
    
    let profileHStack = ViewBuilder.stackview()
    let favoritesHStack = ViewBuilder.stackview()
    let marketHStack = ViewBuilder.stackview()
    let upgradeHStack = ViewBuilder.stackview()
    let settingsHStack = ViewBuilder.stackview()
    let joinCommunityHStack = ViewBuilder.stackview()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor(rgb: 0x0f1847)
        view.addSubview(vStack)
        setupVStackView()
        addClickHandlerOnButtons()
    }
    
    func setupVStackView() {
        vStack.fillHorizontally(parent: view, margin: 20)
        vStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        vStack.heightAnchor.constraint(equalToConstant: 400).isActive = true
        vStack.axis = .vertical
        vStack.distribution = .fillEqually
        vStack.alignment = .leading
        
        profileHStack.arrangeHStack(title: "Profile", icon: "person.circle", button: profileButton)
        favoritesHStack.arrangeHStack(title: "Favorites", icon: "star.fill", button: favoritesButton)
        marketHStack.arrangeHStack(title: "Market", icon: "dollarsign.circle.fill", button: marketButton)
        upgradeHStack.arrangeHStack(title: "Upgrade", icon: "arrow.up.circle.fill", button: upgradeButton)
        settingsHStack.arrangeHStack(title: "Settings", icon: "gear", button: settingsButton)
        joinCommunityHStack.arrangeHStack(title: "Join Community", icon: "person.3.fill", button: joinCommunityButton)
        
        vStack.addArrangedSubview(profileHStack)
        vStack.addArrangedSubview(favoritesHStack)
        vStack.addArrangedSubview(marketHStack)
        vStack.addArrangedSubview(upgradeHStack)
        vStack.addArrangedSubview(settingsHStack)
        vStack.addArrangedSubview(joinCommunityHStack)
    }
    
    func addClickHandlerOnButtons() {
        profileButton.addTarget(self, action: #selector(profileButtonPressed(sender:)), for: .touchUpInside)
        favoritesButton.addTarget(self, action: #selector(favoritesButtonPressed(sender:)), for: .touchUpInside)
        marketButton.addTarget(self, action: #selector(marketButtonPressed(sender:)), for: .touchUpInside)
        upgradeButton.addTarget(self, action: #selector(upgradeButtonPressed(sender:)), for: .touchUpInside)
        settingsButton.addTarget(self, action: #selector(settingsButtonPressed(sender:)), for: .touchUpInside)
        joinCommunityButton.addTarget(self, action: #selector(joinCommunityButtonPressed(sender:)), for: .touchUpInside)
    }
    
    
    @objc func profileButtonPressed(sender: UIButton) {
        print("profile pressed")
    }
    
    @objc func favoritesButtonPressed(sender: UIButton) {
        print("favoritesButtonPressed")
    }
    
    @objc func marketButtonPressed(sender: UIButton) {
        print("marketButtonPressed")        
        tabBarController?.selectedIndex = 3

    }
    
    @objc func upgradeButtonPressed(sender: UIButton) {
        print("upgradeButtonPressed")
    }
    
    @objc func settingsButtonPressed(sender: UIButton) {
        print("settingsButtonPressed")
    }
    
    @objc func joinCommunityButtonPressed(sender: UIButton) {
        print("joinCommunityButtonPressed")
    }
}

extension UIStackView {
    
    func arrangeHStack(title: String, icon: String, button: UIButton) {
        axis = .horizontal
        distribution = .fill
        spacing = 20
        let imageview = ViewBuilder.imageView()
        imageview.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageview.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imageview.contentMode = .scaleAspectFit
        imageview.image = UIImage(systemName: icon)
        imageview.tintColor = .white
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Black", size: 20)
        button.setTitleColor(.white, for: .normal)
        
        addArrangedSubview(imageview)
        addArrangedSubview(button)
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct MoreViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return MoreViewController().view
    }
    
    func updateUIView(_ view: UIView, context: Context) {
        
    }
}

@available(iOS 13.0, *)
struct MoreViewController_Preview: PreviewProvider {
    static var previews: some View {
        MoreViewRepresentable()
    }
}
#endif

