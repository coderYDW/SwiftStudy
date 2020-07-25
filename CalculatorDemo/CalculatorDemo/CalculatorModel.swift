//
//  CalculatorModel.swift
//  CalculatorDemo
//
//  Created by Yangdongwu on 2020/7/25.
//  Copyright © 2020 ydw. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class CalculatorModel: ObservableObject {
    
//    let objectWillChange = PassthroughSubject<Void, Never>()
//    var brain: CalculatorBrain = .left("0") {
//        willSet {
//            objectWillChange.send()
//        }
//    }
    
    //没有实现objectWillChange系统会自动实现一个
    //当标记为@Published的属性发生变化的时候自动objectWillChange.send()
    @Published var brain: CalculatorBrain = .left("0")
    
    @Published var history: [CalculatorButtonItem] = []
    
    //添加历史记录
    func apply(_ item: CalculatorButtonItem) {
        brain = brain.apply(item: item)
        history.append(item)
        
        temporaryKept.removeAll()
        slidingIndex = Float(totalCount)
    }
    
    /// 历史记录的描述
    var historyDetail: String {
        return history.map { $0.description }.joined()
    }
    
    /// 历史操作
    var temporaryKept: [CalculatorButtonItem] = []
    
    /// 历史记录和操作总数只和
    var totalCount: Int {
        history.count + temporaryKept.count
    }
    
    var slidingIndex: Float = 0 {
        didSet {
            //维护'history'和'temporaryKept'
            keepHistory(upTo: Int(slidingIndex))
        }
    }
    
    func keepHistory(upTo index: Int) {
        precondition(index <= totalCount, "Oun of index.")
        
        let total = history + temporaryKept
        
        history = Array(total[..<index])
        temporaryKept = Array(total[index...])
        
        brain = history.reduce(CalculatorBrain.left("0")) {
            result, item in
            result.apply(item: item)
        }
        
    }
    
}
