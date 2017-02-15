//
//  StandCollectionViewController.swift
//  gpv
//
//  Created by Alberto Banet on 15/2/17.
//  Copyright © 2017 Alberto Banet. All rights reserved.
//

import UIKit
import MobileCoreServices

private let reuseIdentifier = "Cell"

class StandCollectionViewController: UICollectionViewController {

    var fotosStand = [UIImage]()
    
    let btnAddPhoto: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .green
        button.setTitle("Add Photo", for: .normal)
        button.addTarget(self, action: #selector(handleAddPhoto), for: .touchUpInside)
        button.alpha = 0.7
        return button
    }()
    
    let picker: UIImagePickerController = {
        let p = UIImagePickerController()
        p.sourceType = .photoLibrary
        p.mediaTypes = [kUTTypeImage as String]
        return p
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        
        setupCollectionView()
        setupSubviews()
        
    }

    func setupSubviews(){
        view.addSubview(btnAddPhoto)
        btnAddPhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btnAddPhoto.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return fotosStand.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! StandCollectionViewCell
        
    
        // Configure the cell
        
        cell.photo = fotosStand[indexPath.item]
    
        return cell
    }

    
    func setupCollectionView(){
        self.installsStandardGestureForInteractiveMovement = true
        //  layout
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
            flowLayout.minimumLineSpacing = 4
        }
        
        collectionView?.backgroundColor = .blue
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: 0 ,bottom: 0 ,right: 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,right: 0)
        
        //  cell
        self.collectionView!.register(StandCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    // MARK: handle button add photo
    func handleAddPhoto(){
         present(picker, animated: true, completion: nil)
    }
    
    // datasource: moving cells
    override func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }

}


extension StandCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}

extension StandCollectionViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            fotosStand.append(selectedImage)
        }
        self.dismiss(animated: true, completion: nil)
        self.collectionView?.reloadData()
    }
}
