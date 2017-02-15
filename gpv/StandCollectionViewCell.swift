//
//  StandCollectionViewCell.swift
//  gpv
//
//  Created by Alberto Banet on 15/2/17.
//  Copyright © 2017 Alberto Banet. All rights reserved.
//

import UIKit

class StandCollectionViewCell: UICollectionViewCell {
    
    var photo: UIImage? {
        didSet {
           photoView.image = photo
        }
    }
    
    let photoView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .randomColor()
        addSubview(photoView)
        photoView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        photoView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1).isActive = true
        photoView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        photoView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func randomColor() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
