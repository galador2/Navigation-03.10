//
//  TableViewCell.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 06.12.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    struct PostView{
        let author:String
        let description:String
        let image:UIImage?
        let likes:Int
        let views:Int
    }
    
    
    private lazy var authorLabel:UILabel = {
        let author = UILabel()
        author.font = UIFont.boldSystemFont(ofSize: 10)
        author.textColor = .black
        author.translatesAutoresizingMaskIntoConstraints = false
        return author
        
    }()
    
    private lazy var descriptionLabel:UILabel = {
        let description = UILabel()
        description.font = UIFont.systemFont(ofSize: 14)
        description.textColor = .systemGray
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
        
    }()
    
    private lazy var imageLabel: UIImageView = {
        let imagePost = UIImageView()
        imagePost.contentMode = .scaleAspectFill
        imagePost.translatesAutoresizingMaskIntoConstraints = false
        return imagePost
        
    }()
    
    private lazy var likesLabel: UILabel = {
        let buttonPost = UILabel()
        buttonPost.font = UIFont.systemFont(ofSize: 10)
        buttonPost.textColor = .black
        buttonPost.translatesAutoresizingMaskIntoConstraints = false
        return buttonPost
    }()
    
    private lazy var viewslabel: UILabel = {
        let viewslabel = UILabel()
        viewslabel.font = UIFont.systemFont(ofSize: 10)
        viewslabel.textColor = .black
        viewslabel.translatesAutoresizingMaskIntoConstraints = false
        return viewslabel
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup (with newPost: PostView){
        self.authorLabel.text = newPost.author
        self.imageLabel.image = newPost.image
        self.descriptionLabel.text = newPost.description
        self.likesLabel.tag = newPost.likes
        self.viewslabel.tag = newPost.views
    }
    
    private func setupView(){
        self.contentView.addSubview(self.authorLabel)
        self.contentView.addSubview(self.viewslabel)
        self.contentView.addSubview(self.descriptionLabel)
        self.contentView.addSubview(self.likesLabel)
        self.contentView.addSubview(self.imageLabel)
        
        NSLayoutConstraint.activate([
            self.authorLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.authorLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            
            self.imageLabel.topAnchor.constraint(equalTo: self.authorLabel.topAnchor),
            self.imageLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16)
            
        ])
    }
    
}

