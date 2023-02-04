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
        tableView.register(CustomPhotosTableCell.self, forCellReuseIdentifier: "CustomFoto")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
   
    private var avatarViewWidthConstaint:NSLayoutConstraint?
    private var avatarViewHightConstaint: NSLayoutConstraint?
    private var isImageViewIncreased = false


    
    
    var newPost:[PostTableViewCell.PostView] = [
        PostTableViewCell.PostView(author: "kirill.kostenko", image: UIImage(named: "first"), description: "Я помню чудное мгновенье: Передо мной явилась ты, Как мимолетное виденье, Как гений чистой красоты.", likes: "Likes:10", views: "Views:10"),
        PostTableViewCell.PostView(author: "kirill.kostenko", image: UIImage(named: "second"), description: "my second foto", likes: "Likes:23", views: "Views:30"),
        PostTableViewCell.PostView(author: "kirill.kostenko", image: UIImage(named: "third"), description: "my third foto", likes: "Likes:47", views: "Views:100"),
        PostTableViewCell.PostView(author: "kirill.kostenko", image: UIImage(named: "fourth"), description: "my fourth foto", likes: "Likes:35", views: "Views:50"),
        PostTableViewCell.PostView(author: "kirill.kostenko", image: UIImage(named: "first"), description: "Я помню чудное мгновенье: Передо мной явилась ты, Как мимолетное виденье, Как гений чистой красоты.", likes: "Likes:10", views: "Views:10")
    ]
    
    var secondPost:[CustomPhotosTableCell.fotoView] = [
        CustomPhotosTableCell.fotoView(logo: "Photos", systemImage: UIImage(systemName: "arrow.right"), image1: UIImage(named: "foto1"), image2: UIImage(named: "foto2"), image3: UIImage(named: "foto3"), image4: UIImage(named: "foto4"))
    ]
    
    var avatarTap:UIImageView = {
       var avatar = UIImageView()
       let newAvatar = UIImage(named: "foto1")
       avatar = UIImageView(image: newAvatar)
        let tap = UITapGestureRecognizer(target:self, action: #selector(didTapAnimationButton))
       avatar.addGestureRecognizer(tap)
       avatar.isUserInteractionEnabled = true
       avatar.layer.cornerRadius = 75
       avatar.contentMode = .scaleAspectFill
       avatar.translatesAutoresizingMaskIntoConstraints = false
       avatar.layer.borderWidth = 3
       avatar.layer.borderColor = UIColor.white.cgColor
       avatar.clipsToBounds = true
       return avatar
   }()


    private func setupConstraint(){
        NSLayoutConstraint.activate([

            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            
        ])
    }
    
    func addAvatarConstraint(){
        self.avatarViewWidthConstaint =
        avatarTap.widthAnchor.constraint(equalToConstant: 150)
        self.avatarViewHightConstaint =
        avatarTap.heightAnchor.constraint(equalToConstant: 150)
        
        NSLayoutConstraint.activate([
            avatarTap.leadingAnchor.constraint(equalTo: self.tableView.leadingAnchor, constant: 16),
            avatarTap.topAnchor.constraint(equalTo: self.tableView.topAnchor,constant: 16),
            self.avatarViewWidthConstaint,
            self.avatarViewHightConstaint
        ].compactMap({ $0 }))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        setupConstraint()
        navigationController?.navigationBar.isHidden = true
        
    }
    
//    @objc func fullScreen(tapGestureRecognizer :UITapGestureRecognizer){
//       // self.view?.removeFromSuperview()
//       // let tap = tapGestureRecognizer.view as! UIImageView
//        UIView.animate(withDuration: 1.0) {
//            self.avatarTap.transform = self.isImageViewIncreased
//            ? .identity
//            : CGAffineTransform(scaleX: 2.0, y: 2.0)
//        } completion: { _ in
//            self.isImageViewIncreased.toggle()
//        }
//       print("good")
//    }
           @objc func didTapAnimationButton() {
               self.avatarTap.isUserInteractionEnabled = false
    
                let completion: () -> Void = { [weak self] in
                    self?.avatarTap.isUserInteractionEnabled = true
                }
    
               self.layoutAvatar(completion: completion)
            }
    
            func layoutAvatar(completion: @escaping()->Void){
//                self.avatarViewWidthConstaint?.constant = self.isImageViewIncreased ? 100: self.view.bounds.width
//                self.avatarViewHightConstaint?.constant = self.isImageViewIncreased ? 100: self.view.bounds.width
                UIView.animate(withDuration: 3.0, delay: 0.0, options: .curveEaseInOut) {
                    self.avatarTap.transform = self.isImageViewIncreased
                               ? .identity
                               : CGAffineTransform(scaleX: 1.0, y: 1.0)
                           } completion: { _ in
                               self.isImageViewIncreased.toggle()
                           }
                          
                }
    
   
}

extension ProfileViewController:UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        self.tableView.addSubview(avatarTap)
        addAvatarConstraint()
        didTapAnimationButton()

        if section == 0 {
            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as? ProfileHeaderView else { return nil }

            let viewModel = ProfileHeaderView()
            
            return headerView
            
        }
        
        return nil
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == tableView ? newPost.count:secondPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == .zero {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomFoto", for: indexPath) as! CustomPhotosTableCell
            let post = self.secondPost [indexPath.row]
            cell.setupFoto (with: secondPost[indexPath.row])
            return cell
        }
        
        
        else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! PostTableViewCell
                let post = self.newPost [indexPath.row]
                cell.setup(with: newPost[indexPath.row])
                return cell
            }

        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == .zero {
            let photosViewController = PhotosViewController()
            photosViewController.title = title
            self.navigationController?.pushViewController(photosViewController, animated: true)}
        
        
      
    }
    
        
    }
    
    
    

