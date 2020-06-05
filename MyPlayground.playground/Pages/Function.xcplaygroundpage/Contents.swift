//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

//如果不指定实际参数的标签,默认使用形式参数作为实际参数的标签
//func addTwoNum(num1: Int, num2: Int) -> Int {
//    return num1 + num2
//}

//print(addTwoNum(num1: 1, num2: 2))

//可以指定实际参数的标签
//func addTwoNum(first num1: Int, second num2: Int) -> Int {
//    return num1 + num2
//}

//print(addTwoNum(first: 1, second: 2))

//使用下滑线可以省略实际参数的标签,函数参数可以指定默认值,例如在类型后面加上 = 10
func addTwoNum(_ num1: Int, _ num2: Int = 10) -> Int {
    return num1 + num2
}
//addTwoNum(1)


//func addNums(_ nums: Int...) -> Int {
//    var sum = 0
//    for num in nums {
//        sum += num
//    }
//    return sum
//}
//addNums(1,2,3,4,5)

//输入输出型函数,可以改变传入参数的值
func swapValue(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}
var num = 10
var anotherNum = 9
//必须要在参数前加&符号,类似C语言的取地址符号
swapValue(&num, &anotherNum)
print(num, anotherNum)


//函数类型, incout Int 和 Int 不同需要区别对待
//在没有返回值类型的函数需要制定返回值为 -> () 才可以
let swapFunc: (inout Int, inout Int) -> () = swapValue
swapFunc(&num, &anotherNum)
print(num, anotherNum)

//内嵌函数,函数类型作为返回值
func chooseStepFunc(backward: Bool) -> (Int) -> Int {
    func stepForward(step: Int) -> Int { return step + 1 }
    func stepBackward(step: Int) -> Int { return step - 1 }
    return backward ? stepBackward : stepForward
}

var currentValue = 4
let stepFunc = chooseStepFunc(backward: currentValue > 0)
while currentValue != 0 {
    currentValue = stepFunc(currentValue)
}
print(currentValue)


//函数类型作为形式参数
func printMathResult(_ mathFunc: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print(mathFunc(a, b))
}

func addTwoNum01(_ num1: Int, _ num2: Int) -> Int {
    return num1 + num2
}
printMathResult(addTwoNum01, 3, 0)



//闭包表达式
let names = ["zhangsan", "lisi", "wangwu", "zhaoliu", "a"]

print(names)

//函数方式进行排序
//func backward(_ name1: String, _ name2: String) -> Bool {
//    return name1 > name2
//}
//let sortedNames = names.sorted(by: backward)

//闭包常规模式
//let sortedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
//    return s1 > s2
//} )

//结合上下文推断类型,可以省略参数类型和返回值类型,形式参数外的小括号也可以省略
//单一表达式闭包可以隐式返回(可以省略return)
//let sortedNames = names.sorted(by: { s1, s2 in s1 > s2 })

//使用$进行参数名的简写,可以使用$1,$2,$3等名字来引用实际参数值
//let sortedNames = names.sorted(by: { $0 > $1 } )
//大于号定义的函数刚好与sorted函数所需参数一致
//let sortedNames = names.sorted(by: > )

//尾随闭包,书写在函数形式参数括号外面的表达式,闭包作为函数的最好一个形式参数
let sortedNames = names.sorted{ $0 > $1 }

print(sortedNames)

