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
    
    private func setupConstraint(){
        NSLayoutConstraint.activate([
            viewNew.leftAnchor.constraint(equalTo: view.leftAnchor),
            viewNew.rightAnchor.constraint(equalTo: view.rightAnchor),
            viewNew.topAnchor.constraint(equalTo: view.topAnchor),
            viewNew.widthAnchor.constraint(equalTo: view.widthAnchor)
    
        ])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(viewNew)
        setupConstraint()
     
    
    }
   
}
