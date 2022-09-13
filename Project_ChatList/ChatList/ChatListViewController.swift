//
//  ChatListViewController.swift
//  ChatList
//
//  Created by 한지훈 on 2022/09/13.
//

import UIKit

class ChatListViewController: UIViewController {

    let chatList: [Chat] = Chat.list
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //Data, Presentation, Layout
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
}

//DataSource's extension
extension ChatListViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatListCollectionViewCell", for: indexPath) as? ChatListCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let chat = chatList[indexPath.item]
        cell.configure(chat)
        return cell
        }
    
    
    //있는 아이템이 몇개 있는지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatList.count
    }
}

//Layout's extension
extension ChatListViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
