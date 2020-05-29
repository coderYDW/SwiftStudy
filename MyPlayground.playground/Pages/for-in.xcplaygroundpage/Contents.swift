//: [Previous](@previous)

import Foundation

//顺序
for i in 0...5 {
    print(i)
}
//倒序
for i in (0...5).reversed()  {
    print(i)
}

//遍历字典
let dict = ["spider": 8, "tiger": 4, "duck": 2]
for ani in dict {
    print("\(ani.key) have \(ani.value) legs")
}

for (name, legCount) in dict {
    print("\(name) have \(legCount) legs")
}

//stride函数的使用
for i in stride(from: 0, to: 50, by: 5) {
    print(i)
}

for i in stride(from: 0, through: 50, by: 5) {
    print(i)
}

var a = 3
let b = 5
var result = 1
//遍历的值如果不需要使用可以下划线代替
for _ in 1...b {
    result *= a
}
print(result)

//repeat while 先执行一次,再去判断条件
var a01 = 5
repeat {
    a01 -= 1
    print(a01)
} while a01 != 0



//: [Next](@next)
