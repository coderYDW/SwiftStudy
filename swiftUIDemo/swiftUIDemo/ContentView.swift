//
//  ContentView.swift
//  swiftUIDemo
//
//  Created by Yangdongwu on 2020/7/5.
//  Copyright © 2020 ydw. All rights reserved.
//

import SwiftUI

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

struct ContentView: View {
    
    @Converter(initialValue: "100", from: "USD", to: "CNY", rate: 6.88) var usd_cny
    
    var body: some View {
        VStack{
            MapView().edgesIgnoringSafeArea(.all).frame(height: 300)
            CircleImage().offset(y: -100).padding(.bottom, -100)
            VStack(alignment: .leading) {
                Text("DovYoung").foregroundColor(.red).font(.title)
                HStack {
                    Text("iOS开发工程师").font(.subheadline)
                    Spacer()
                    Text("深圳")
                        .font(.subheadline)
                }
                Button("Click") {
                    print("\(self.usd_cny) = \(self.$usd_cny)")
                }
            }.padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
