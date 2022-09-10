//
//  SymbolRollerViewController.swift
//  chap3
//
//  Created by 한지훈 on 2022/09/11.
//

//View Controller의 life cycle : https://zeddios.tistory.com/43

import UIKit

class SymbolRollerViewController: UIViewController {

    let symbols: [String] = ["sun.min", "moon", "cloud", "wind", "snowflake"]
    
    //IBOutlet은 지칭해주는, 선언과 같은
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    //viewDidLoad()는 viewcontroller가 실행될 때 가장 먼저 실행이 된다.
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(systemName: "cloud")
        reloadRandSymbol()
        
        // Do any additional setup after loading the view.
    }
    
    //viewDidLoad() 다음은 viewWillAppear()이다.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //viewWillAppear() 다음은 viewDidAppear()이다.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    //IBAction은 버튼에 대한 action을 말함
    @IBAction func buttonClicked(_ sender: Any) {
        reloadRandSymbol()
    }
    
    //button을 클릭했을때 symbol을 reload하는 함수
    func reloadRandSymbol(){
        //Optional에서 nil값이 확실히 없다면 !로 언랩핑을 한다.
        let symbol = symbols.randomElement()!
        imageView.image = UIImage(systemName: symbol)
        label.text = symbol
    }

}
