import XCTest
import Foundation
import os
@testable import TipCalculation

final class CalculationTest: XCTestCase {
    var viewModel = TipCalculationViewModel()

    func testSucessfulTipCalculation() {
        // Arrange
        viewModel.enteredAmount = "100.00"
        viewModel.tipSlider = 25.00
        // Act

        viewModel.calculate()

        // Assert
        XCTAssertEqual(viewModel.tipAmount, 25.00)
        XCTAssertEqual(viewModel.totalAmount, 125.00)

    }

    func testZeroAmount() {
        // Arrange
        viewModel.enteredAmount = "0"
        viewModel.tipSlider = 15

        // Quando
        viewModel.calculate()

        // Então
        XCTAssertEqual(viewModel.tipAmount, 0)
        XCTAssertEqual(viewModel.totalAmount, 0)
    }

    func testNegativeAmount() {
        // Dado
        viewModel.enteredAmount = "-50"
        viewModel.tipSlider = 10

        // Quando
        viewModel.calculate()

        // Então
        XCTAssertEqual(viewModel.tipAmount, 0)
        XCTAssertEqual(viewModel.totalAmount, 0)
    }

    func testInvalidInput() {
        // Dado
        viewModel.enteredAmount = "invalid"
        viewModel.tipSlider = 15

        // Quando
        viewModel.calculate()

        // Então
        XCTAssertEqual(viewModel.tipAmount, 0)
        XCTAssertEqual(viewModel.totalAmount, 0)
    }

    func testEdgeCases() {
        // Teste com 0% de gorjeta
        viewModel.enteredAmount = "100"
        viewModel.tipSlider = 0
        viewModel.calculate()
        XCTAssertEqual(viewModel.tipAmount, 0)
        XCTAssertEqual(viewModel.totalAmount, 100)

        // Teste com 100% de gorjeta
        viewModel.enteredAmount = "50"
        viewModel.tipSlider = 100
        viewModel.calculate()
        XCTAssertEqual(viewModel.tipAmount, 50)
        XCTAssertEqual(viewModel.totalAmount, 100)
    }

}
