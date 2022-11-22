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
        return viewNew
    }()
    
    
    override func viewWillLayoutSubviews(){
        view.addSubview(viewNew)
        super.viewWillLayoutSubviews()
        viewNew.frame=self.view.frame
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
     
    
    }
   
}

