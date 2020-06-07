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

//闭包对值的捕获
func makeIncrementer(amount: Int) -> () -> Int {
    var totle: Int = 0
    func increment() -> Int {
        totle += amount
        return totle
    }
    return increment
}

let incrementByTen = makeIncrementer(amount: 10)
//调用相同的闭包,值会累加,捕获了totle的值
print(incrementByTen())
print(incrementByTen())

//创建一个新的闭包不会捕获原来的值
let incrementBySeven = makeIncrementer(amount: 7)
print(incrementBySeven())

//将闭包的值赋值给另一个常量,还是会捕获原来闭包的值
let anotherIncrementByTen = incrementByTen
print(anotherIncrementByTen())


//逃逸闭包和自动闭包

//闭包的延迟处理
var names01 = ["zhangsan", "lisi", "wangwu", "zhaoliu", "a"]
//print(names01.count)
//let provider = { names01.remove(at: 0) }
//print(names01.count)
//provider()
//print(names01.count)


var providers: [() -> String] = []
//函数返回后还会调用的闭包，必须标记是逃逸闭包,否则会报错
func collectProviders(provider: @autoclosure @escaping () -> String) {
    providers.append(provider)
}
//只有自定闭包才可以直接传值
collectProviders(provider: names01.remove(at: 0))
collectProviders(provider: names01.remove(at: 0))

for provider in providers {
    print(provider())
}

class someClass {
    var x: String = "Hello"
    func doSomeThing() {
        //调用 @escaping 标记的逃逸闭包,必须使用self进行显示的引用
        collectProviders(provider: self.x)
    }
}



//高阶函数的使用
let numbers = [1, 2, 3, 4, 6, 10]
//得到所有值乘以10后的数组
print(numbers.map { $0 * 10 })
//得到过滤后的数组,小于4的值
print(numbers.filter { $0 < 4 })
//得到100 加上所有值的结果
print(numbers.reduce(100) { $0 + $1 } )

//将2维数组转换为1维数组,后所有值乘以10
let arrayNumbers = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
print(arrayNumbers.flatMap( { $0.map( { $0 * 10 } ) } ))

//得到所有非空的值
let names02: [String?] = ["zhangsan", nil, "lisi", "wangwu", nil, "zhaoliu", "a"]
print(names02.compactMap { $0 } )
print(names02.compactMap { $0?.count } )


//找出字符串中所有单词出现的次数,不需要统计non_words列表中的单词
let words = """
This is my cat , it is a white cat , it has long legs , it has two ears .
"""
let non_words = [",", "."]

//传统方式,命令式编程
func getFreq01(words: String) -> [String: Int] {
    var dict = [String: Int]()
    let wordArray = words.split(separator: " ")
    for word in wordArray {
        let lowWord = word.lowercased()
        if !non_words.contains(lowWord) {
            if let count = dict[lowWord] {
                dict[lowWord] = count + 1
            } else {
                dict[lowWord] = 1
            }
        }
    }
    return dict
}

//print(getFreq01(words: words))

//函数式编程
func getFreq02(words: String) -> [String: Int] {
    var dict = [String: Int]()
    words.split(separator: " ")
        .map { $0.lowercased() }
        .filter { !non_words.contains($0) }
        .forEach { dict[$0] = (dict[$0] ?? 0) + 1 }
    return dict
}

//print(getFreq02(words: words))


//找出字符数组中字符,在传入字符串中哪个字符第一个出现,返回该字符下标

let hello = "Hello world!"
let chars: [Character] = ["a", "e", "i", "o", "u"]

for index in 0..<hello.count {
    let char = hello[ hello.index(hello.startIndex, offsetBy: index)]
    if chars.contains(char) {
        print(index)
    }
}

zip(0..<hello.count, hello).forEach { (index, char) in
    if (chars.contains(char)) {
        print(index)
    }
}

//除了单字符条目外的列表内容,放到一个数组里面,使用逗号分隔

let names03 = ["jack", "john", "Marry", "n","robort", "a"]

let names04 = ["a", "v"]

//命令式编程
func getNameStrig(names: [String]) -> String {
    var nameString = ""
    for name in names {
        if name.count > 1 {
            nameString += name.capitalized + ","
        }
    }
    
    if !nameString.isEmpty {
        nameString.remove(at: nameString.index(before: nameString.endIndex))
    }
    return nameString
}

print(getNameStrig(names: names03))
print(getNameStrig(names: names04))

//函数式
let namesString = names03.filter{ $0.count > 1 }
    .map{ $0.capitalized }
    .joined(separator: ",")
print(namesString)


//存在线程安全问题
extension Array where Element: Any {
    
    public func currentMap<T>(_ transform: (Element) -> T) -> [T] {
        let n = self.count
        if n == 0 {
            return []
        }
        var result = Array<T>()
        result.reserveCapacity(n)
        DispatchQueue.concurrentPerform(iterations: n) { (i) in
            result.append(transform(self[i]))
        }
        return result
    }
        
}

//并行方法
let namesString01 = names03.filter{ $0.count > 1 }
    .currentMap{ $0.capitalized }
    .joined(separator: ",")
print(namesString01)
