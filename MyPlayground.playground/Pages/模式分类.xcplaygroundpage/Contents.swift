//: [Previous](@previous)

import Foundation


//可选项模式
let someInt: Int? = 42
if case let x? = someInt {
    print(x)
}
else {
    print("no value")
}

//只打印数组中不为nil元素
let nums: [Int?] = [nil, 1, 78, 90, nil, 67]
for case let x? in nums {
    print(x)
}

//枚举项模式
//let someInt: Int? = 42
if case .some(let x) = someInt {
    print(x)
}
else {
    print("no value")
}

////类型转换模式
protocol Animal {
    var name: String {get} //只有get方法
}

struct Dog: Animal {
    var name: String = "Dog"
    var runSpeed: Int
}

struct Bird: Animal {
    var name: String = "Bird"
    var flyHeight: Int
}

struct Fish: Animal {
    var name: String = "Fish"
    var Depth: Int
}

let animals: [Animal] = [Dog(runSpeed: 100), Bird(flyHeight: 50), Fish(Depth: 150)]
for animal in animals {
    switch animal {
    case let dog as Dog:
        print("\(dog.name) run \(dog.runSpeed)")
    case let bird as Bird:
        print("\(bird.name) fly \(bird.flyHeight)")
    case is Fish:
        print("Fish can swim")
    default:
        print("unknow animal")
    }
}


////表达式模式
struct Teacher {
    var name: String
    var salary: Int
}

func ~= (patten: Range<Int>, value: Teacher) -> Bool {
    return patten.contains(value.salary)
}

let teacher = Teacher(name: "zhang", salary: 9000)
switch teacher {
case 0..<1000:
    print("饿死")
case 1000..<3000:
    print("勉强度日")
case 3000..<6000:
    print("还可以")
default:
    print("土豪")
}
