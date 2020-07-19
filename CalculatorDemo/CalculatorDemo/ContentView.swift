//
//  ContentView.swift
//  CalculatorDemo
//
//  Created by Yangdongwu on 2020/7/19.
//  Copyright © 2020 ydw. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let scale: CGFloat = UIScreen.main.bounds.width / 414
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text("0")
                .font(.system(size: 76))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
            CalculatorButtonPad()
            
        }
        .scaleEffect(scale)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView().previewDevice("iPhone SE")
        }
    }
}

struct CalculatorButton: View {
    
    let title: String
    let fontSize: CGFloat = 38
    let size: CGSize
    let backgroundColerName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(.white)
                .frame(width:size.width, height: size.height)
                .background(Color(backgroundColerName))
                .cornerRadius(size.width/2)
        }
    }
}

enum CalculatorButtonItem {
    
    enum Op: String {
        case plus = "+"
        case minus = "-"
        case divide = "÷"
        case multiply = "×"
        case equal = "="
    }
    
    enum Command: String {
        case clear = "AC"
        case flip = "+/-"
        case persent = "%"
    }
    
    case digit(Int)
    case dot
    case op(Op)
    case command(Command)
    
}

extension CalculatorButtonItem: Hashable {
    
    var title: String {
        switch self {
        case .digit(let value):
            return String(value)
        case .op(let op):
            return op.rawValue
        case .command(let command):
            return command.rawValue
        case .dot:
            return "."
        }
    }
    
    var size: CGSize {
        if case .digit(let value) = self, value == 0 {
            return CGSize(width: 88 * 2 + 8, height: 88)
        }
        return CGSize(width: 88, height: 88)
    }
    
    var fontSize: CGFloat {
        return 44.0
    }
    
    var backgroundColorName: String {
        switch self {
        case .digit, .dot:
            return "digitBackground"
        case .op:
            return "operatorBackground"
        case .command:
            return "commandBackground"
        }
    }
    
}

struct CalculatorButtonRow: View {
    
    let row: [CalculatorButtonItem]
    
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(title: item.title,
                                 size: item.size,
                                 backgroundColerName: item.backgroundColorName)
                {
                    print(item.title)
                }
            }
        }
    }
}

struct CalculatorButtonPad: View {
    let rows: [[CalculatorButtonItem]] =  [
        [.command(.clear), .command(.flip), .command(.persent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)]
    ]
    var body: some View {
        VStack(spacing: 8) {
            ForEach(rows, id: \.self) { item in
                CalculatorButtonRow(row: item)
            }
        }
    }
}
