//
//  ProfileViewController.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 03.10.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "HeaderView")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var newPost:[PostTableViewCell.PostView] = [
        PostTableViewCell.PostView(author: "kirill.kostenko", image: UIImage(named: "first"), description: "Я помню чудное мгновенье: Передо мной явилась ты, Как мимолетное виденье, Как гений чистой красоты.", likes: "Likes:10", views: "Views:10"),
        PostTableViewCell.PostView(author: "kirill.kostenko", image: UIImage(named: "second"), description: "my second foto", likes: "Likes:23", views: "Views:30"),
        PostTableViewCell.PostView(author: "kirill.kostenko", image: UIImage(named: "third"), description: "my third foto", likes: "Likes:47", views: "Views:100"),
        PostTableViewCell.PostView(author: "kirill.kostenko", image: UIImage(named: "fourth"), description: "my fourth foto", likes: "Likes:35", views: "Views:50")
        
           
    ]
    


    private func setupConstraint(){
        NSLayoutConstraint.activate([

            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        setupConstraint()
        
    }
   
}

extension ProfileViewController:UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as? ProfileHeaderView else { return nil }

            let viewModel = ProfileHeaderView()
            return headerView

        }

        return nil
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.newPost.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? PostTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)

            return cell
        }

        let post = self.newPost [indexPath.row]

        cell.setup(with: newPost[indexPath.row])

        return cell
        
        
    }
    
    
}
