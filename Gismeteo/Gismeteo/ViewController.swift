//
//  ViewController.swift
//  Gismeteo
//
//  Created by Roman Shestopal on 23.10.2021.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController, ManagerDelegate {
    func updateInterface(_: Manager, with currentWeather: CurrentWeather) {
        //self.labelTemp.text = currentWeather.tempString
        print("from ViewController - \(currentWeather.temp)")
    }

    var currentWeather = CurrentWeather.self
    var delegate = ManagerDelegate?.self
    var manager = Manager()
    
    @IBOutlet weak var TFCity: UITextField!
    @IBOutlet weak var labelTemp: UILabel!
    @IBOutlet weak var i_netLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLikeFeelsLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func btn1(_ sender: Any) {
        //Parse()
        presentSearchAlertController(withTitle: "Title", message: "message", style: .alert){ cityName in
            self.manager.Parser2(forCity: cityName)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        manager.Parser2(forCity: "Uman")
        manager.delegate = self
        manager.onCopletion = {[weak self] currentWeather in
            guard let self = self else { return }
            self.updateInterfaceWith(weather: currentWeather)
            
        }
        //self.updateInterfaceWith(weather: CurrentWeat  her)
    }
    
    func updateInterfaceWith(weather: CurrentWeather){
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.labelTemp.text = "Температура \(weather.tempString)"
            self.tempLikeFeelsLabel.text = "Ощущяется \(weather.tempLikeFeelsString)"
            self.tempMaxLabel.text = "Макс. \(weather.tempMaxString), мин. \(weather.tempMinString)"
            self.tempMinLabel.text = "Ск. ветра \(weather.speedWindString) м/с"
            self.imageView.image = UIImage(systemName: weather.systemIconNameString)
        }
    }
    
}


