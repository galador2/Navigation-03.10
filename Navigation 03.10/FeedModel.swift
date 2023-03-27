//
//  FeedModel.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 27.03.2023.
//

import UIKit

class FeedModel{
    let feedViewController = FeedViewController()
     var secretWord = "777"
    
     func check(secretWord:String)->Bool{
        if secretWord == feedViewController.password{
            return true
        }
        return false
    }
}
