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


//: [Next](@next)

// 本电脑Int是Int64
Int.max // 9223372036854775807
Int32.max // 2147483647
Int64.max // 9223372036854775807


