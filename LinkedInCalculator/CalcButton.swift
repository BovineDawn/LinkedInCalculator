//
//  CalcButton.swift
//  LinkedInCalculator
//
//  Created by JG on 2/27/23.
//

import SwiftUI

struct CalcButton: View {
    var buttonText: String = "1"
    var color: Color = Color(.systemGray)
    var width: CGFloat = 65
    var action: (CalcButton) -> Void = {_ in }
    var mode: CalculatorMode = .notSet
    var body: some View {
        Button {
            action(self)
        } label: {
            Text(buttonText)
                .font(.largeTitle)
                .frame(width: width, height: 65, alignment: .center)
                .background(color)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 50))
        }
    }
    }

struct CalcButton_Previews: PreviewProvider {
    static var previews: some View {
        CalcButton()
    }
}
