//
//  SearchViewController.swift
//  InstaSearchView
//
//  Created by 한지훈 on 2022/09/16.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //search navigate 설정
        self.navigationItem.title = "Search"
        let searchController = UISearchController(searchResultsController: nil)
        //navigation의 title을 숨길거냐 말거냐
        searchController.hidesNavigationBarDuringPresentation = false
        //search bar에서의 text
        searchController.searchBar.placeholder = "Search"
        //search한 것을 update하는, extension으로 가능 구현 해야함
        searchController.searchResultsUpdater = self
        self.navigationItem.searchController = searchController
    }
}

extension SearchViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCollectionViewCell", for: indexPath) as? ResultCollectionViewCell else{
            return UICollectionViewCell()
        }
        let imageName = "animal\(indexPath.item + 1)"
        cell.configure(imageName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interItemSpacing: CGFloat = 1
        let width: CGFloat = (collectionView.bounds.width - interItemSpacing * 2) / 3
        let height: CGFloat = width
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

//resultupdater의 extension
extension SearchViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let search = searchController.searchBar.text
        print("search : \(search)")
    }
}
