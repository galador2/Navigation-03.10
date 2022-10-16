//
//  InfoViewController.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 04.10.2022.
//

import UIKit

class InfoViewController: UIViewController {
    convenience init() {
           self.init(nibName:nil, bundle:nil)
        self.modalPresentationStyle = .fullScreen
       }
    private let button2:UIButton = {
        let button2 = UIButton()
        button2.setTitle("Кнопка2", for: .normal)
        button2.setTitleColor(UIColor.red, for: .normal)
        button2.backgroundColor = .yellow
        button2.layer.cornerRadius = 14
        button2.setImage(UIImage(systemName: "person"), for: .normal)
        button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button2.translatesAutoresizingMaskIntoConstraints = false
        return button2
    }()
    let allertController = UIAlertController(title: "Опасно", message: "Покиньте страницу", preferredStyle: .alert)
    
    private func setupButton2(){
        self.view.addSubview(self.button2)
        self.button2.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        self.button2.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive=true
        self.button2.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -20).isActive=true
        self.button2.heightAnchor.constraint(equalToConstant: 50).isActive=true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightText
        setupButton2()
        setupAlertAction()
        addTargets()
        setupConstraints()
        
        

        // Do any additional setup after loading the view.
    }
    func setupAlertAction(){
        allertController.addAction(UIAlertAction(title: "Продолжить", style: .cancel, handler: nil))
        allertController.addAction(UIAlertAction(title: "Выйти", style: .default, handler: {_ in print ("Alert")}))
        
    }
    func addTargets() {
        button2.addTarget(self, action: #selector(addTarget), for: .touchUpInside)
    }
    
    func setupConstraints(){
        view.addSubview(button2)
        NSLayoutConstraint.activate([
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    @objc func addTarget(){
        self.present(allertController, animated: true, completion: nil)
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
