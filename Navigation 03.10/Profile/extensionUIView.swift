//
//  extensionUIView.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 29.11.2022.
//

import UIKit

extension UIView{
    func addSubviews(_ subwiews: UIView ...){
        subwiews.forEach({addSubview($0)})
    }
}
