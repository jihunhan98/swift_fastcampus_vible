//
//  BannerCell.swift
//  SpotifyPaywall
//
//  Created by joonwon lee on 2022/04/30.
//

import UIKit

class BannerCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    //스토리보드 nib파일에서 깨운다음 올림?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 16
    }
    
    func configure(_ items: BannerInfo){
        titleLabel.text = items.title
        discriptionLabel.text = items.description
        thumbnailImageView.image = UIImage(named: items.imageName)
    }
}
