//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//可选值
//强制展开
let a: String? = "abc"
if a != nil {
    let count = a!.count
    print(count)
}
////可选绑定
if let b = a {
    let count = b.count
    print(count)
}
////可选链
let c = a?.count  //c也是可选值
if c != nil {
    let count = c!
    print(count)
}

if let d = c {
    let count = d
    print(count)
}
////隐式展开
let e: String! = "abv"
let count = e.count

//可选值的原理
let f: Optional<String> = "abv" //实际上是一个枚举类型
if let b = f {
    let count = b.count
    print(count)
}

if a != nil {
    let count = a.unsafelyUnwrapped.count //和 a!.count 等效
    print(count)
}

//: [Next](@next)
