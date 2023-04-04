//
//  FeedViewController.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 03.10.2022.
//

import UIKit
import StorageService

class FeedViewController: UIViewController {
    
    
    public var password = "777"
    
    var post = Post(title: "Пост")
    public init(post: Post = Post(title: "Пост")) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var textHolder: UITextField = {
        let text = UITextField()
        text.placeholder = "PASSWORD"
        text.textAlignment = .center
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.backgroundColor = .white
        text.layer.cornerRadius = 15
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var checkGuessButton: CustomButton = {
        let button = CustomButton(title: "AIR", backgroundColor: .green, titleColor: .white)
        button.addTarget(self, action: #selector(checkPassword), for: .touchUpInside)
        button.layer.cornerRadius = 14
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    private lazy var colorLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    
    private lazy var button:CustomButton = {
        let button = CustomButton(title: "ONAIR", backgroundColor: .systemPink, titleColor: .white)
        button.layer.cornerRadius = 14
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
        
    }()
    func addFunc(){
        view.addSubview(button)
    }
    private func setupButton(){
        self.view.addSubview(self.button)
        self.view.addSubview(self.checkGuessButton)
        self.view.addSubview(self.textHolder)
        self.view.addSubview(self.colorLabel)
        
        self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive=true
        self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -20).isActive=true
        self.button.heightAnchor.constraint(equalToConstant: 50).isActive=true
        
        self.checkGuessButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive=true
        self.checkGuessButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100).isActive=true
        self.checkGuessButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -100).isActive=true
        self.checkGuessButton.heightAnchor.constraint(equalToConstant: 40).isActive=true
        
        self.textHolder.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 250).isActive=true
        self.textHolder.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100).isActive=true
        self.textHolder.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -100).isActive=true
        self.textHolder.heightAnchor.constraint(equalToConstant: 50).isActive=true
        
        self.colorLabel.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 200).isActive=true
        self.colorLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100).isActive=true
        self.colorLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -100).isActive=true
        self.colorLabel.heightAnchor.constraint(equalToConstant: 40).isActive=true
    }
    
    @objc private func checkPassword() -> Bool{
                let feedModel = FeedModel()
        if textHolder.text == feedModel.secretWord{
                    print("TRUE")
            colorLabel.backgroundColor = .green
            colorLabel.text = "TRUE"
            colorLabel.textAlignment = .center
            colorLabel.font = UIFont.boldSystemFont(ofSize: 25)
        return feedModel.check(secretWord: password)
                }
        print("FAIL")
        colorLabel.backgroundColor = .red
        colorLabel.text = "FALSE"
        colorLabel.textAlignment = .center
        colorLabel.font = UIFont.boldSystemFont(ofSize: 25)
        return false
        }

    
    @objc private func buttonAction(){
        let postViewController = PostViewController()
        //postViewController.titleName = post.title
        self.navigationController?.pushViewController(postViewController, animated: true)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addFunc()
        setupButton()
        view.backgroundColor = .systemBlue
    }
 

    }
