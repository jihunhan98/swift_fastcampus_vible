//
//  WeatherViewController.swift
//  SimpleWeather
//
//  Created by 한지훈 on 2022/09/11.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperatureLable: UILabel!
    
    
    let cities = ["Seoul", "Tokyo", "LA", "Seattle"]
    let weathers = ["cloud.fill", "wind", "sun.max.fill",
                    "cloud.rain.fill", "cloud.snow.fill"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    

    @IBAction func changeButtonClicked(_ sender: Any) {
        cityLabel.text = cities.randomElement()!
        let imageName = weathers.randomElement()!
        weatherImageView.image = UIImage(systemName: imageName)?.withRenderingMode(.alwaysOriginal)
        temperatureLable.text = "\(Int.random(in: 10...30))"
    }
   

}
