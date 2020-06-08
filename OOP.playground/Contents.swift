import UIKit

var str = "Hello, playground"
//可以自动填充值,根据上一个值自动填充后面的值
enum CompassPoint: Int {
    case east = 7
    case south
    case west
    case north
}
//遵循CaseIterable协议可以使用allCases
//print(CompassPoint.allCases)
//print(CompassPoint.west.rawValue)
//可以使用值创建枚举,这时候能回创建的值不在自定义的枚举里面,有一个.none
let direction = CompassPoint(rawValue: 9)

//使用switch-case匹配枚举
switch direction {
case .east:
    print("east")
case .south:
    print("south")
case .west:
    print("west")
case .north:
    print("north")
default:
    print("none")
}

//枚举可以设置不同类型的原始值
enum ControlCharater: String {
    case tab = "\t"
    case line = "\n"
}

print(ControlCharater.tab.rawValue, ControlCharater.tab)

//枚举的关联值
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrcode(String)
}

var productCode = Barcode.upc(1, 2, 4, 5)
productCode = .qrcode("dfghjk")
print(productCode)

switch productCode {
case .upc(let a, let b, let c, let d):
    print("a=\(a),b=\(b),c=\(c),d=\(d)")
case .qrcode(let str):
    print(str)
}


//递归枚举
indirect enum ArithmeticExpression {
    case number(Int)
    case add(ArithmeticExpression, ArithmeticExpression)
    case multipfly(ArithmeticExpression, ArithmeticExpression)
}

let firstExpression = ArithmeticExpression.number(5)
let secondExpression = ArithmeticExpression.number(6)
let addExpression = ArithmeticExpression.add(firstExpression, secondExpression)
let thirdExpression = ArithmeticExpression.number(7)
let multipflyExpression = ArithmeticExpression.multipfly(addExpression, thirdExpression)
//print(multipflyExpression)

func eval(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case .number(let a):
        return a
    case .add(let first, let second):
        return eval(first) + eval(second)
    case .multipfly(let first, let second):
        return eval(first) * eval(second)
    }
}

print(eval(multipflyExpression))
