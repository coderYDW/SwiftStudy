import UIKit

var str = "Hello, playground"
// 可以自动填充值,根据上一个值自动填充后面的值
enum CompassPoint: Int {
    case east = 7
    case south
    case west
    case north
    //如果是只读的属性可以删除get关键字和大括号
    static subscript(index: Int) -> CompassPoint {
        return CompassPoint(rawValue: index)!
    }
    
}

//print(CompassPoint[8])

// 遵循CaseIterable协议可以使用allCases
// print(CompassPoint.allCases)
// print(CompassPoint.west.rawValue)
// 可以使用值创建枚举,这时候能回创建的值不在自定义的枚举里面,有一个.none
let direction = CompassPoint(rawValue: 9)

// 使用switch-case匹配枚举
//switch direction {
//case .east:
//    print("east")
//case .south:
//    print("south")
//case .west:
//    print("west")
//case .north:
//    print("north")
//default:
//    print("none")
//}

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
//print(productCode)

//switch productCode {
//case let .upc(a, b, c, d):
//    print("a=\(a),b=\(b),c=\(c),d=\(d)")
//case let .qrcode(str):
//    print(str)
//}

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

//print(eval(multipflyExpression))

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

//var p = Point(x: 1, y: 1)
//p.moveBy(x: 2, y: 3)
//p.printInfo()
//Point.printType()

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
//StepCounter.printType()
//StepCounter.printType01()

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

//自定义下表方法

struct Matrix {
    let rows: Int
    let cols: Int
    var grid:[Double]
    
    init(rows: Int, cols: Int) {
        self.rows = rows
        self.cols = cols
        self.grid = Array(repeating: 0.0, count: rows * cols)
        
    }
    
    subscript(row: Int, col: Int) -> Double {
        get {
            return grid[row * cols + col]
        }
        set {
            grid[row * cols + col] = newValue
        }
    }
    
}

var matrix = Matrix(rows: 2, cols: 2)
matrix[1, 0] = 0.9
matrix[0, 1] = 1.5
//print(matrix)



//类的初始化和反初始化
class Person {
    var name: String
    var age: Int
    //可以失败的初始化器
//    init?(name: String, age: Int) {
//        if age > 300 {
//            return nil
//        }
//        self.name = name
//        self.age = age
//    }
    
    //必要初始化器,子类必须实现此初始化器
    required init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    convenience init() {
        self.init(name: "[unnamed]", age: 0)
    }
    
    convenience init(age: Int) {
        self.init(name: "[unnamed]", age: age)
    }
    
    //类的反初始化器,当类将要释放的时候调用
    deinit {
        
    }
    
}

class Teacher: Person {
    
    var salary: Int
    
    //重写了父类的全部初始化器后,会继承所有父类的便捷初始化器
//    override init(name: String, age: Int) {
//        self.salary = 3000
//        super.init(name: name, age: age)
//    }
    //必要初始化器
    required init(name: String, age: Int) {
        self.salary = 3000
        super.init(name: name, age: age)
    }
    
    //如果子类没有指定初始化器,可以继承父类的所有初始化器
    init(name: String, age: Int, salary: Int) {
        self.salary = salary //在调用父类前需要初始化子类的属性值
        super.init(name: name, age: age)
        self.name = name + "老师" //调用父类后才可以修改父类的值
        self.test() //只有初始化实例后才可以调用实例方法
    }
    
    convenience init(salary: Int) {
        self.init(name: "[unnamed]", age: 0, salary: salary)
        self.salary = salary + 1000 //便捷方法在实现指定初始化器后次啊可以修改属性
    }
    
    func test() {
        print("teacher test")
    }
    
}

//let teacher = Teacher(age: 20)
//teacher.test()


class Vehicle {
    //final修饰的属性是不能被继承的
    final var name: String {
        return "交通工具"
    }
    
    var speed: Int = 0
    var desc: String {
        return "run at speed \(speed)"
    }
    func makeNoise() {
        
    }
}

class Car: Vehicle {
//    override var name: String
    var gear: Int = 0
    //继承来的属性可以添加属性观察器
    override var speed: Int {
        didSet {
            gear = (speed / 10) + 1
        }
    }
    //重写属性
    override var desc: String {
        return super.desc + " at gear \(gear)"
    }
    //重写方法
    override func makeNoise() {
         print("恩")
    }
}

//var car = Car()
//car.speed = 36
//print(car.desc)
//car.makeNoise()

