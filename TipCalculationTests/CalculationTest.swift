import XCTest
import Foundation
import os
@testable import TipCalculation

final class CalculationTest: XCTestCase {

    func testSucessfulTipCalculation() {
        // Arrange
        let enteredAmount = 100.00
        let tipSliderValue = 25.00
        let calculation = TipCalculationViewModel()
        // Act

        let tip = calculation.CalculateTip(of: enteredAmount, with: tipSliderValue)

        // Assert
        XCTAssertEqual(tip, 25.00)

    }

    func testNegativeEnterAumountTipCalculation() {
        // Arrange
        let enteredAmount = -100.00
        let tipSliderValue = 25.00
        let calculation = TipCalculationViewModel()
        // Act

        let tip = calculation.CalculateTip(of: enteredAmount, with: tipSliderValue)

        // Assert
        XCTAssertNil(tip)

    }

    func testCalculateTip_WithZeroAmount() {
           // Dado
           let enteredAmount = 0.0
           let tipSliderValue = 15.0
           let calculation = TipCalculationViewModel()
           // Quando
           let tip = calculation.CalculateTip(of: enteredAmount, with: tipSliderValue)

           // Então
           XCTAssertEqual(tip, 0.0)
       }

    func testOnChange_WithValidEntry() {
            // Dado
            let enteredAmount = "aaa"
            let tipSlider = 15.0
            var tipAmount: Double = 0
            var totalAmount: Double = 0
            let calculation = TipCalculationViewModel()

            // Simulando a lógica do onChange
            if let amount = Double(enteredAmount),
               let tip = calculation.CalculateTip(of: amount, with: tipSlider) {
                tipAmount = tip
                totalAmount = amount + tip
            }

            // Então
            XCTAssertEqual(tipAmount, 15.0)
            XCTAssertEqual(totalAmount, 115.0)
        }

}
