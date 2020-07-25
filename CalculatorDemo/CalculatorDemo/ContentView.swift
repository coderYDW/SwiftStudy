//
//  ContentView.swift
//  CalculatorDemo
//
//  Created by Yangdongwu on 2020/7/19.
//  Copyright © 2020 ydw. All rights reserved.
//

import SwiftUI

let scale: CGFloat = UIScreen.main.bounds.width / 414

struct ContentView: View {
    
    //只能发生在body和body所调用的方法中,不能再外部改变@state的值
    //所有操作和状态改变都是和当前view挂钩,不适合多个view共享
    //@State private var brain: CalculatorBrain = .left("0")
    
    //通过ObservedObject监听改变后刷新视图
    //@ObservedObject var model = CalculatorModel()
    
    //通过EnvironmentObject全局变量,无需传递,类似单例
    @EnvironmentObject var model: CalculatorModel
    
    @State private var editingHistory = false
    
    var body: some View {
        
        VStack(spacing: 12) {
            
            Spacer()
            
            Button("操作履历:\(model.history.count)") {
                self.editingHistory = true
            }.sheet(isPresented: self.$editingHistory) {
                HistoryView(model: self.model)
            }
            
            HStack {
                Spacer()
                Text(model.brain.output)
                    .font(.system(size: 76))
                    .minimumScaleFactor(0.5)
                    .padding(.trailing, 24 * scale)
                    .lineLimit(1)
                //.frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
            }
            
            //通过ObservedObject监听代码
            //CalculatorButtonPad(model: model).padding(.bottom)
            
            CalculatorButtonPad().padding(.bottom)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            //快速查看深色布局情况 .environment(\.colorScheme, .dark)
            //ContentView()
            //通过EnvironmentObject全局变量,预览需要传入参数
            ContentView().environmentObject(CalculatorModel())
            //ContentView().previewDevice("iPhone SE")
            //ContentView().previewDevice("iPad Air 2")
            //ContentView().previewDevice("iPhone 11 Pro")
            //ContentView().previewDevice("iPad Pro (11-inch)")
        }
    }
}

struct CalculatorButton: View {
    
    let title: String
    let titleColorName: String
    let fontSize: CGFloat = 38
    let size: CGSize
    let backgroundColerName: String
    let action: () -> Void
    
    //如果background放在cornerRadius后面,圆角就会失效
    //font和foregroundColor位置调换不影响
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: fontSize * scale))
                .foregroundColor(Color(titleColorName))
                .frame(width:size.width, height: size.height)
                .background(Color(backgroundColerName))
                .cornerRadius(size.width / 2)
        }
    }
    
}

struct CalculatorButtonRow: View {
    
    //通过state监听代码
    //@Binding var brain: CalculatorBrain
    
    //通过ObservedObject监听代码
    //var model: CalculatorModel
    
    //通过EnvironmentObject监听代码
    @EnvironmentObject var model: CalculatorModel
    
    let row: [CalculatorButtonItem]
    
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(title: item.title,
                                 titleColorName: item.titleColorName,
                                 size: item.size,
                                 backgroundColerName: item.backgroundColorName)
                {
                    self.model.apply(item)
                }
            }
        }
    }
}

struct CalculatorButtonPad: View {
    
    //通过state监听代码
    //@Binding var brain: CalculatorBrain
    
    //通过ObservedObject监听代码
    //var model: CalculatorModel
    
    let rows: [[CalculatorButtonItem]] =  [
        [.command(.clear), .command(.flip), .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)]
    ]
    var body: some View {
        VStack(spacing: 8) {
            ForEach(rows, id: \.self) { item in
                
                //通过ObservedObject监听代码
                //CalculatorButtonRow(model: self.model, row: item)
                
                //通过EnvironmentObject监听代码
                CalculatorButtonRow(row: item)
            }
        }
    }
}
