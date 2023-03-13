//
//  MyLoginFactory.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 13.03.2023.
//

import UIKit

struct MyLoginFactory: LoginFactory {
    func makeLoginInspector ()  -> LoginInspector {
        print ("Создан LoginInspector")
        return LoginInspector()
    }
}
