//: [Previous](@previous)

import Foundation

//switch语句

//字符匹配
let char: Character = "A"
switch char {
case "a", "A":
    print("first letter")
case "z":
    print("last letter")
default:
    print("other letter")
}

//区间匹配
let a02 = 1
var natureCount: String
switch a02 {
case 0:
    natureCount = "none"
case 1..<20:
    natureCount = "a few"
case 20..<100:
    natureCount = "a lot of"
case 100..<1000:
    natureCount = "hundred of"
case 1000..<10000:
    natureCount = "thousand of"
default:
    natureCount = "very much"
}
print(natureCount)

//元组匹配
let point01 = (1, 1)
switch point01 {
case (0, 0):
    print("it is origin")
//下滑线表示所有匹配值
case (0, _):
    print("point at y-axis")
//值绑定
case (let x, 0):
    print("point at x-axis, x = \(x)")
//where，可以检查是否符合特定的约束
case (let x, let y) where x == y:
    print("x = \(x) is equa to y = \(y)")
//元组匹配和区间匹配结合
case (-2...2, -2...2):
    print("point in box")
default:
    print("other")
}


let point02 = (1, 0)
switch point02 {
//复合匹配绑定值,匹配条件格式必须一致,匹配值必须相同
case (let distance, 0), (0, let distance):
    print("point at axis, distance = \(distance)")
default:
    print("other")
}

let char01: Character = "a"
switch char01 {
case "a":
    print("first letter")
    fallthrough
case "b":
    print("second letter")
case "z":
    print("last letter")
default:
    print("other letter")
}

var a03 = 10
whileLoop: while a03 > 0 {
    switch a03 {
    case 1:
        print(a03)
    case 10:
        var sum = 0
        for index in 0...10 {
            sum += index
            if index == 10 {
                print(sum)
                //跳出while循环
                break whileLoop
            }
        }
    default:
        break
    }
    a03 -= 1
}

//: [Next](@next)
