//: [Previous](@previous)

import Foundation

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

//多行字符串三个引号,斜杠可以忽略换行符
//let c = """
//1\
//2\
//3
//4
//5
//"""
//print(c)

//结束三引号的前面空格数代表每行忽略的空格数
//三引号字符在任意引号前面加转移斜杠
let c = """
    1
    2
        3
    4
    5\"\"\"
    """
print(c)

//Row String Swift 5 新增属性
let rowString1 = #"1\#n2\n3"#
print(rowString1)
//转义斜杠后必须添加与开始结束相同数量的#才能有换行符号的效果
let rowString2 = ##"1\#n2\n3"##
print(rowString2)

//字符串是值传递
let a = "Hello"
var b = a
print(a == b) // true
b += " world" //b的值改变不会影响a的值
print(b)
print(a == b) //false

////访问字符串中的每一个字符
for c in a {
    print(c)
}
//字符串插值
let char = "6 * 7 = \(6*7)"
print(char)

//子字符串
let string = "Hello,world"
let index = string.firstIndex(of: ",") ?? string.endIndex
let subString = string[string.startIndex ..< index]
print(subString)
let newString = String(subString)
print(newString)

////前缀和后缀的判断
let string1 = "Hello"
print(string == string1)
print(string.hasPrefix(string1))
print(string.hasSuffix("world"))

//: [Next](@next)
