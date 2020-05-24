//: [Previous](@previous)

import Foundation

//运算符的重载
struct Vecter2D: Equatable {
    var x = 0.0
    var y = 0.0
}

extension Vecter2D {
    static func + (left: Vecter2D, right: Vecter2D) -> Vecter2D {
        return Vecter2D(x: left.x + right.x, y: left.y + right.y)
    }
}

extension Vecter2D {
    static prefix func - (v: Vecter2D) -> Vecter2D {
        return Vecter2D(x: -v.x, y: -v.y)
    }
}
////需要修改外部变量的值需要添加inout参数
extension Vecter2D {
    static func += (left: inout Vecter2D, right: Vecter2D) {
        left =  left + right
    }
}
//等价运算符的重载需要遵循Equatable协议
//extension Vecter2D: Equatable {
//    static func == (left: Vecter2D, right: Vecter2D) -> Bool {
//        return left.x == right.x && left.y == right.y
//    }
//}

//var v1 = Vecter2D(x: 2, y: 2)
//let v2 = Vecter2D(x: 2, y: 2)
//print(v1 + v2)
//print(-v1)
//v1 += v2
//print(v1,v2)
//print(v1 == v2)

////自定义前置运算符
prefix operator +++
extension Vecter2D {
    static prefix func +++(vecter: inout Vecter2D) -> Vecter2D {
        vecter += vecter
        return vecter
    }
}

//var v1 = Vecter2D(x: 1, y: 1)
//var v2 = +++v1
//print(v1,v2)

//自定义中置运算符
infix operator +-: AdditionPrecedence
extension Vecter2D {
    static func +-(v1: Vecter2D, v2: Vecter2D) -> Vecter2D {
        return Vecter2D(x: v1.x + v2.x, y: v1.y - v2.y)
    }
}

infix operator *^: MyPrecedence
extension Vecter2D {
    static func *^(left: Vecter2D, right: Vecter2D) -> Vecter2D {
        return Vecter2D(x: left.x * right.x, y: left.y * left.y + right.y * right.y)
    }
}
//自定义优先级和结合性
precedencegroup MyPrecedence {
    associativity: left
    lowerThan: AdditionPrecedence
}

//var v1 = Vecter2D(x: 1, y: 1)
//var v2 = Vecter2D(x: 2, y: 2)
//var v3 = Vecter2D(x: 3, y: 3)
//print(v1 +- v2 *^ v3)


//: [Next](@next)

