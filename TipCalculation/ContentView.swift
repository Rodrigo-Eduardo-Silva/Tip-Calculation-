import SwiftUI

struct ContentView: View {
    @State var enteredAmount: String = ""
    @State var tipAmount: Double = 0.00
    @State var totalAmount: Double = 0.00
    @State var tipSlider: Double = 0.00
    @StateObject var viewModel = TipCalculationViewModel()

    var body: some View {
        VStack {
            Text("Enter Bill Amount")
                .foregroundStyle(.secondary)

            TextField("0,00", text: $enteredAmount)
                .font(.system(size: 70,weight: .semibold, design: .rounded))
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.center)

            Text("Tip: \(tipSlider,specifier: "%.0f")%")

            Slider(value:$tipSlider, in: 0...100, step: 1)
                .onChange(of: tipSlider) {
                    guard let amount = Double(enteredAmount) else {
                        print("invalid Entry")
                        return
                    }

                    guard let tip = viewModel.CalculateTip(of: amount, with: tipSlider) else {
                        return
                    }

                    tipAmount = tip
                    totalAmount = amount + tip
                }
            VStack {
                Text(tipAmount, format: .currency(code: "USD"))
                    .font(.title.bold())

                Text("Tip")
                    .foregroundStyle(.secondary)
                    .font(.caption)
            }
            .padding(.top, 20)

            VStack {
                Text(totalAmount, format: .currency(code: "USD"))
                    .font(.title.bold())

                Text("Total")
                    .foregroundStyle(.secondary)
                    .font(.caption)
            }
            .padding(.top, 20)

        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
