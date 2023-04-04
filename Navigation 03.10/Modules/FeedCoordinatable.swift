//
//  FeedCoordinatable.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 30.03.2023.
//

import UIKit

protocol FeedCoordinatable: AnyObject{
    
    var childCoordinators:[FeedCoordinatable] {get}
    func start()->UIViewController

}
