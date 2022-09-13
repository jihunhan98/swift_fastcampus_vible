//
//  StockListCollectionViewCell.swift
//  Project_Stock_List
//
//  Created by 한지훈 on 2022/09/12.
//

import UIKit

class StockListCollectionViewCell: UICollectionViewCell {
    
    //UIComponent를 연결하자
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var stockPriceLabel: UILabel!
    @IBOutlet weak var companyIconImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var stockPriceDiff: UILabel!
    
    //func _ stock => 함수를 호출할때는 파라미터명 생략, 반환할때는 stock: "value"
    //StockModel의 형태 =>   StockModel(rank: 1, imageName: "TSLA", name: "테슬라", price: 1_238_631, diff: 0.04),
    //UIComponent에 데이터를 업데이트 하는 코드
    func configure(_ stock: StockModel){
        rankLabel.text = "\(stock.rank)"
        companyIconImageView.image = UIImage(named: "\(stock.imageName)")
        companyNameLabel.text = "\(stock.name)"
        stockPriceDiff.text = "\(stock.diff)"
        stockPriceLabel.text = "\(stock.price)"
    }
}
