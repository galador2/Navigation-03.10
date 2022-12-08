//
//  ProfileViewController.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 03.10.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private let viewNew:ProfileHeaderView = {
        let viewNew = ProfileHeaderView()
        viewNew.translatesAutoresizingMaskIntoConstraints = false
        return viewNew
    }()


    private func setupConstraint(){
        NSLayoutConstraint.activate([
            viewNew.leftAnchor.constraint(equalTo: view.leftAnchor),
            viewNew.rightAnchor.constraint(equalTo: view.rightAnchor),
            viewNew.topAnchor.constraint(equalTo: view.topAnchor )

        ])
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(viewNew)
          setupConstraint()



    }
   
}

extension ProfileViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewNew.newPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? PostTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        let post = self.viewNew.newPost [indexPath.row]
        let newPost1 = PostTableViewCell.PostView(author: "kirill.kostenko", description: "my first foto", image: UIImage(systemName: "first"), likes: 10, views: 10)
        return cell
    }
    
    
    private func tableView(_ tableView:UITableView, viewForHeaderInSection:ProfileViewController ) -> UIView {
        let headerView = ProfileHeaderView()
        return headerView
        
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if section == 0 {
//            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as? ProfileHeaderView else { return nil }
//
//            let viewModel = ProfileHeaderView (text: "Хедер таблицы")
//            headerView.setup(with: viewModel)
//            return headerView
//        }
//
//        return nil
//    }
}
