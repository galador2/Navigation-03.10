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
    
    private lazy var avatarTap:UIImageView = {
       var avatar = UIImageView()
       let newAvatar = UIImage(named: "foto1")
       avatar = UIImageView(image: newAvatar)
        let tap = UITapGestureRecognizer(target:self, action: #selector(didTapAnimationButton))
       avatar.addGestureRecognizer(tap)
       //avatar.isUserInteractionEnabled = true
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
        self.tableView.addSubview(avatarTap)
        
        self.avatarViewWidthConstaint =
        avatarTap.widthAnchor.constraint(equalToConstant: 150)
        self.avatarViewHightConstaint =
        avatarTap.heightAnchor.constraint(equalToConstant: 150)
        
        NSLayoutConstraint.activate([
            avatarTap.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            avatarTap.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            self.avatarTap.widthAnchor.constraint(equalToConstant: 150),
            self.avatarTap.heightAnchor.constraint(equalToConstant: 150)
        ].compactMap({ $0 }))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        setupConstraint()
        navigationController?.navigationBar.isHidden = true
        
    }

    @objc private func didTapAnimationButton() {
        self.avatarTap.isUserInteractionEnabled = false
        
        let completion: () -> Void = { [weak self] in
            self?.avatarTap.isUserInteractionEnabled = true
        }

        self.animateKeyframes(completion: completion)
    }
    
    private func animateKeyframes(completion: @escaping () -> Void) {
        let centerOrigin = self.avatarTap.center
        self.view.layoutIfNeeded()

                UIView.animateKeyframes(withDuration: 5.0, delay: 0, options: .calculationModeCubic) {
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.30){
                        self.avatarTap.center = self.view.center
                    }

                    UIView.addKeyframe(withRelativeStartTime: 0.35, relativeDuration: 0.50){
                        self.avatarTap.transform =
                        CGAffineTransform(scaleX: self.view.frame.width / 150, y: self.view.frame.width / 150)
                    }

                    UIView.addKeyframe(withRelativeStartTime: 1, relativeDuration: 0.35){
                        //self.avatarTap.center = self.view.center
                        self.avatarTap.transform = .identity
                    }
                }

            completion: { _ in
                //self.avatarTap.transform = .identity
                completion()
            }
//        self.avatarViewWidthConstaint?.constant = self.isImageViewIncreased ? 150:
//        self.view.bounds.width
//        self.avatarViewHightConstaint?.constant = self.isImageViewIncreased ? 150:
//        self.view.bounds.width
        
//        let startPoint = self.avatarTap.frame.origin
//
//        UIView.animate(withDuration: 5.0, delay: 0.0, options: .curveEaseInOut) {
//            self.avatarTap.alpha = 0.9
//            self.avatarTap.center = self.view.center
//            self.view.layoutIfNeeded()
//            self.avatarTap.transform = .identity
//            self.avatarTap.transform = self.isImageViewIncreased
//            ? .identity
//            : CGAffineTransform(scaleX: 2, y: 2 )
//        } completion: { _ in
//            self.avatarTap.center = self.avatarTap.frame.origin
//            completion()
//
//        }
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
        didTapAnimationButton()
        
      
    }
    
        
    }
    
    
    

