//
//  ResultCollectionViewCell.swift
//  InstaSearchView
//
//  Created by 한지훈 on 2022/09/16.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumnailImageView: UIImageView!
    
    //cell이 item을 재사용할때 준비하는 함수
    override func prepareForReuse() {
        //왜 super로 자기 자신을 한번 더 호출할까?
        super.prepareForReuse()
        thumnailImageView.image = nil
    }
    
    func configure(_ imageName: String){
        thumnailImageView.image = UIImage(named: imageName)
    }
}
