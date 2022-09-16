//
//  FrameWorkCollectionViewCell.swift
//  AppleFramework
//
//  Created by 한지훈 on 2022/09/16.
//

import UIKit

class FrameWorkCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frameLabel: UILabel!
    @IBOutlet weak var frameImageView: UIImageView!
    
    func configure(_ appleFrameWork: AppleFramework){
        frameLabel.text = appleFrameWork.name
        frameImageView.image = UIImage(named: appleFrameWork.imageName)
    }
}
