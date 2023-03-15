//
//  PhotosCollectionViewCell.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 29.01.2023.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    struct PhotoGallery{
        let photo: UIImage?
    }
    
    private lazy var fotoLibrary: UIImageView = {
        let fotoLibrary = UIImageView()
        fotoLibrary.clipsToBounds = true
        fotoLibrary.contentMode = .scaleAspectFill
        fotoLibrary.translatesAutoresizingMaskIntoConstraints = false
        return fotoLibrary
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFotoCollection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupCollection(with foto: PhotoGallery){
        self.fotoLibrary.image = foto.photo
    }
    
    private func setupFotoCollection(){
        self.addSubview(fotoLibrary)
        
        NSLayoutConstraint.activate([
            self.fotoLibrary.topAnchor.constraint(equalTo: self.topAnchor,constant: 8),
            self.fotoLibrary.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 1),
            self.fotoLibrary.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 1),
            self.fotoLibrary.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 16)
        ])
    }
    
}
