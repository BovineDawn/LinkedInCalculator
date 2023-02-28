//
//  ContentView.swift
//  LinkedInCalculator
//
//  Created by JG on 2/27/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Color(.black)
            VStack {
                TotalText()
                HStack {
                    CalcButton(buttonText: "AC")
                    CalcButton(buttonText: "+/-")
                    CalcButton(buttonText: "%")
                    CalcButton(buttonText: "÷", color: Color(.systemOrange))
                }
                HStack {
                    CalcButton(buttonText: "7", color: Color(.darkGray))
                    CalcButton(buttonText: "8", color: Color(.darkGray))
                    CalcButton(buttonText: "9", color: Color(.darkGray))
                    CalcButton(buttonText: "X", color: Color(.systemOrange))
                }
                HStack {
                    CalcButton(buttonText: "4", color: Color(.darkGray))
                    CalcButton(buttonText: "5", color: Color(.darkGray))
                    CalcButton(buttonText: "6", color: Color(.darkGray))
                    CalcButton(buttonText: "-", color: Color(.systemOrange))
                }
                HStack {
                    CalcButton(buttonText: "1", color: Color(.darkGray))
                    CalcButton(buttonText: "2", color: Color(.darkGray))
                    CalcButton(buttonText: "3", color: Color(.darkGray))
                    CalcButton(buttonText: "+", color: Color(.systemOrange))
                }
                HStack {
                    CalcButton(buttonText: "0", color: Color(.darkGray), width: 135)
                    CalcButton(buttonText: ".", color: Color(.darkGray))
                    CalcButton(buttonText: "=", color: Color(.systemOrange))
                }
            }
        }
        .ignoresSafeArea(.all)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
