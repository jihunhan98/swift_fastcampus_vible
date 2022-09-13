import UIKit

class StockListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!    //collectionView
    let stockList: [StockModel] = StockModel.list   //주식 List
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //CollectionView의 datasource는 앱이 보여주는 컨텐츠 그 자체
        //datasource에 대한 유일한 요구사항은 얼마나 많은 아이템을 가지고 있는지, 그 아이템을 그릴 때 어떤 뷰를 사용할 것인지 ..
        //https://zzoo789.tistory.com/entry/iOS-UICollectionView%EC%97%90-%EB%8C%80%ED%95%98%EC%97%AC-Data-source-Delegate
        
        //datasource와 delegate 셋팅, 구현은 밑의 extension을 통하여 구현
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}
//CollectionViewCell은 Reuse Identify 이름을 지정해줘야 한다. (StockListCollectionViewCell)
//UIollectionView의 DataSource 확장
extension StockListViewController: UICollectionViewDataSource{
    //얼마나 많은 아이템을 가지고 있는지 반환하는 함수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stockList.count
    }
    
    //함수 => collectionView를 통하여 이 Cell이 몇번째(indexPath) 해당하는 cell인지 표현하는 함수
    //guard => 조건에 참인 경우만 다음 코드로, 조건이 거짓이면 return으로 더이상 진행 x
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockListCollectionViewCell", for: indexPath) as? StockListCollectionViewCell else{
        return UICollectionViewCell()
    }//withReuseIdentifier => 아까 위에서 말했던 Cell의 ReuseIdentify 이름, indexPath => 몇번째 cell
        //as?로 StockListCollectionViewCell로 캐스팅을 하여 데이터를 업데이트하는 함수 configure()을 사용하여 데이터 반환힘
        //as?로 캐스팅을 할 때 실패할 경우를 대비하여 guard 사용
        let stock = stockList[indexPath.item] //indexPath.item은 현재 collectionView가 몇번째 아이템인지 표현
        cell.configure(stock)
        return cell
        //return UICollectionViewCell()
    }
}
//UIollectionView의 Delegate 확장

//single Layout으로 표현하기 위한
extension StockListViewController: UICollectionViewDelegateFlowLayout{
    func  collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //single Layout이기 때문에 width는 collectionView랑 같다
        //height = 80, CGSize => width와 height를 반환하는 객체
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
}
