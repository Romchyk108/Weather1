//
//  Manager.swift
//  Gismeteo
//
//  Created by Roman Shestopal on 23.10.2021.
//

import Foundation

protocol ManagerDelegate {
    func updateInterface (_: Manager, with currentWeather: CurrentWeather)
}

class Manager {
    
    var delegate: ManagerDelegate?
    var onCopletion: ((CurrentWeather) -> Void)?
    
    func Parser2(forCity city: String){
        //let city = "London"
        let key = "db6d0477ddb6d5a2f452f47ed3656b94"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(key)&units=metric"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) {data, response, error in
            if let data = data {
                let dataString = String(data: data, encoding: .utf8)
                print(dataString!)
                if let currentWeather = self.parseJSON(withData: data){
                    self.delegate?.updateInterface(self, with: currentWeather)
                   // print("tempLikeFeels - \(currentWeather!.tempLikeFeels)")
                    self.onCopletion?(currentWeather)
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> CurrentWeather?{
        let decoder = JSONDecoder()
        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            print("temp like feels - \(currentWeatherData.main.feelsLike)")
            print(" temp - \(currentWeatherData.main.temp)")
            guard let currentWeather = CurrentWeather(CurrentWeatherData: currentWeatherData) else {
                return nil
            }
            return currentWeather
        } catch let error as NSError{
            print(error.localizedDescription)
            print("Ошибка чтения")
        }
        return nil
    }
    
    func convertToCelsiy(farengate: Double) -> Double {
        let celsium = farengate - 273.15
        return celsium.rounded()
    }
}
