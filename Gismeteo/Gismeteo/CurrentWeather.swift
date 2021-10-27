//
//  CurrentWeather.swift
//  Gismeteo
//
//  Created by Roman Shestopal on 25.10.2021.
//

import Foundation

struct CurrentWeather {
    let cityName: String
    let temp: Double
    var tempString : String {
        return String(format: "%.0f", temp)
    }
    let tempLikeFeels: Double
    var tempLikeFeelsString: String {
        return String(format: "%.0f", tempLikeFeels)
    }
    let tempMax: Double
    var tempMaxString: String{
        return "\(tempMax.rounded())"
    }
    let tempMin: Double
    var tempMinString: String{
        return "\(tempMin.rounded())"
    }
    let conditionCode: Int
    var systemIconNameString: String{
        switch conditionCode {
        case 200...231: return "cloud.bolt.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return "cloud.rain.fill"
        case 600...622: return "cloud.snow.fill"
        case 701...781: return "smoke.fill"
        case 800: return "sun.min.fill"
        case 801...804: return "cloud.fill"
        default: return "nosign"
        }
    }
    
    init?(CurrentWeatherData: CurrentWeatherData){
        cityName = CurrentWeatherData.name
        temp = CurrentWeatherData.main.temp
        tempLikeFeels = CurrentWeatherData.main.feelsLike
        tempMin = CurrentWeatherData.main.tempMin
        tempMax = CurrentWeatherData.main.tempMax
        conditionCode = CurrentWeatherData.weather.first!.id
    }
}
