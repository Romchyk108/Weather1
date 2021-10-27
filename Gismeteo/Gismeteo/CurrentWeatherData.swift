//
//  CurrentWeatherData.swift
//  Gismeteo
//
//  Created by Roman Shestopal on 24.10.2021.
//

import Foundation

struct CurrentWeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    //let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        //case pressure, humidity
    }
}

struct Weather: Codable {
    let id: Int
//    var systemIconNameString: String{
//        switch id {
//        case 200...231: return "cloud.bolt.rain.fill"
//        case 300...321: return "cloud.drizzle.fill"
//        case 500...531: return "cloud.rain.fill"
//        case 600...622: return "cloud.snow.fill"
//        case 701...781: return "smoke.fill"
//        case 800: return "sun.min.fill"
//        case 801...804: return "cloud.fill"
//        default: return "nosign"
//        }
//    }
}
