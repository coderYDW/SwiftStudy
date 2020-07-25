//
//  CalculatorButtonItem.swift
//  CalculatorDemo
//
//  Created by Yangdongwu on 2020/7/19.
//  Copyright © 2020 ydw. All rights reserved.
//

import Foundation
import SwiftUI

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
        case percent = "%"
    }
    
    case digit(Int)
    case dot
    case op(Op)
    case command(Command)
    
}

extension CalculatorButtonItem {
    
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
    
    var titleColorName: String {
        switch self {
        case .command:
            return "commandTitle"
        default:
            return "normalTitle"
        }
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

extension CalculatorButtonItem: Hashable {}

extension CalculatorButtonItem {
    var size: CGSize {
        let width = 88 * scale
        let height = 88 * scale
        if case .digit(let value) = self, value == 0 {
            return CGSize(width: width * 2 + 8, height: height)
        }
        return CGSize(width: width, height: height)
    }
}

extension CalculatorButtonItem: CustomStringConvertible {
    var description: String {
        switch self {
        case .digit(let num): return String(num)
        case .dot: return "."
        case .op(let op): return op.rawValue
        case .command(let command): return command.rawValue
        }
    }
}
