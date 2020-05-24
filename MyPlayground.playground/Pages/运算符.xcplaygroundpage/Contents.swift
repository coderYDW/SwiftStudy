//: [Previous](@previous)

import Foundation


////赋值运算符
var a = 10
let b = 10
// = 没有返回值,不能作为判断条件
if a == b {
    print("==")
}

////求余数 前面的值符号参与运算,后面值符号忽略
print(9 % 2)   // 1
print(-9 % 2)  // -1
print(9 % -2)  // 1
print(-9 % -2) // -1

////溢出运算符 超过类型范围,循环输出
var a01: UInt8 = 255
//let b = a + 1
let b01 = a01 &+ 1
print(b01)

//合并空值运算符
var a02: Int? = 9
print(a02!)
//当a等于nil的时候强制展开会报错
a02 = nil
//print(a!)
print(a02 ?? 10)

func getNumber () -> Int {
    print("GetNumber")
    return 8
}
var b02: Int? = 10
print(b02 ?? getNumber()) //方法没有被执行
b02 = nil
print(b02 ?? getNumber()) //方法被执行

//区间运算符
//顺序
for i in 0...5 {
    print(i)
}
//倒序
for i in (0...5).reversed()  {
    print(i)
}

let names = ["yagn","wagn", "li", "liu"]
for name in names[2...] {
    print(name)
}

//单侧区间
let range = ...5
print(range.contains(7))
print(range.contains(5))
print(range.contains(-1))
print(range.contains(7))

//索引区间
var welcome = "hello,world"
let range01  = welcome.index(welcome.endIndex, offsetBy: -6) ..< welcome.endIndex
welcome.removeSubrange(range01)
print(welcome)
////字符串区间
let range02 = "a"..."z"
for char in welcome {
    if !range02.contains(String(char)) {
        print("\(char)不是小写字母")
    }
}



//: [Next](@next)
