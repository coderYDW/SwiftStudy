//
//  HistoryView.swift
//  CalculatorDemo
//
//  Created by Yangdongwu on 2020/7/25.
//  Copyright © 2020 ydw. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    
    @ObservedObject var model: CalculatorModel
    
    //@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //@Environment(\.presentationMode) var presentationMode
    
    @Binding var editingHistory: Bool
    
    var body: some View {
        
        VStack {
            
            Button("关闭") {
                //self.presentationMode.wrappedValue.dismiss()
                self.editingHistory.toggle()
            }
            
            if model.totalCount == 0 {
                Text("没有履历")
            } else {
                HStack {
                    Text("履历").font(.headline)
                    Text("\(model.historyDetail)").lineLimit(nil)
                }
                HStack {
                    Text("显示").font(.headline)
                    Text("\(model.brain.output)")
                }
                
                Slider(
                    value: $model.slidingIndex,
                    in: 0...Float(model.totalCount),
                    step: 1
                )
                
            }
            
        }.padding()
        
    }
}

//struct HistoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryView()
//    }
//}
