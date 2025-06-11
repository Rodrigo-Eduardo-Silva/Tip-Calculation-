import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = TipCalculationViewModel()

    var body: some View {
        VStack {
            Text("Enter Bill Amount")
                .foregroundStyle(.secondary)

            TextField("0,00", text: $viewModel.enteredAmount)
                .font(.system(size: 70,weight: .semibold, design: .rounded))
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.center)

            Text("Tip: \(viewModel.tipSlider,specifier: "%.0f")%")

            Slider(value:$viewModel.tipSlider, in: 0...100, step: 1)
                .onChange(of: viewModel.tipSlider) {
                    viewModel.calculate()
                }
                .onChange(of: viewModel.enteredAmount) {
                    viewModel.calculate()
                }
            VStack {
                Text(viewModel.tipAmount, format: .currency(code: "USD"))
                    .font(.title.bold())

                Text("Tip")
                    .foregroundStyle(.secondary)
                    .font(.caption)
            }
            .padding(.top, 20)

            VStack {
                Text(viewModel.totalAmount, format: .currency(code: "USD"))
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
