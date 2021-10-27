//
//  ExtensionViewController+alertController.swift
//  Gismeteo
//
//  Created by Roman Shestopal on 24.10.2021.
//

import Foundation
import UIKit

extension ViewController{
    func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping(String) -> Void){
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField(){ tf in
            let cities = ["Kyiv", "Uman", "Dnipro"]
            tf.placeholder = cities.randomElement()
        }
        let search = UIAlertAction(title: "Search", style: .default){ action in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else {return}
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                print("search info for the \(cityName)")
                completionHandler(city)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        ac.addAction(search)
        ac.addAction(cancel)
        present(ac, animated: true, completion: nil)
    }
}

