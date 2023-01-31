//
//  CustomPhotosTableView.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 13.01.2023.
//

import UIKit

class CustomPhotosTableCell: UITableViewCell {

    struct fotoView{
        let logo:String
        let systemImage:UIImage?
        let image1:UIImage?
        let image2:UIImage?
        let image3:UIImage?
        let image4:UIImage?
    }
    
    private lazy var photoLogo: UILabel = {
        let logo = UILabel()
        logo.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        logo.textColor = .black
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    private lazy var systemImage: UIImageView = {
        var systemImage = UIImageView()
        systemImage.tintColor = .black
        systemImage.translatesAutoresizingMaskIntoConstraints = false
        return systemImage
    }()
    
    
    private lazy var firstImage: UIImageView = {
        let firstImage = UIImageView()
        firstImage.contentMode = .scaleAspectFill
        firstImage.layer.cornerRadius = 6
        firstImage.clipsToBounds = true
        firstImage.translatesAutoresizingMaskIntoConstraints = false
        return firstImage
        
    }()
    
    private lazy var secondImage: UIImageView = {
        let secondImage = UIImageView()
        secondImage.contentMode = .scaleAspectFill
        secondImage.layer.cornerRadius = 6
        secondImage.clipsToBounds = true
        secondImage.translatesAutoresizingMaskIntoConstraints = false
        return secondImage
    }()
    
    private lazy var thirdImage: UIImageView = {
        let thirdImage = UIImageView()
        thirdImage.contentMode = .scaleAspectFill
        thirdImage.layer.cornerRadius = 6
        thirdImage.clipsToBounds = true
        thirdImage.translatesAutoresizingMaskIntoConstraints = false
        return thirdImage
    }()
    
    private lazy var fourthImage: UIImageView = {
        let fourthImage = UIImageView()
        fourthImage.contentMode = .scaleAspectFill
        fourthImage.layer.cornerRadius = 6
        fourthImage.clipsToBounds = true
        
        fourthImage.translatesAutoresizingMaskIntoConstraints = false
        return fourthImage
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupFotoConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.photoLogo.text = nil
        self.systemImage.image = nil
        self.firstImage.image = nil
        self.secondImage.image = nil
        self.thirdImage.image = nil
        self.fourthImage.image = nil
    }
    
    func setupFoto(with fotoCollection: fotoView){
        
        self.photoLogo.text = fotoCollection.logo
        self.systemImage.image = fotoCollection.systemImage
        self.firstImage.image = fotoCollection.image1
        self.secondImage.image = fotoCollection.image2
        self.thirdImage.image = fotoCollection.image3
        self.fourthImage.image = fotoCollection.image4
        
    }
    
    private func setupFotoConstraint(){
        self.contentView.addSubview(self.photoLogo)
        self.contentView.addSubview(self.systemImage)
        self.contentView.addSubview(self.firstImage)
        self.contentView.addSubview(self.secondImage)
        self.contentView.addSubview(self.thirdImage)
        self.contentView.addSubview(self.fourthImage)
        
        NSLayoutConstraint.activate([
            self.photoLogo.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            self.photoLogo.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
            
            
            self.systemImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            self.systemImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
            self.systemImage.heightAnchor.constraint(equalToConstant: 30),
            self.systemImage.widthAnchor.constraint(equalToConstant: 30),
            
            
            self.firstImage.topAnchor.constraint(equalTo: self.photoLogo.bottomAnchor, constant: 12),
            self.firstImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
            self.firstImage.widthAnchor.constraint(equalToConstant: 95),
            self.firstImage.heightAnchor.constraint(equalToConstant: 80),
            self.firstImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),
            
            
            self.secondImage.leadingAnchor.constraint(equalTo: self.firstImage.trailingAnchor, constant: 8),
            self.secondImage.widthAnchor.constraint(equalToConstant: 95),
            self.secondImage.heightAnchor.constraint(equalToConstant: 80),
            self.secondImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -12),
            
            
            self.thirdImage.leadingAnchor.constraint(equalTo: self.secondImage.trailingAnchor,constant: 8),
            self.thirdImage.widthAnchor.constraint(equalToConstant: 95),
            self.thirdImage.heightAnchor.constraint(equalToConstant: 80),
            self.thirdImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -12),
            
            self.fourthImage.leadingAnchor.constraint(equalTo: self.thirdImage.trailingAnchor,constant: 8),
            self.fourthImage.widthAnchor.constraint(equalToConstant: 95),
            self.fourthImage.heightAnchor.constraint(equalToConstant: 80),
            self.fourthImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),
            self.fourthImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12)
            
        ])
    }
    
}
