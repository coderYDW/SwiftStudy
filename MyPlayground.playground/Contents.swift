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



