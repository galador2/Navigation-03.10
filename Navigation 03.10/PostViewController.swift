//
//  PostViewController.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 03.10.2022.
//

import UIKit

class PostViewController: UIViewController {
    var titleName = "Стартовая страница"
    //var post = Post(title: "Пост")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(infoViewController))
        navigationItem.rightBarButtonItem = barButtonItem
        

        
    }
    @objc func infoViewController(){
        self.navigationController?.present(InfoViewController(), animated: true)
        
    }
    
}
