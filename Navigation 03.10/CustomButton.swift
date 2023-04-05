//
//  CustomButton.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 24.03.2023.
//

import UIKit

class CustomButton: UIButton{
    
    var buttonTapped:(()->Void)?
    
    override init(frame: CGRect) {
        super .init(frame: frame)
   
    }
    init(title:String, backgroundColor:UIColor, titleColor:UIColor){
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        layer.masksToBounds = false
        clipsToBounds = true
        addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")    }

  @objc private func tapped(){
      buttonTapped?()
               }
}
