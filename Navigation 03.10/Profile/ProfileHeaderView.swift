//
//  ProfileHeaderView.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 03.11.2022.
//

import UIKit

class ProfileHeaderView:UIView {

    private let button:UIButton = {
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
        button1.frame = CGRect(x: 16, y: 284, width: 360, height: 50)
        return button1
        
    }()
   
    private let labelFirst:UILabel = {
         let label = UILabel()
         label.text = "Kostenko Kirill"
         label.font = UIFont.boldSystemFont(ofSize: 18)
         label.textColor = .black
         label.translatesAutoresizingMaskIntoConstraints = false
         label.frame = CGRect(x: 180, y: 120, width: 200, height: 40)
         return label
     }()
    
    private let labelSecond:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .gray
        label.frame = CGRect(x: 180, y: 180 , width: 200, height: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    private let labelStatus: UITextField = {
        let label = UITextField()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .black
        label.frame = CGRect(x: 180, y: 235, width: 195, height: 40)
        label.layer.cornerRadius = 12
        label.layer.borderWidth = 1
        label.backgroundColor = .white
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.newFotoImage()
        addSubview(button)
        buttonAction()
        addSubview(labelFirst)
        addSubview(labelSecond)
        addSubview(labelStatus)
    }
    required init?(coder: NSCoder) {
        nil
    }
    
    private func newFotoImage(){
        var myView = UIImageView()
        let myFotoImage = UIImage(named: "KirKost")
        myView = UIImageView(image: myFotoImage)
        myView.layer.cornerRadius = 75
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.layer.borderWidth = 3
        myView.layer.borderColor = UIColor.white.cgColor
        myView.clipsToBounds = true
        myView.frame = CGRect(x: 16, y: 100, width: 150, height: 150)
        addSubview(myView)
        
    }
    @objc private func buttonAction(){
        labelSecond.text = labelStatus.text
        print(labelStatus.text)
        
    }
}
