//
//  ProfileViewController.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 03.10.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    private let viewNew:ProfileHeaderView = {
        let viewNew = ProfileHeaderView()
        viewNew.translatesAutoresizingMaskIntoConstraints = false
        return viewNew
    }()
    
        let buttonSecond:UIButton = {
           let button = UIButton()
            button.setTitle("New button", for: .normal)
            button.setTitleColor(UIColor.white, for: .normal)
            button.backgroundColor = .black
            button.frame = CGRect(x: 0, y: 500, width: 100, height: 50)
            button.layer.cornerRadius = 7
            return button
    
        }()
    
    private func setupConstraint(){
        NSLayoutConstraint.activate([
            viewNew.leftAnchor.constraint(equalTo: view.leftAnchor),
            viewNew.rightAnchor.constraint(equalTo: view.rightAnchor),
            viewNew.topAnchor.constraint(equalTo: view.topAnchor)
    
        ])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(viewNew)
        setupConstraint()
        view.addSubviews(buttonSecond)
     
    
    }
   
}
