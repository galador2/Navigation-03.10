//
//  ProfileHeaderView.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 03.11.2022.
//

import UIKit

class ProfileHeaderView:UIView {
    
    let setStatusButton:UIButton = {
        let button1 = UIButton()
        button1.setTitle("Set status", for: .normal)
        button1.setTitleColor(UIColor.white, for: .normal)
        button1.backgroundColor = .blue
        button1.layer.cornerRadius = 4
        button1.layer.shadowRadius = 4.0
        button1.layer.shadowOpacity = 0.7
        button1.layer.shadowOffset = CGSize(width: 4, height: 4)
        button1.layer.shadowColor = UIColor.black.cgColor
        button1.addTarget(self, action: #selector(buttonAction), for:.touchUpInside)
        button1.translatesAutoresizingMaskIntoConstraints = false
        return button1
        
    }()
    
    let buttonSecond:UIButton = {
       let button = UIButton()
        button.setTitle("New button", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(buttonActionSecond), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 7
        return button
      
    }()
    
    private let fullNameLabel:UILabel = {
        let label = UILabel()
        label.text = "Kostenko Kirill"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .gray
        label.text = "Мой статус"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let statusTextField: UITextField = {
        let label = UITextField()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .black
        label.layer.cornerRadius = 12
        label.layer.borderWidth = 1
        label.backgroundColor = .white
        label.layer.masksToBounds = true
        label.placeholder = "Введите ваш статус"
        label.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: label.frame.height))
        label.leftViewMode = .always
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private lazy var avatarImageView: UIImageView = {
        var myView = UIImageView()
        let myFotoImage = UIImage(named: "KirKost")
        myView = UIImageView(image: myFotoImage)
        myView.layer.cornerRadius = 75
        myView.contentMode = .scaleAspectFill
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.layer.borderWidth = 3
        myView.layer.borderColor = UIColor.white.cgColor
        myView.clipsToBounds = true
        return myView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(
            buttonSecond,
            avatarImageView,
            setStatusButton,
            fullNameLabel,
            statusLabel,
            statusTextField)
        setupConstrait()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been inplemented")
    }
    
    
    func setupConstrait(){
        NSLayoutConstraint.activate([
            self.setStatusButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            self.setStatusButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            self.setStatusButton.topAnchor.constraint(equalTo:avatarImageView.bottomAnchor , constant: 32),
            self.setStatusButton.widthAnchor.constraint(equalToConstant: 360),
            self.setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            self.setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            fullNameLabel.self.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 180),
            
            statusLabel.self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 180),
            statusLabel.self.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -55),
            
            statusTextField.self.widthAnchor.constraint(equalToConstant: 195),
            
            statusTextField.self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 180),
            statusTextField.self.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 16),
            statusTextField.self.heightAnchor.constraint(equalToConstant: 30),
            statusTextField.self.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            avatarImageView.self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.self.widthAnchor.constraint(equalToConstant: 150),
            avatarImageView.self.heightAnchor.constraint(equalToConstant: 150),
            avatarImageView.self.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            
            buttonSecond.self.leftAnchor.constraint(equalTo: self.leftAnchor),
            buttonSecond.self.rightAnchor.constraint(equalTo: self.rightAnchor),
            buttonSecond.self.topAnchor.constraint(equalTo: self.setStatusButton.bottomAnchor, constant: 100)
            
            
        ])
    }
    
    @objc private func buttonAction(){
        statusLabel.text = statusTextField.text
        statusTextField.text = ""
        
    }
    @objc private func buttonActionSecond(){
        let profileViewController = ProfileViewController()
        self.inputViewController?.navigationController?.pushViewController(profileViewController, animated: true)
    }
   
}
