import UIKit
import PlaygroundSupport

//var str = "Hello, playground"
//
//func addTwoNum (num1: Int, num2:Int) -> Int {
//    return num1 + num2
//}
//
//let numa = addTwoNum(num1: 100, num2: 50)

//
//let vc = ViewController01()
//let nav = UINavigationController(rootViewController: vc)
//PlaygroundPage.current.liveView = nav

//常量和变量

//var aaa: String = "name"
//
//let bbb : String = "name"
//
//let i: UInt8 = 255
//
//aaa = "age"
//
//print("\(bbb) and \(i)")

//基本数据类型

//let i = 1
//
//if i == 1 {
//    print(i)
//}
//
//let a: Bool = true
//
//if a {
//    print(a)
//}

//typealias YDW = Int
//let a: YDW = 90

//元组
//let error = (Int: 1, String: "错误信息")
//print(error)
//print(error.0)
//print(error.1)
//
//let error = (errorCode: 1, errorMessage: "错误信息")
//print(error)
//print(error.0)
//print(error.1)
//print(error.errorCode, error.errorMessage)
//
//元组的分解
//let (errorCode, errorMessage) = error
//print(errorCode, errorMessage)
//
//var error = (errorCode: 1, errorMessage: "错误信息")
//error.errorCode = 2
//error.errorMessage = "没有权限"
//print(error)
//
//var error: (errorCode: Int, errorMessage: String) = (1, "name")
//var error: (errorCode: Int, errorMessage: String) = (errorCode: 1, errorMessage:"name")
//
//print(error)
//
//func func001 (name: String) -> (errorCode: Int, errorMessage: Any) {
//    return (1, "错误信息")
//}
//var error = func001(name: "Hello")
//error.errorMessage = 3
//print(error)

//可选值
//强制展开
//let a: String? = "abc"
//if a != nil {
//    let count = a!.count
//}
////可选绑定
//if let b = a {
//    let count = b.count
//}
////可选链
//let c = a?.count
//if c != nil {
//    let count = c!
//}
//
//if let d = c {
//    let count = d
//}
////隐式展开
//let e: String! = "abv"
//let count = e.count

//可选值的原理
//let a: Optional<String> = "abv"
//if let b = a {
//    let count = b.count
//}
//
//if a != nil {
//    let count = a.unsafelyUnwrapped.count
//}

//字符串的初始化
//let a = ""
//if a.isEmpty {
//    print("a is empty")
//}
//
//let b = String()
//if b.isEmpty {
//    print("b is empty")
//}
//
//let c = """
//1\
//2\
//3
//4
//5
//"""
//print(c)
//
//let c = """
//    1
//    2
//        3
//    4
//    5\"\"\"
//    """
//print(c)
//
////let a = #"1\#n2\n3"#
////print(a)
//
//let b = ##"1\#"#n2\n3"##
//print(b)

//字符串是值传递
//let a = "Hello"
//var b = a
//print(a == b) // true
//b += " world"
//print(b)
//print(a == b) //false
//
////访问字符串中的每一个字符
//for c in a {
//    print(c)
//}
////字符串插值
//let c = "6 * 7 = \(6*7)"
//print(c)

//子字符串
//let string = "Hello,world"
//let index = string.firstIndex(of: ",") ?? string.endIndex
//let subString = string[string.startIndex ..< index]
//print(subString)
//let newString = String(subString)
//print(newString)
//
////前缀和后缀的判断
//let string1 = "Hello"
//print(string == string1)
//print(string.hasPrefix(string1))
//print(string.hasSuffix("world"))

////赋值运算符
//var a = 10
//let b = 10
//// = 没有返回值,不能作为判断条件
//if a == b {
//    print("==")
//}
//
////求余数
//print(9 % 2)   // 1
//print(-9 % 2)  // -1
//print(9 % -2)  // 1
//print(-9 % -2) // -1

////溢出运算符
//var a: UInt8 = 255
////let b = a + 1
//let b = a &+ 1
//print(b)

//合并空值运算符
//var a: Int? = 9
//print(a!)
////当a等于nil的时候强制展开会报错
//a = nil
////print(a!)
//print(a ?? 10)
//
//func getNumber () -> Int {
//    print("GetNumber")
//    return 8
//}
//var b: Int? = 10
//print(b ?? getNumber()) //方法没有被执行
//b = nil
//print(b ?? getNumber()) //方法被执行

//区间运算符
//顺序
//for i in 0...5 {
//    print(i)
//}
//倒序
//for i in (0...5).reversed()  {
//    print(i)
//}

//let names = ["yagn","wagn", "li", "liu"]
//for name in names[2...] {
//    print(name)
//}

//单侧区间
//let range = ...5
//print(range.contains(7))
//print(range.contains(5))
//print(range.contains(-1))
//print(range.contains(7))

//索引区间
//var welcome = "hello,world"
//let range  = welcome.index(welcome.endIndex, offsetBy: -6) ..< welcome.endIndex
//welcome.removeSubrange(range)
//print(welcome)
////字符串区间
//let range1 = "a"..."z"
//for char in welcome {
//    if !range1.contains(String(char)) {
//        print("\(char)不是小写字母")
//    }
//}


//两个数字进行交换

//func exchangeTwoNum (a: Int, b: Int) -> (Int, Int) {
//    var a1 = a
//    var b1 = b
//    a1 = a1 ^ b1
//    b1 = a1 ^ b1
//    a1 = a1 ^ b1
//    return (a1, b1)
//}
//print(exchangeTwoNum(a: 3, b: 7))


//求int数二进制中1的个数
//遍历次数较多,有多少位数就遍历多少次
//func getCountOnes01 (num: UInt) -> UInt {
//    var count: UInt = 0
//    var temp = num
//    while temp != 0 {
////        let a = temp & 1
////        if a == 1 {
////            count += 1
////        }
//        count += temp & 1
//        temp = temp >> 1
//    }
//    return count
//}
//print(getCountOnes01(num: 6))

//改进方法遍历次数少,有多少个1就遍历多少次
//将一个数与自身减一按位与运算,会消除最低位的1
//func getCountOnes02(num: UInt) -> UInt {
//    var count: UInt = 0
//    var temp = num
//    while temp != 0 {
//        count += 1
//        temp = temp & (temp - 1)
//    }
//    return count
//}
//print(getCountOnes02(num: 9))

//判断一个数是否是2的整数次幂
//如果一个数是2的整数次幂,那么这个数的二进制表示中只有一位是1
//func isPowerOfTwo(num: UInt) -> Bool {
//    return (num & (num - 1)) == 0
//}
//print(isPowerOfTwo(num: 7))


//小时的数字,一个数组里面有两两出现的数字,其中一个数字消失,找出这个消失的数字
//相同的数字异或结果为0
//func findLostNum(nums:[UInt]) -> UInt {
//    var lostNum: UInt = 0
//    for num in nums {
//        lostNum = lostNum ^ num
//    }
//    return lostNum
//}
//var nums: [UInt] = [1,2,3,4,5,5,3,1,2]
//print(findLostNum(nums: nums))

//找到两个消失的数字
//将所有的数字分为两个组,一个组有一个消失的数字,两个数字必定有一位是不同的,按不同位进行分组
//func findLostTwoNum(nums: [UInt]) -> (UInt, UInt) {
//    var lostNum1: UInt = 0
//    var lostNum2: UInt = 0
//    //先得到所有数字异或的结果
//    var temp: UInt = 0
//    for num in nums {
//        temp = temp ^ num
//    }
//    //得到两个数字不同的位数
//    var flag: UInt = 1
//    while (flag & temp) == 0 {
//        flag = flag << 1
//    }
//    //对数据进行分组异或
//    for num in nums {
//        if (num & flag) == 1 {
//            lostNum1 = lostNum1 ^ num
//        }
//        else {
//            lostNum2 = lostNum2 ^ num
//        }
//    }
//    return (lostNum1, lostNum2)
//}
//var nums01: [UInt] = [1,2,3,4,5,3,2,5]
//
//print(findLostTwoNum(nums: nums01))

//数组中只有一个数出现一次,其他的都出现三次,找出这个数字

//func findOnceNum(nums: [UInt]) -> UInt {
//    var a: UInt = 0
//    var b: UInt = 0
//    for num in nums {
//        a = (a ^ num) & ~b
//        b = (b ^ num) & ~a
//    }
//    return a
//}
//var nums02: [UInt] = [1,1,1,2,2,2,6]
//print(findOnceNum(nums: nums02))

////运算符的重载
//struct Vecter2D: Equatable {
//    var x = 0.0
//    var y = 0.0
//}
//
//extension Vecter2D {
//    static func + (left: Vecter2D, right: Vecter2D) -> Vecter2D {
//        return Vecter2D(x: left.x + right.x, y: left.y + right.y)
//    }
//}
//
//extension Vecter2D {
//    static prefix func - (v: Vecter2D) -> Vecter2D {
//        return Vecter2D(x: -v.x, y: -v.y)
//    }
//}
////需要修改外部变量的值需要添加inout参数
//extension Vecter2D {
//    static func += (left: inout Vecter2D, right: Vecter2D) {
//        left =  left + right
//    }
//}
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
//prefix operator +++
//extension Vecter2D {
//    static prefix func +++(vecter: inout Vecter2D) -> Vecter2D {
//        vecter += vecter
//        return vecter
//    }
//}
//
////var v1 = Vecter2D(x: 1, y: 1)
////var v2 = +++v1
////print(v1,v2)
//
////自定义中置运算符
//infix operator +-: AdditionPrecedence
//extension Vecter2D {
//    static func +-(v1: Vecter2D, v2: Vecter2D) -> Vecter2D {
//        return Vecter2D(x: v1.x + v2.x, y: v1.y - v2.y)
//    }
//}
//
//infix operator *^: MyPrecedence
//extension Vecter2D {
//    static func *^(left: Vecter2D, right: Vecter2D) -> Vecter2D {
//        return Vecter2D(x: left.x * right.x, y: left.y * left.y + right.y * right.y)
//    }
//}
////自定义优先级和结合性
//precedencegroup MyPrecedence {
//    associativity: left
//    lowerThan: AdditionPrecedence
//}
//
//var v1 = Vecter2D(x: 1, y: 1)
//var v2 = Vecter2D(x: 2, y: 2)
//var v3 = Vecter2D(x: 3, y: 3)
//print(v1 +- v2 *^ v3)

//遍历字典
//let dict = ["spider": 8, "tiger": 4, "duck": 2]
//for ani in dict {
//    print("\(ani.key) have \(ani.value) legs")
//}

//for (name, legCount) in dict {
//    print("\(name) have \(legCount) legs")
//}

//stride函数的使用
//for i in stride(from: 0, to: 50, by: 5) {
//    print(i)
//}

//for i in stride(from: 0, through: 50, by: 5) {
//    print(i)
//}

//var a = 3
//let b = 5
//var result = 1
////遍历的值如果不需要使用可以下划线代替
//for _ in 1...b {
//    result *= a
//}
//print(result)

//repeat while 先执行一次,再去判断条件
//var a = 5
//repeat {
//    a -= 1
//    print(a)
//} while a != 0

//switch语句

//字符匹配
//let char: Character = "A"
//switch char {
//case "a", "A":
//    print("first letter")
//case "z":
//    print("last letter")
//default:
//    print("other letter")
//}

//区间匹配
//let a = 1
//var natureCount: String
//switch a {
//case 0:
//    natureCount = "none"
//case 1..<20:
//    natureCount = "a few"
//case 20..<100:
//    natureCount = "a lot of"
//case 100..<1000:
//    natureCount = "hundred of"
//case 1000..<10000:
//    natureCount = "thousand of"
//default:
//    natureCount = "very much"
//}
//print(natureCount)

//元组匹配
//let point01 = (1, 1)
//switch point01 {
//case (0, 0):
//    print("it is origin")
////下滑线表示所有匹配值
//case (0, _):
//    print("point at y-axis")
////值绑定
//case (let x, 0):
//    print("point at x-axis, x = \(x)")
////where，可以检查是否符合特定的约束
//case (let x, let y) where x == y:
//    print("x = \(x) is equa to y = \(y)")
////元组匹配和区间匹配结合
//case (-2...2, -2...2):
//    print("point in box")
//default:
//    print("other")
//}


//let point02 = (1, 0)
//switch point02 {
////复合匹配绑定值,匹配条件格式必须一致,匹配值必须相同
//case (let distance, 0), (0, let distance):
//    print("point at axis, distance = \(distance)")
//default:
//    print("other")
//}

//let char: Character = "a"
//switch char {
//case "a":
//    print("first letter")
//    fallthrough
//case "b":
//    print("second letter")
//case "z":
//    print("last letter")
//default:
//    print("other letter")
//}
//
//var a = 10
//whileLoop: while a > 0 {
//    switch a {
//    case 1:
//        print(a)
//    case 10:
//        var sum = 0
//        for index in 0...10 {
//            sum += index
//            if index == 10 {
//                print(sum)
//                //跳出while循环
//                break whileLoop
//            }
//        }
//    default:
//        break
//    }
//    a -= 1
//}

//if语句使用不当,导致嵌套层数很深,阅读很不利
func isIpAddress01(ipString: String) -> (Int, String) {
    let components = ipString.split(separator: ".")
    if components.count == 4 {
        if let first = Int(components[0]), first >= 0 && first <= 255 {
            if let second = Int(components[1]), second >= 0 && second <= 255 {
                if let third = Int(components[2]), third >= 0 && third <= 255 {
                    if let forth = Int(components[3]), forth >= 0 && forth <= 255 {
                        return (0, "IP地址合法")
                    }
                    else {
                       return (3, "第四部分不对")
                    }
                }
                else {
                   return (3, "第三部分不对")
                }
            }
            else {
               return (2, "第二部分不对")
            }
        }
        else {
            return (1, "第一部分不对")
        }
    }
    else {
        return (100, "不是IP地址,不是由四部分组成")
    }
}

func isIpAddress02(ipString: String) -> (Int, String) {
    
    let components = ipString.split(separator: ".")
    
    if components.count != 4 {
        return (100, "不是IP地址,不是由四部分组成")
    }
    
    if let first = Int(components[0]), first < 0 || first > 255 {
        return (1, "第一部分不对")
    }
    
    if let second = Int(components[1]), second < 0 || second > 255 {
        return (2, "第二部分不对")
    }
    
    if let third = Int(components[2]), third < 0 || third > 255 {
        return (3, "第三部分不对")
    }
    
    if let forth = Int(components[3]), forth < 0 || forth > 255 {
        return (3, "第四部分不对")
    }
    
    return (0, "IP地址合法")
    
}


//guard语句书写更加直观,避免嵌套
func isIpAdressUseGuard(ipString: String) -> (Int, String) {
    
    let components = ipString.split(separator: ".")
    
    guard components.count == 4 else {
        return (100, "不是IP地址,不是由四部分组成")
    }
    
    guard let first = Int(components[0]), first >= 0 && first <= 255 else {
        return (1, "第一部分不对")
    }
    
    guard let second = Int(components[1]), second >= 0 && second <= 255 else {
        return (1, "第二部分不对")
    }
    
    guard let third = Int(components[2]), third >= 0 && third <= 255 else {
        return (2, "第三部分不对")
    }
    
    guard let forth = Int(components[3]), forth >= 0 && forth <= 255 else {
        return (3, "第四部分不对")
    }
    
    return (0, "IP地址合法")
    
}

//print(isIpAdressUseGuard(ipString: "101.110.91.110"))
print(isIpAddress02(ipString: "10.91.91.101"))

