//
//  CircleImage.swift
//  swiftUIDemo
//
//  Created by Yangdongwu on 2020/7/5.
//  Copyright © 2020 ydw. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("icon").clipShape(Circle()).overlay(Circle().stroke( Color.white, lineWidth: 4)).shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
