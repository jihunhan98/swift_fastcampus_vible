//
//  FrameWorkViewController.swift
//  AppleFramework
//
//  Created by 한지훈 on 2022/09/16.
//

import UIKit

class FrameWorkViewController: UIViewController {

    let list: [AppleFramework] = AppleFramework.list
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        //inset => 여백 주는
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 30, bottom: 0, right: 30)
    }
    

    

}

extension FrameWorkViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  "FrameWorkCollectionViewCell", for: indexPath) as? FrameWorkCollectionViewCell else{
            return UICollectionViewCell()
        }
        let frame = list[indexPath.item]
        cell.configure(frame)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
}

extension FrameWorkViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let space: CGFloat = 10
        let witdh = (collectionView.bounds.width - space * 2) / 3
        let height = witdh * 1.5
        return CGSize(width: witdh, height: height)
    }
    
    //cell 수평방향으로 공백 주기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    //cell 수직방향으로 공백 주기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
