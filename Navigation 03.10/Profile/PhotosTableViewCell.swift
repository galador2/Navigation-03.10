//
//  PhotosTableViewCellViewController.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 13.01.2023.
//

import UIKit

class PhotosTableViewCell: UIViewController {
    
    private lazy var secondTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "HeaderView")
        tableView.register(CustomPhotosTableView.self, forCellReuseIdentifier: "CustomTwo")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultTwo")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var fotoCollection:[CustomPhotosTableView.fotoView] = [
        CustomPhotosTableView.fotoView(image1: UIImage(named: "foto1"), image2: UIImage(named: "foto2"), image3: UIImage(named: "foto3"), image4: UIImage(named: "foto4"))
    
    ]
    
    private func setupConstraint2(){
        NSLayoutConstraint.activate([
            secondTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            secondTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            secondTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            secondTableView.topAnchor.constraint(equalTo: self.secondTableView.topAnchor)
        
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(secondTableView)
        setupConstraint2()

       
    }
    

}

extension PhotosTableViewCell:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as? ProfileHeaderView else { return nil }

            let viewModel = ProfileHeaderView()
            return headerView

        }

        return nil
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.fotoCollection.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let secondCell = tableView.dequeueReusableCell(withIdentifier: "CustomTwo", for: indexPath) as? CustomPhotosTableView else {
            let secondCell = tableView.dequeueReusableCell(withIdentifier: "DefaultTwo", for: indexPath)

            return secondCell
        }
        
        let post = self.fotoCollection[indexPath.row]
        
        secondCell.setupFoto(with: fotoCollection[indexPath.row])
        return secondCell
    }
    
    
}

