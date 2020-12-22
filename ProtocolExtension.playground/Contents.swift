import UIKit

protocol A1 {
    func method1() -> String
}

extension A1 {
    func method1() -> String {
        return "extension A1"
    }
    func method2() -> String {
        return "extension A1 method2"
    }
}


struct B1: A1 {
    func method1() -> String {
        return "Struct B1"
    }
    func method2() -> String {
        return "Struct B1 method2"
    }
}

let a1 = B1()
print(a1.method1())
print(a1.method2())

let a2 = a1 as A1
print(a2.method1())
print(a2.method2())

//输出如下
//Struct B1
//Struct B1 method2
//Struct B1
//extension A1 method2
