import Foundation

class TipCalculationViewModel: ObservableObject {
    @Published var enteredAmount: String = ""
    @Published var tipAmount: Double = 0.00
    @Published var totalAmount: Double = 0.00
    @Published var tipSlider: Double = 0.00

    func calculate() {
            guard let amount = Double(enteredAmount), amount > 0 else {
                tipAmount = 0
                totalAmount = 0
                return
            }

            tipAmount = amount * tipSlider / 100
            totalAmount = amount + tipAmount
    }
}
