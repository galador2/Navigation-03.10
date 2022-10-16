//
//  PostViewController.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 03.10.2022.
//

import UIKit

class PostViewController: UIViewController {
    var titleName = "Стартовая страница"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(infoViewController))
        navigationItem.rightBarButtonItem = barButtonItem
        

        // Do any additional setup after loading the view.
    }
    @objc func infoViewController(){
        self.navigationController?.pushViewController(InfoViewController(), animated: true)
        
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
