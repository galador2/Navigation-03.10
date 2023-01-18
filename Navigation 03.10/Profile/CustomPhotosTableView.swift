//
//  CustomPhotosTableView.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 13.01.2023.
//

import UIKit

class CustomPhotosTableView: UITableViewCell {

    struct fotoView{
        let image1:UIImage?
        let image2:UIImage?
        let image3:UIImage?
        let image4:UIImage?
    }
    
    private lazy var firstImage: UIImageView = {
        let firstImage = UIImageView()
        firstImage.contentMode = .scaleAspectFit
        firstImage.clipsToBounds = true
        firstImage.translatesAutoresizingMaskIntoConstraints = false
        return firstImage
        
    }()
    
    private lazy var secondImage: UIImageView = {
        let secondImage = UIImageView()
        secondImage.contentMode = .scaleAspectFit
        secondImage.clipsToBounds = true
        secondImage.translatesAutoresizingMaskIntoConstraints = false
        return secondImage
    }()
    
    private lazy var thirdImage: UIImageView = {
        let thirdImage = UIImageView()
        thirdImage.contentMode = .scaleAspectFit
        thirdImage.clipsToBounds = true
        thirdImage.translatesAutoresizingMaskIntoConstraints = false
        return thirdImage
    }()
    
    private lazy var fourthImage: UIImageView = {
        let fourthImage = UIImageView()
        fourthImage.contentMode = .scaleAspectFit
        fourthImage.clipsToBounds = true
        fourthImage.translatesAutoresizingMaskIntoConstraints = false
        return fourthImage
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupFotoConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.firstImage.image = nil
        self.secondImage.image = nil
        self.thirdImage.image = nil
        self.fourthImage.image = nil
    }
    
    func setupFoto(with fotoCollection: fotoView){
        
        self.firstImage.image = fotoCollection.image1
        self.secondImage.image = fotoCollection.image2
        self.thirdImage.image = fotoCollection.image3
        self.fourthImage.image = fotoCollection.image4
        
    }
    
    private func setupFotoConstraint(){
        self.contentView.addSubview(self.firstImage)
        self.contentView.addSubview(self.secondImage)
        self.contentView.addSubview(self.thirdImage)
        self.contentView.addSubview(self.fourthImage)
        
        NSLayoutConstraint.activate([
            self.firstImage.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.firstImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 12),
            self.firstImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            
            
           
            
        ])
    }
    
}
