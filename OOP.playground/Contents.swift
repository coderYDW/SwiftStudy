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

//类的继承
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

//类的多态j和类型判断

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var directer: String
    init(name: String, directer: String) {
        self.directer = directer
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let arr = [Movie(name: "美人鱼", directer: "周星驰"),
           Song(name: "烦恼歌", artist: "张学友"),
           Movie(name: "哪吒之魔童降世", directer: "饺子")]

//for item in arr {
//    if let realItem = item as? Movie {
//        print(realItem.directer)
//    }
//}


//extension
//添加计算属性
extension Double {
    var km: Double {
        return self / 1000.0
    }
}

//print(3000.0.km)

//扩展添加方法
extension Int {
    func repeatTask(_ task: () -> ()) {
        for _ in 0..<self {
            task()
        }
    }
}

//3.repeatTask {
//    print("Hello")
//}

//下标方法
extension Int {
    subscript(digitIndex: Int) -> Int {
        get {
            var base = 1
            for _ in 0..<digitIndex {
                base *= 10
            }
            return (self / base) % 10
        }
    }
}

9876543210[7]

extension Int {
    
    enum Kind {
        case zero
        case positive
        case negative
    }
    
    var kind: Kind {
        get {
            switch self {
            case 0:
                return .zero
            case let x where x > 0:
                return .positive
            default:
                return .negative
            }
        }
    }
}

//0.kind
//9.kind
//var intA = -1
//intA.kind


//协议
protocol FirstName {
    var firstName: String {get}
}

protocol LastName {
    var lastName: String {get}
}

//协议继承
protocol FullName: FirstName, LastName {
    var fullName: String {get}
}

protocol Named {
    var name: String {get}
}

protocol Aged {
    var age: Int {get}
}

protocol Maled {
    var male: String {get set}
    
}

protocol TypeName {
    static var typeName: String {get}
}

//实例方法
protocol SayHello {
    func sayHello()
}

//协议继承和类型方法
protocol PrintTypeName: TypeName  {
    static func printTypeName()
}

//初始化器
protocol PersonInit: Named, Aged {
    init(name: String, age: Int, male: String)
}

protocol AnimalInit: Named, Aged {
    init(name: String, age: Int)
}

//遵循多个协议
struct Person01: Named, Aged, TypeName, PersonInit {
    
    var male: String = ""
    var name: String
    var age: Int
    static var typeName: String {
        return "Person01"
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    init(name: String, age: Int, male: String) {
        self.init(name: name, age: age)
        self.male = male
    }
}

let p01 = Person01(name: "zhangsan", age: 20)



//协议组合
func wish( _ to: Named & Aged) {
    print("name \(to.name) age \(to.age)")
}
//wish(p01)

//计算属性
struct Person02: FullName, SayHello, PrintTypeName, TypeName {
    
    var firstName: String
    var lastName: String
    var fullName: String {
        return firstName + " " + lastName
    }
    static var typeName: String {
        return "Person02"
    }
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
    
    func sayHello() {
        print("Hello, I am \(fullName).")
    }
    
    static func printTypeName() {
        print("Type name is \(self.typeName)")
    }
    
}

let p02 = Person02(firstName: "Kobe", lastName: "Bryant")
p02.sayHello()
Person02.printTypeName()
//print(p02.fullName)


//遵循多个协议
class Animal: Named, Aged, TypeName, AnimalInit {
    var name: String = ""
    var age: Int = 0
    //类型属性协议
    class var typeName: String {
        get {
            return "Animal"
        }
    }
    
    required init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
}

//继承父类后遵循指定的协议,继承父类后会继承父类已经遵循的协议
class Cat: Animal, Maled  {
    
    var feetCount: Int = 4
    var male: String = ""
    //继承类型属性
    override class var typeName: String {
        get {
            return "Cat"
        }
    }
    
    init(name: String, age: Int, male: String) {
        self.male = male
        self.feetCount = 4
        super.init(name: name, age: age)
    }
    
    required init(name: String, age: Int) {
        self.male = ""
        self.feetCount = 4
        super.init(name: name, age: age)
    }
}

let cat = Cat(name: "xiaohei", age: 3, male: "male")
//print(Cat.typeName)
//wish(cat)

protocol TextRepresentable {
    var desc: String {get}
}
//扩展添加协议
//extension Person01: TextRepresentable {
//    var desc: String {
//        return "My name is \(name), I am \(age) years old."
//    }
//}

//扩展添加属性符合协议,可以在后面添加协议声明
extension Person01 {
    var desc: String {
        return "My name is \(name), I am \(age) years old."
    }
}

//协议声明
extension Person01: TextRepresentable {}

//print(p01.desc)

//对类型进行扩展后的元素进行条件限制
//extension Array: TextRepresentable where Element: TextRepresentable {
//    var desc: String {
//        let itemDesc = self.map{ $0.desc }
//        return itemDesc.joined(separator: "\n")
//    }
//}

//对协议进行扩展
extension Collection where Iterator.Element: TextRepresentable {
    var desc: String {
        let itemDesc = self.map{ $0.desc }
        return itemDesc.joined(separator: " | ")
    }
}

let persons = [Person01(name: "zs", age: 20), Person01(name: "ls", age: 30)]
//print(persons.desc)
