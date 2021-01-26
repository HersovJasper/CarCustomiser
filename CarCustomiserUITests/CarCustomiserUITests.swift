//
//  CarCustomiserUITests.swift
//  CarCustomiserUITests
//
//  Created by Jasper Hersov on 20/01/2021.
//

import XCTest

class CarCustomiserUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenBoughtFuelAndSteeringPackageOtherTwoUpgradesAreDisabled() throws {
        // UI tests must launch the application that they test.
        //arrange
        let app = XCUIApplication()
        app.launch()
        //act
        let tablesQuery = app.tables
        tablesQuery.switches["Fuel Package (Cost: 500)"].tap()
        tablesQuery.switches["Steering Package (Cost: 500)"].tap()
        //assert
        XCTAssertEqual(tablesQuery/*@START_MENU_TOKEN@*/.switches["Exhaust Package (Cost: 750)"]/*[[".cells[\"Exhaust Package (Cost: 750)\"].switches[\"Exhaust Package (Cost: 750)\"]",".switches[\"Exhaust Package (Cost: 750)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.isEnabled,false)
        XCTAssertEqual(tablesQuery/*@START_MENU_TOKEN@*/.switches["Tires Package (Cost: 750)"]/*[[".cells[\"Tires Package (Cost: 750)\"].switches[\"Tires Package (Cost: 750)\"]",".switches[\"Tires Package (Cost: 750)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.isEnabled, false)
    }

    
    func testWhenNextCarIsPressedTogglesAreReset() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        //act
        let tablesQuery = XCUIApplication().tables
        tablesQuery/*@START_MENU_TOKEN@*/.switches["Fuel Package (Cost: 500)"]/*[[".cells[\"Fuel Package (Cost: 500)\"].switches[\"Fuel Package (Cost: 500)\"]",".switches[\"Fuel Package (Cost: 500)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.switches["Steering Package (Cost: 500)"]/*[[".cells[\"Steering Package (Cost: 500)\"].switches[\"Steering Package (Cost: 500)\"]",".switches[\"Steering Package (Cost: 500)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Next Car"]/*[[".cells[\"Make: Mazda\\nModel: MX-5\\nTop Speed: 135mph\\nAcceleration (0-60): 7.2s\\nHandling: 6, Next Car\"].buttons[\"Next Car\"]",".buttons[\"Next Car\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        //assert
        //XCTAssertEqual(tablesQuery/*@START_MENU_TOKEN@*/.switches["Fuel Package (Cost: 500)"]/*[[".cells[\"Fuel Package (Cost: 500)\"].switches[\"Fuel Package (Cost: 500)\"]",".switches[\"Fuel Package (Cost: 500)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/, false)
        //XCTAssertEqual(self.steeringPackage, false)
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
