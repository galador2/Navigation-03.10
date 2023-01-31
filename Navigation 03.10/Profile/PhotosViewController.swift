//
//  PhotosViewController.swift
//  Navigation 03.10
//
//  Created by Kirill  Kostenko  on 29.01.2023.
//

import UIKit

class PhotosViewController: UIViewController, UINavigationBarDelegate, UIGestureRecognizerDelegate {
    
    private enum Contants{
        static let numberOfItemsInLine: CGFloat = 3
    }
    
    private lazy var layout:UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 35, left: 9, bottom: 0, right: 9)
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let fotoCollection: [PhotosCollectionViewCell.PhotoGallery] = [
        PhotosCollectionViewCell.PhotoGallery(photo: UIImage(named: "foto1")),
        PhotosCollectionViewCell.PhotoGallery(photo: UIImage(named: "foto2")),
        PhotosCollectionViewCell.PhotoGallery(photo: UIImage(named: "foto3")),
        PhotosCollectionViewCell.PhotoGallery(photo: UIImage(named: "foto4")),
        PhotosCollectionViewCell.PhotoGallery(photo: UIImage(named: "foto1")),
        PhotosCollectionViewCell.PhotoGallery(photo: UIImage(named: "foto2")),
        PhotosCollectionViewCell.PhotoGallery(photo: UIImage(named: "foto3")),
        PhotosCollectionViewCell.PhotoGallery(photo: UIImage(named: "foto4")),
        PhotosCollectionViewCell.PhotoGallery(photo: UIImage(named: "foto1")),
        PhotosCollectionViewCell.PhotoGallery(photo: UIImage(named: "foto2")),
        PhotosCollectionViewCell.PhotoGallery(photo: UIImage(named: "foto3")),
        PhotosCollectionViewCell.PhotoGallery(photo: UIImage(named: "foto4")),
        PhotosCollectionViewCell.PhotoGallery(photo: UIImage(named: "foto1")),
        PhotosCollectionViewCell.PhotoGallery(photo: UIImage(named: "foto2")),
        PhotosCollectionViewCell.PhotoGallery(photo: UIImage(named: "foto3")),
        PhotosCollectionViewCell.PhotoGallery(photo: UIImage(named: "foto4"))
    ]
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupCollectionFoto()
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        self.collectionView.collectionViewLayout.invalidateLayout()
    }
    
    private func setupNavigationBar(){
        let height: CGFloat = -50
        let navbar = UINavigationBar(frame: CGRect(x: 0, y: 45, width: UIScreen.main.bounds.width, height: height))
        navbar.delegate = self
        navbar.isHidden = false
        navbar.isTranslucent = false
        navbar.backgroundColor = .white
        
        
        let navItem = UINavigationItem()
        navItem.title = "Photo Gallery"
      
        navItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtom))
    
        navbar.items = [navItem]
    
        view.addSubview(navbar)

        collectionView.frame = CGRect(x: 0, y: height, width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height - height))
    
    }
    
    @objc private func backButtom(_sender:UINavigationBar){
        self.navigationController?.pushViewController(FeedViewController(), animated: true)
        //self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
   
    
    private func setupCollectionFoto(){
        self.view.addSubview(collectionView)
        self.setupNavigationBar()
        
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
}

extension PhotosViewController:UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.fotoCollection.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? PhotosCollectionViewCell
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        
        cell.setupCollection(with: self.fotoCollection[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let insets = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset ?? .zero
        let interItemSpacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0

        let width = collectionView.frame.width - (Contants.numberOfItemsInLine - 1) * interItemSpacing - insets.left - insets.right
        let itemWidth = floor(width / Contants.numberOfItemsInLine)


        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    
    }
    
//        self.navigationController?.navigationBar.isHidden = true
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationItem.title = "Photo Gallery"
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font: UIFont(descriptor:UIFontDescriptor(name: "Photo Gallery", size: 20), size: 20)]
    
    
    

