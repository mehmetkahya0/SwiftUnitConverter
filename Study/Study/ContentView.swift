//
//  ContentView.swift
//  Study
//
//  Created by Mehmet Kahya on 18.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var milevalue: String = ""
    let numberFormatter: NumberFormatter = {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }()
    
    func convertToKilometers() -> String {
        
        if let value = Double(milevalue) {
            let mile = Measurement<UnitLength>(value: value, unit: .miles)
            
            let kilometersValue = mile.converted(to: .kilometers)
            
            return numberFormatter.string(from: NSNumber(value: kilometersValue.value)) ?? "???"

        } else {
            return "???"
        }
    }

    var body: some View {
        VStack{
           
            TextField("enter mile value", text: $milevalue).multilineTextAlignment(.center)
                .keyboardType(.decimalPad)
            Text("mile").foregroundColor(.red)
            Text("is actually").foregroundColor(.gray)
            Text(convertToKilometers())
            Text("kilometers")
            Text("Created by Mehmet Kahya").fontWeight(.light).font(.caption2).frame(maxHeight: .leastNormalMagnitude, alignment: .bottom)

          
            
        }.font(.title).fontWeight(.bold)
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
