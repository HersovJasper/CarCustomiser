//
//  Car.swift
//  CarCustomiser
//
//  Created by Jasper Hersov on 20/01/2021.
//

import Foundation

struct Car {
    let make: String
    let model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    
    func displayStats() -> String{
        let displayMessage = "Make: \(self.make)\nModel: \(self.model)\nTop Speed: \(self.topSpeed)\nAcceleration: \(self.acceleration)\nHandling: \(self.handling)"
        return displayMessage
    }
}
