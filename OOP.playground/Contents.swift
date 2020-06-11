import UIKit

var str = "Hello, playground"
// 可以自动填充值,根据上一个值自动填充后面的值
enum CompassPoint: Int {
    case east = 7
    case south
    case west
    case north
}

// 遵循CaseIterable协议可以使用allCases
// print(CompassPoint.allCases)
// print(CompassPoint.west.rawValue)
// 可以使用值创建枚举,这时候能回创建的值不在自定义的枚举里面,有一个.none
let direction = CompassPoint(rawValue: 9)

// 使用switch-case匹配枚举
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

// 枚举可以设置不同类型的原始值
enum ControlCharater: String {
    case tab = "\t"
    case line = "\n"
}

print(ControlCharater.tab.rawValue, ControlCharater.tab)

// 枚举的关联值
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrcode(String)
}

var productCode = Barcode.upc(1, 2, 4, 5)
productCode = .qrcode("dfghjk")
print(productCode)

switch productCode {
case let .upc(a, b, c, d):
    print("a=\(a),b=\(b),c=\(c),d=\(d)")
case let .qrcode(str):
    print(str)
}

// 递归枚举
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
// print(multipflyExpression)

func eval(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(a):
        return a
    case let .add(first, second):
        return eval(first) + eval(second)
    case let .multipfly(first, second):
        return eval(first) * eval(second)
    }
}

print(eval(multipflyExpression))

// 为类,结构体和枚举添加属性
// 为类,结构体和枚举添加方法

struct Point {
    var x: Int = 0
    var y: Int = 0

    func printInfo() {
        print("x is \(x), y is \(y)")
    }

    mutating func moveBy(x: Int, y: Int) {
        self.x += x
        self.y += y
    }

    static func printType() {
        print("A Point")
    }
}

struct Size {
    var width: Int = 0
    var height: Int = 0
}

struct Rect {
    var origin: Point
    var size: Size
    var center: Point {
        get {
            return Point(x: origin.x + size.width / 2, y: origin.y + size.height / 2)
        }
        // set(newCenter) {
        //    origin.x = newCenter.x - size.width / 2
        //    origin.y = newCenter.y - size.height / 2
        // }
        // 简写的set
        set {
            origin.x = newValue.x - size.width / 2
            origin.y = newValue.y - size.height / 2
        }
    }
}

var p = Point(x: 1, y: 1)
p.moveBy(x: 2, y: 3)
p.printInfo()
Point.printType()

// 属性观察者

class StepCounter {
    var totleSteps: Int = 0 {
        willSet(newStep) {
            print("will to \(newStep)")
        }
        didSet(oldStep) {
            print("change from \(oldStep) to \(totleSteps)")
        }
    }

    // 这个方法可以被子类重写
    class func printType() {
        print("A StepCounter")
    }

    static func printType01() {
        print("A StepCounter")
    }
}

// var stepCounter = StepCounter()
// stepCounter.totleSteps = 10;
// stepCounter.totleSteps = 100;
// stepCounter.totleSteps = 1000;
StepCounter.printType()
StepCounter.printType01()

var count: Int = 0 {
    willSet {
        print("will to \(newValue)")
    }
    didSet {
        print("change from \(oldValue) to \(count)")
    }
}

// count = 10
// count = 20
