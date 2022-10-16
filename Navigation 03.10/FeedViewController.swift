//
//  FeedViewController.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 03.10.2022.
//

import UIKit

class FeedViewController: UIViewController {
    var post = Post(title: "Пост")
    
    
    private lazy var button:UIButton = {
        let button = UIButton()
        button.setTitle("Кнопка", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 14
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    func addFunc(){
        view.addSubview(button)
    }
    private func setupButton(){
        self.view.addSubview(self.button)
        self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive=true
        self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -20).isActive=true
        self.button.heightAnchor.constraint(equalToConstant: 50).isActive=true
    }
    
    @objc private func buttonAction(){
        let postViewController = PostViewController()
        postViewController.titleName = post.title
        self.navigationController?.pushViewController(postViewController, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addFunc()
        setupButton()
        buttonAction()
        view.backgroundColor = .systemBlue

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


    }
