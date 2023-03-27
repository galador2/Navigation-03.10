//
//  CustomButton.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 24.03.2023.
//

import UIKit

class CustomButton: UIButton{
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        customButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customButton()
    }
    
     func customButton(){
         setTitle("ONAIR", for: .normal)
         setTitleColor(UIColor.white, for: .normal)
         backgroundColor = .systemPink
         layer.cornerRadius = 14
         titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
         translatesAutoresizingMaskIntoConstraints = false
    }

  @objc private func buttonTapped(){

    }
}
