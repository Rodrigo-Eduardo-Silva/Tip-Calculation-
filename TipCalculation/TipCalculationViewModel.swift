import Foundation

class TipCalculationViewModel: ObservableObject {
    func CalculateTip(of enteredAmount: Double, with tip:Double) -> Double? {
        guard enteredAmount >= 0 && tip >= 0 else { return nil }
        let tipPercentage = tip / 100
        return enteredAmount * tipPercentage
    }

}
