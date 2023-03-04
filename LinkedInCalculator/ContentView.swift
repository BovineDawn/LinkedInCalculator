//
//  ContentView.swift
//  LinkedInCalculator
//
//  Created by JG on 2/27/23.
//

import SwiftUI

// TODO: Finish all mode buttons

enum CalculatorMode {
    case notSet
    case addition
    case subtraction
    case multiplication
    case division
    case percent
}

struct ContentView: View {
    @State var currentValue = "0"
    @State var currentMode: CalculatorMode = .notSet
    @State var lastButtonMode = false
    @State var savedNum = 0
    @State var currentValueInt = 0
    var body: some View {
        ZStack(alignment: .center) {
            Color(.black)
            VStack {
                TotalText(value: currentValue)
                HStack {
                    CalcButton(buttonText: "AC", action: didPressClear)
                    CalcButton(buttonText: "+/-", action: didPressMode)
                    CalcButton(buttonText: "%", action: didPressMode, mode: .percent)
                    CalcButton(buttonText: "÷", color: Color(.systemOrange), action: didPressMode, mode: .division)
                }
                HStack {
                    CalcButton(buttonText: "7", color: Color(.darkGray), action: didPressNum)
                    CalcButton(buttonText: "8", color: Color(.darkGray), action: didPressNum)
                    CalcButton(buttonText: "9", color: Color(.darkGray), action: didPressNum)
                    CalcButton(buttonText: "X", color: Color(.systemOrange), action: didPressMode, mode: .multiplication)
                }
                HStack {
                    CalcButton(buttonText: "4", color: Color(.darkGray), action: didPressNum)
                    CalcButton(buttonText: "5", color: Color(.darkGray), action: didPressNum)
                    CalcButton(buttonText: "6", color: Color(.darkGray), action: didPressNum)
                    CalcButton(buttonText: "-", color: Color(.systemOrange), action: didPressMode, mode: .subtraction)
                }
                HStack {
                    CalcButton(buttonText: "1", color: Color(.darkGray), action: didPressNum)
                    CalcButton(buttonText: "2", color: Color(.darkGray), action: didPressNum)
                    CalcButton(buttonText: "3", color: Color(.darkGray), action: didPressNum)
                    CalcButton(buttonText: "+", color: Color(.systemOrange), action: didPressMode, mode: .addition)
                }
                HStack {
                    CalcButton(buttonText: "0", color: Color(.darkGray), width: 135, action: didPressNum)
                    CalcButton(buttonText: ".", color: Color(.darkGray), action: didPressMode)
                    CalcButton(buttonText: "=", color: Color(.systemOrange), action: didPressEqual)
                }
            }
        }
        .ignoresSafeArea(.all)
    }
    func didPressNum(button: CalcButton) {
        if lastButtonMode {
            lastButtonMode = false
            currentValueInt = 0
        }
        if let parsedValue = Int("\(currentValueInt)" + button.buttonText) {
            currentValueInt = parsedValue
            updateText()
        } else {
            currentValue = "Error!"
            currentValueInt = 0
        }
    }
    func didPressMode(button: CalcButton) {
        currentMode = button.mode
        lastButtonMode = true
    }
    func didPressClear(button: CalcButton) {
        currentValue = "0"
        currentMode = .notSet
        lastButtonMode = false
        savedNum = 0
        currentValueInt = 0
    }
    func didPressEqual(button: CalcButton) {
        if currentMode == .notSet || lastButtonMode {
            return
        }
        
        if currentMode == .addition {
            savedNum += currentValueInt
        } else if currentMode == .subtraction {
            savedNum -= currentValueInt
        } else if currentMode == .multiplication {
            savedNum *= currentValueInt
        } else if currentMode == .division {
            savedNum /= currentValueInt
        }
        
        currentValueInt = savedNum
        updateText()
        lastButtonMode = true
    }
    func updateText() {
        if currentMode == .notSet {
            savedNum = currentValueInt
        }
        
        let numberFormat = NumberFormatter()
        
        numberFormat.numberStyle = .decimal
        let num = NSNumber(value: currentValueInt)
        
        currentValue = numberFormat.string(from: num) ?? "Error!"
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
