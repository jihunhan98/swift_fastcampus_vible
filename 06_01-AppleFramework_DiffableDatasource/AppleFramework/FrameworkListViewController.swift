//
//  FrameworkListViewController.swift
//  AppleFramework
//
//  Created by joonwon lee on 2022/04/24.
//

import UIKit

class FrameworkListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //hash는 object의 저장된 내용을 기준으로 한 개의 정수를 생성하여 반환하는 함수
    let list: [AppleFramework] = AppleFramework.list
    
    //var dataSource: UICollectionViewDiffableDataSource<SectionIdentifierType: Hashable & Sendable, ItemIdentifierType: Hashable & Sendable>
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    typealias Item = AppleFramework //typealias => 대신 부르는 별칭 지정해주는
    
    //section은 [section[item]] [section[item]] [section[item]] [section[item]] 여러가지가 있을 수 있다. Hashable해야 함.
    enum Section {
        case main
    }
    
    
    // Data, Presentation, Layout
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        navigationController?.navigationBar.topItem?.title = "☀️ Apple Frameworks"
        
        //Presentation, Data, Layout
//        diffable datasource
//        - presentation
//        snapshot
//        -Data
//        composition Layout
//        -layout
        
        //presentation 정하기
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else{
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        //data 정하기
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(list, toSection: .main)
        dataSource.apply(snapshot)
        
        //layout 정하기
        collectionView.collectionViewLayout = layout()
    }
    
    private func layout() -> UICollectionViewCompositionalLayout{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.33))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

extension FrameworkListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = list[indexPath.item]
        print(">>> selected: \(framework.name)")
    }
}
