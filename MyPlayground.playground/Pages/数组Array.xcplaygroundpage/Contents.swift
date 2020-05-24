//: [Previous](@previous)

import Foundation

//字面量创建,空数组必须指定类型
let array01 = [1, 2, 3]
let array02: [String] = []

//初始化器
let array03 = [String]()
let array04 = Array<String>()

//参数方式
let fiveZ = Array(repeating: "Z", count: 5)

let chars = Array("Hello")

let numbers01 = Array<Int>(1...9)
let numbers02 = Array(1...9)
let numbers03 = [Int](1...9)

let persons = ["zhangsan": 20, "lisi": 30, "wangwu": 90]
let names = Array(persons.keys)

//数组遍历

//forEach 不能使用break和continue,使用return跳过一次y循环
let numbers = Array(1...5)
numbers.forEach { (num) in
    if num == 3 {
//        break
//        continue
        return
    }
    print(num)
}

//enumerated()可以回去索引和值
for (index, num) in numbers.enumerated() {
    print("第\(index)个元素是\(num)")
}
//此方法与enumerated()等效,推荐使用上面的方法
//for i in 0..<numbers.count {
//    print("第\(i)个元素是\(numbers[i])")
//}

//makeIterator()如果有下一个值就会返回下一个值,没有返回nil
var it = numbers.makeIterator()
while let num = it.next() {
    print(num)
}

//indices返回索引区间
for i in numbers.indices {
    print("第\(i)个元素是\(numbers[i])")
}

//查找操作
let numArray: [Int] = [1, 2, 3, 4, 5, 6, 1, 2]
//是否包含操作
numArray.contains(10)
numArray.contains(where: {$0 < 10})
//检查是否所有值符合条件,如果数组为空返回true
numArray.allSatisfy({$0 > 5})
numArray.allSatisfy({$0 < 5})

//first和last
//print(numArray.first)
//print(numArray.last)
//print(numArray.first(where: {$0 > 20}))
//print(numArray.last(where: {$0 > 20}))

//index
numArray.firstIndex(of: 1)
numArray.lastIndex(of: 1)
//print(numArray.firstIndex(where: {$0 > 3}))
//print(numArray.lastIndex(where: {$0 > 3}))

//min和max
numArray.min()
numArray.max()

let errors = [(1, "a"), (2, "b"), (3, "c")]
let result01 = errors.min { (a, b) -> Bool in
    a.0 < b.0
}
let result02 = errors.max { (a, b) -> Bool in
    a.0 < b.0
}

//添加和删除操作
var nums = Array<Int>(2...7)
//append操作
nums.append(100)
nums.append(contentsOf: 200...203)
//insert操作
nums.insert(1000, at: 1)
nums.insert(contentsOf: 1000...1002, at: 0)
//nums = [Int]()
//remove操作
let removeNum01 = nums.remove(at: 0)
//数组为空会报错
let removeNum02 = nums.removeFirst()
let removeNum03 = nums.removeLast()
print(nums)
nums.removeFirst(2)
nums.removeLast(2)
print(nums)
//数组为空时候返回nil
let removeNum04 = nums.popLast()
print(nums)
//移除指定范围
nums.removeSubrange(1..<3)
print(nums)
//移除全部,容量清零
//nums.removeAll()
//移除全部,容量不清零,如果清空后再次插入,建议使用这种方法
nums.removeAll(keepingCapacity: true)
print(nums, nums.capacity)

//数组切片
var nums02: [Int] = [1, 2, 3, 4, 5, 1, 6]
//去掉最后一个
var slice = nums02.dropLast()
//从前往后去掉小于4的,当遇到4的时候停止,最后得到[4, 5, 1, 6]
var slice01 = nums02.drop(while: {$0 < 4})
//同上
var slice02 = nums02.drop { (a) -> Bool in
    a < 4
}
//前两个
var slice03 = nums02.prefix(2)
var slice04 = nums02.prefix(upTo: 2)
//前三个
var slice05 = nums02.prefix(through: 2)
//从前往后小于4的,最后得到[1, 2, 3]
var slice06 = nums02.prefix(while: {$0 < 4})
//后三个
var slice07 = nums02.suffix(3)
//从指定下标开始向后
var slice08 = nums02.suffix(from: 6)
//指定区间,下标从2到6
var slice09 = nums02[2...6]
print(slice06)

//不能将以个ArraySlice直接赋值给Array
//var nums03: Array<Int> = slice01
var nums03: Array<Int> = Array(slice09)

//数组切片和数组是不同的个体，虽然公用内存，但是不相互影响；
var nums04 = Array(1...7)
var slice10 = nums04.prefix(through: 3)
nums04.append(10)
print(slice10)
slice10.append(20)
print(nums04)



//数组的重排
var intArray: [Int] = [Int](0...9)
//随机排序操作
//直接将数组排序
//intArray.shuffle()
//原来的数组不变,得到一个重排的数组
let intArray02 = intArray.shuffled()

//倒序操作
intArray.reverse()
//得到一个原来数组的逆序集合表示ReversedCollection类,不占用内存,不是数组,原来的数组排序不变
let intArray03 = intArray.reversed()
print(intArray03)

//按指定的条件将数组分为两类,符合条件的在后边,返回分割的下标值,下标为第一个符合条件值的位置
var intArray04 = [10, 34, 56, 2, 67, 3, 5, 7, 90, 444]
let index = intArray04.partition(by: {$0 > 10})
let intSlice01 = intArray04[..<index]
let intSlice02 = intArray04[index...]
print(intArray04, index)

//数组排序
var intArray05 = [10, 34, 56, 2, 67, 3, 5, 7, 90, 444]
//直接将原数组排序
//intArray05.sort()
//排序后得到一个新的数组,原来的数组不变
let sortArray = intArray05.sorted()
print(intArray05)
print(sortArray)

//交换数组的值
var intArray06 = [10, 34, 56, 2, 67, 3, 5, 7, 90, 444]
intArray06.swapAt(intArray06.startIndex, intArray06.endIndex - 1)


//数组的拼接操作
//字符串的拼接操作
let charArray = ["Hello", "world"]
let se = charArray.joined()
let se01 = charArray.joined(separator: ",")

//Range数组的拼接
let ranges = [0..<3, 8..<9, 12..<15]
//for range in ranges {
//    print(range)
//}
for i in ranges.joined() {
    print(i)
}

//二位数组的拼接
let nestedArray = [[1,2,3], [5,6,7], [9]]
//for i in nestedArray.joined() {
//    print(i)
//}

//得到一个JoinedSequence
let result = nestedArray.joined(separator: [-1, -2])
//[1, 2, 3, -1, -2, 5, 6, 7, -1, -2, 9]
print(Array(result))

//非Sequence类数组需要自己编写拼接方法
