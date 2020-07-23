//
//  File.swift
//  swiftUIDemo
//
//  Created by Apple on 2020/7/23.
//  Copyright © 2020 ydw. All rights reserved.
//

import Foundation

//属性包装
@propertyWrapper struct Converter {
    
    let from: String
    let to: String
    let rate: Double
    
    var value: Double
    //自身值
    var wrappedValue: String {
        get {
            "\(from)\(value)"
        }
        set {
            value = Double(newValue) ?? -1
        }
    }
    //使用$访问
    var projectedValue: String {
        return "\(to)\(value * rate)"
    }
    
    init(initialValue: String, from: String, to: String, rate: Double) {
        self.rate = rate
        self.value = 0
        self.from = from
        self.to = to
        self.wrappedValue = initialValue
    }
    
}

