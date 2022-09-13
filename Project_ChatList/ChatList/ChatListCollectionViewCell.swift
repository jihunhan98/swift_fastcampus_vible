//이 파일은 셀에 데이터를 업데이트 시켜주는
import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func configure(_ chat: Chat){
        thumbnail.image = UIImage(named: chat.name)
        nameLabel.text = "\(chat.name)"
        chatLabel.text = "\(chat.chat)"
        dateLabel.text = "\(chat.date)"
    }
    
    //2022-04-01 형식의 Date를 4/1로 포매팅 시켜주는 메서드
    func formattedDateString(dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        //옵셔널일 경우의 언래핑
        if let date = formatter.date(from: dateString){
            formatter.dateFormat = "M/d"
            return formatter.string(from: date)
        } else{
            return ""
        }
    }
}
