//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Jasper Hersov on 20/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    @State private var selectedCar: Int = 0 {
        didSet {
            if selectedCar >= starterCars.cars.count {
                selectedCar = 0
            }
        }
    }
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var fuelPackage = false
    @State private var steeringPackage = false
    @State private var remainingFunds = 1000
    
    var exhaustPackageDisabled: Bool {
        if remainingFunds < 750 && exhaustPackage == false{
            return true
        } else{
            
            return false
        }
    }
    var tiresPackagedDisabled: Bool {
        if remainingFunds < 750 && tiresPackage == false{
            return true
        } else{
            return false
        }
    }
    var fuelPackageDisabled: Bool {
        if remainingFunds < 500 && fuelPackage == false{
            return true
        } else{
            return false
        }
    }
    var steeringPackageDisabled: Bool {
        if remainingFunds < 500 && steeringPackage == false{
            return true
        } else{
            return false
        }
    }
    
    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get: {self.exhaustPackage},
            set: {newValue in
                self.exhaustPackage = newValue
                if newValue == true{
                    starterCars.cars[selectedCar].topSpeed += 10
                    remainingFunds -= 750
                } else{
                    starterCars.cars[selectedCar].topSpeed -= 10
                    remainingFunds += 750
                }
            }
        )
        let tiresPackageBinding = Binding<Bool> (
            get: {self.tiresPackage},
            set: {newValue in
                self.tiresPackage = newValue
                if newValue == true{
                    starterCars.cars[selectedCar].handling += 2
                    remainingFunds -= 750
                } else{
                    starterCars.cars[selectedCar].handling -= 2
                    remainingFunds += 750
                }
            }
        )
        let fuelPackageBinding = Binding<Bool> (
            get: {self.fuelPackage},
            set: {newValue in
                self.fuelPackage = newValue
                if newValue == true{
                    starterCars.cars[selectedCar].acceleration -= 0.5
                    starterCars.cars[selectedCar].topSpeed += 5
                    remainingFunds -= 500
                } else{
                    starterCars.cars[selectedCar].acceleration += 0.5
                    starterCars.cars[selectedCar].topSpeed -= 5
                    remainingFunds += 500
                }
            }
        )
        let steeringPackageBinding = Binding<Bool> (
            get: {self.steeringPackage},
            set: {newValue in
                self.steeringPackage = newValue
                if newValue == true{
                    starterCars.cars[selectedCar].handling += 1
                    starterCars.cars[selectedCar].topSpeed += 5
                    remainingFunds -= 500
                } else{
                    starterCars.cars[selectedCar].handling -= 1
                    starterCars.cars[selectedCar].topSpeed -= 5
                    remainingFunds += 500
                }
            }
        )
        VStack{
            Form {
                VStack(alignment: .leading, spacing: 20) {
                    Text("\(starterCars.cars[selectedCar].displayStats())")
                    Button("Next Car", action: {
                        selectedCar += 1
                        resetDisplay()
                    })
                }
                Section {
                    Toggle("Exhaust Package (Cost: 750)", isOn: exhaustPackageBinding)
                        .disabled(exhaustPackageDisabled)
                    Toggle("Tires Package (Cost: 750)", isOn: tiresPackageBinding)
                        .disabled(tiresPackagedDisabled)
                    Toggle("Fuel Package (Cost 500)", isOn: fuelPackageBinding)
                        .disabled(fuelPackageDisabled)
                    Toggle("Steering Package (Cost: 500)", isOn: steeringPackageBinding)
                        .disabled(steeringPackageDisabled)
                }
            }
            
            Text("Remaining Funds: \(remainingFunds)")
                .foregroundColor(.red)
                .bold()
                .baselineOffset(10.0)
        }
    }
    
    func resetDisplay() {
        remainingFunds = 1000
        exhaustPackage = false
        tiresPackage = false
        fuelPackage = false
        steeringPackage = false
        starterCars = StarterCars()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
