//
//  CalculatorModel.swift
//  CalculatorDemo
//
//  Created by Yangdongwu on 2020/7/25.
//  Copyright © 2020 ydw. All rights reserved.
//

import Foundation
import Combine

class CalculatorModel: ObservableObject {
//    let objectWillChange = PassthroughSubject<Void, Never>()
//    var brain: CalculatorBrain = .left("0") {
//        willSet {
//            objectWillChange.send()
//        }
//    }
    
    @Published var brain: CalculatorBrain = .left("0")
    
}
