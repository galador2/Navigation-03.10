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
    private var avatarTopConstant: NSLayoutConstraint?
    private var avatarLeadingConstant: NSLayoutConstraint?
    private var isImageViewIncreased = false
    private var originalViewWidthConstaint:CGFloat?
    private var originalViewHightConstaint:CGFloat?
    private var originalTopConstant:CGFloat?
    private var originalLeadingConstant:CGFloat?

    
    
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
    
    private lazy var blackView:UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var avatarTap:UIImageView = {
       var avatar = UIImageView()
       let newAvatar = UIImage(named: "KirKost")
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
       avatar.isHidden = true
       return avatar
   }()
    
    private lazy var xButton:UIButton = {
        var xButton = UIButton()
        xButton.setImage(UIImage(named: "X"), for: .normal)
        xButton.alpha = 0
        xButton.addTarget(self, action: #selector(xButtonTouch), for: .touchUpInside)
        xButton.translatesAutoresizingMaskIntoConstraints = false
        return xButton
    }()

    
   private func setupConstraint(){
#if DEBUG
       
       self.tableView.backgroundColor = .systemCyan
    
#else
       self.tableView.backgroundColor = .systemGray4
    
#endif
        self.avatarViewWidthConstaint =
        avatarTap.widthAnchor.constraint(equalToConstant: 150)
        self.avatarViewHightConstaint =
        avatarTap.heightAnchor.constraint(equalToConstant: 150)
        self.avatarTopConstant =  avatarTap.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor, constant: 16)
        self.avatarLeadingConstant =  avatarTap.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
       
       originalTopConstant = avatarTopConstant?.constant
       originalLeadingConstant = avatarLeadingConstant?.constant
       originalViewWidthConstaint = avatarViewWidthConstaint?.constant
       originalViewHightConstaint = avatarViewHightConstaint?.constant
        
        self.view.addSubview(tableView)
        self.view.addSubview(blackView)
        self.view.addSubview(avatarTap)
        self.view.addSubview(xButton)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            self.blackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.blackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.blackView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.blackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            avatarLeadingConstant,
            avatarTopConstant,
            avatarViewWidthConstaint,
            avatarViewHightConstaint,
            
            self.xButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5),
            self.xButton.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 160),
            self.xButton.widthAnchor.constraint(equalToConstant: 20),
            self.xButton.heightAnchor.constraint(equalToConstant: 20)
        ].compactMap({ $0 }))
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraint()
        navigationController?.navigationBar.isHidden = true
        let tap = UITapGestureRecognizer(target:self, action: #selector(didTapAnimationButton))
        avatarTap.addGestureRecognizer(tap)

    }


    @objc private func didTapAnimationButton() {
        self.avatarTap.isUserInteractionEnabled = true
        UIView.animateKeyframes(withDuration: 1.0, delay: 0, options: .calculationModeCubic) {
                       UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.50) {
                           self.avatarViewWidthConstaint?.constant = self.view.frame.width
                           self.avatarViewHightConstaint?.constant = self.view.frame.width
                           self.avatarLeadingConstant?.constant = 0
                           self.avatarTopConstant?.constant = self.view.frame.width/3
                           self.blackView.backgroundColor = .black
                           self.blackView.alpha = 0.7
                           self.view.layoutIfNeeded()
                       }
            UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.25) {
                self.xButton.alpha = 1
                self.avatarTap.layer.cornerRadius = 0
                self.blackView.isHidden = false
                self.xButton.isHidden = false
            }

                   } completion: { _ in
                   }
        
    }
    
    @objc private func xButtonTouch(){
        UIView.animate(withDuration: 1, delay: 0.0, options: .curveEaseInOut ){
        self.blackView.isHidden = true
        self.xButton.isHidden = true
        self.avatarTap.layer.cornerRadius = 75
            self.avatarTopConstant?.constant = self.originalTopConstant ?? 0
            self.avatarLeadingConstant?.constant = self.originalLeadingConstant ?? 0
            self.avatarViewHightConstaint?.constant = self.originalViewHightConstaint ?? 0
            self.avatarViewWidthConstaint?.constant = self.originalViewWidthConstaint ?? 0
        }
    }
}

extension ProfileViewController:UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as? ProfileHeaderView  else { return nil }
            
            #if DEBUG
            let currentUserService = CurrentUserService()
            currentUserService.user = User(loginUser: "2", fullName: "Kirill Kirill", avatar: UIImage(named: "KirKost"), status: "busy")
            
            headerView.statusLabel.text = currentUserService.user.status
            headerView.fullNameLabel.text = currentUserService.user.fullName
            headerView.avatarImageView.image = currentUserService.user.avatar

            headerView.profileVC = self

            
            return headerView
            
            #else
            
            let testUserService = TestUserService()
            testUserService.user = User(loginUser: "1", fullName: "Kostenko", avatar: UIImage(named: "first"), status: "study")
            headerView.statusLabel.text = testUserService.user.status
            headerView.fullNameLabel.text = testUserService.user.fullName
            headerView.avatarImageView.image = testUserService.user.avatar
            
            headerView.profileVC = self
            
            return headerView
            
            #endif
            
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
    
    
    

