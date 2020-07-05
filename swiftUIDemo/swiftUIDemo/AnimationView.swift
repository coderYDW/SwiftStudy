//
//  AnimationView.swift
//  swiftUIDemo
//
//  Created by Yangdongwu on 2020/7/5.
//  Copyright © 2020 ydw. All rights reserved.
//

import SwiftUI

struct AnimationView: View {
    @State private var showDetail = false
    var body: some View {
        Button(action: {
            withAnimation { 
                self.showDetail = !self.showDetail
            }
        }) {
            Image(systemName: "chevron.right.circle")
                .imageScale(.large)
                .rotationEffect(.degrees(showDetail ? 90 : 0))
                .scaleEffect(showDetail ? 1.5 : 1)
                .padding()
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
