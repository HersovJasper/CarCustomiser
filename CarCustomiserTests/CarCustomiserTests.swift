//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by Jasper Hersov on 20/01/2021.
//

import XCTest

class CarCustomiserTests: XCTestCase {

    func testNewCarGivesACarWithAllAttributesSet(){
        //arrange
        //act
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        //assert
        XCTAssertEqual(car.make, "Mazda")
        XCTAssertEqual(car.model, "MX-5")
        XCTAssertEqual(car.topSpeed, 125)
        XCTAssertEqual(car.acceleration, 7.7)
        XCTAssertEqual(car.handling, 5)
        
    }
    
    func testDiplayStatsMethodDisplaysSuitableMethod(){
        //arrange
        //act
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        let stats = car.displayStats()
        //assert
        XCTAssertEqual("Make: Mazda\nModel: MX-5\nTop Speed: 125mph\nAcceleration (0-60): 7.7s\nHandling: 5", stats)
    }
}
