import XCTest
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



}
