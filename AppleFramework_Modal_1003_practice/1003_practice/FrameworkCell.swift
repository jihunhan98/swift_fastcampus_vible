//
//  FrameworkCell.swift
//  1003_practice
//
//  Created by 한지훈 on 2022/10/03.
//

import UIKit

class FrameworkCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    func configure(_ item: AppleFramework){
        titleLabel.text = item.name
        thumbnailImageView.image = UIImage(named: item.imageName)
    }
}
