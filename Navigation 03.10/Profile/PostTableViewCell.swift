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
        let image:UIImage?
        let description:String
        let likes:String
        let views:String
    }
    
    private lazy var authorLabel:UILabel = {
        let author = UILabel()
        author.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        author.textColor = .black
        author.numberOfLines = 2
        author.translatesAutoresizingMaskIntoConstraints = false
        return author
        
    }()
    
    private lazy var descriptionLabel:UILabel = {
        let description = UILabel()
        description.textColor = .systemGray
        description.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        description.numberOfLines = 0
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
        
    }()
    
    private lazy var imageLabel: UIImageView = {
        let imagePost = UIImageView()
        imagePost.contentMode = .scaleAspectFit
        imagePost.backgroundColor = .black
        imagePost.clipsToBounds = true
        imagePost.translatesAutoresizingMaskIntoConstraints = false
        return imagePost
        
    }()
    
    private lazy var likesLabel: UILabel = {
        let buttonPost = UILabel()
        buttonPost.textColor = .black
        buttonPost.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        buttonPost.translatesAutoresizingMaskIntoConstraints = false
        return buttonPost
    }()
    
    private lazy var viewslabel: UILabel = {
        let viewslabel = UILabel()
        viewslabel.textColor = .black
        viewslabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.authorLabel.text = nil
        self.imageLabel.image = nil
        self.descriptionLabel.text = nil
        self.likesLabel.text = nil
    }
    
    func setup (with newPost: PostView){
        self.authorLabel.text = newPost.author
        self.imageLabel.image = newPost.image
        self.descriptionLabel.text = newPost.description
        self.likesLabel.text = newPost.likes
        self.viewslabel.text = newPost.views
    }
    

   
    
    private func setupView(){
        self.contentView.addSubview(self.authorLabel)
        self.contentView.addSubview(self.imageLabel)
        self.contentView.addSubview(self.descriptionLabel)
        self.contentView.addSubview(self.likesLabel)
        self.contentView.addSubview(self.viewslabel)
        
        NSLayoutConstraint.activate([
            self.authorLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.authorLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 16),
            self.authorLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.authorLabel.bottomAnchor.constraint(equalTo: self.imageLabel.topAnchor, constant: -16),
            
            
            self.imageLabel.topAnchor.constraint(equalTo: self.authorLabel.bottomAnchor, constant: -16),
            self.imageLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.imageLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.imageLabel.widthAnchor.constraint(equalTo: self.imageLabel.heightAnchor,multiplier: 1.0),
            self.imageLabel.bottomAnchor.constraint(equalTo: self.descriptionLabel.topAnchor,constant: -16),
        
            
            self.descriptionLabel.topAnchor.constraint(equalTo: self.imageLabel.bottomAnchor),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 16),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -16),
            self.descriptionLabel.bottomAnchor.constraint(equalTo: self.likesLabel.topAnchor,constant: -16),

           
        
            self.likesLabel.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor),
            self.likesLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 16),
            self.likesLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16),
            
            
            self.viewslabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.viewslabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16)
            
            
            
        ])
    }
    
}

