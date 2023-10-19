//
//  ContentView.swift
//  Weather
//
//  Created by Mehmet Göztaş on 19.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var FahrenheigtValue: String = ""
    @State var isVisible  = false
    let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }()
    
    func convertToCelsius() -> String{
        if let value =  Double(FahrenheigtValue){
            let fahrenheit = Measurement<UnitTemperature>(value: value,unit: .fahrenheit)
            let celsiusValue = fahrenheit.converted(to: .celsius)
            return numberFormatter.string(from: NSNumber(value:celsiusValue.value)) ?? "???"
        }
        else{
            return "???"
        }
            
    }
        
    
    var body: some View {
        VStack {
            TextField("value",text:$FahrenheigtValue)
                .font(Font.system(size: 64.0))
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
            Text("Fahrenheit")
            Text("is")
                .foregroundColor(.black)
            Text(convertToCelsius())
                .font(Font.system(size: 64.0))
            Text("Degrees Celcius")
            Spacer()
        
            
        }
        .foregroundColor(.orange)
        .font(.title)
        .opacity(isVisible ? 1.0:0.0)
        .offset(x:0, y: isVisible ? 0: 20)

        .animation(.easeIn(duration: 0.7))
        
        .onAppear()
        {
            self.isVisible = true
        }
    }
}

#Preview {
    ContentView()
}
