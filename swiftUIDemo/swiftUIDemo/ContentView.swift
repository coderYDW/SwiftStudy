//
//  ContentView.swift
//  swiftUIDemo
//
//  Created by Yangdongwu on 2020/7/5.
//  Copyright © 2020 ydw. All rights reserved.
//

import SwiftUI

struct ContentView: View {
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
