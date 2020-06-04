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


