//: [Previous](@previous)

import Foundation

var str = "Hello, playground"
//创建空字典
let dict1 = Dictionary<String,String>()
let dict2 = [String:Int]()
let dict3: Dictionary<String,Int> = [:]

let dict4 = ["zhangsan": 10, "lisi": 30, "wangwu": 40]
let count = dict4.count
let isEmpty = dict1.isEmpty
//: [Next](@next)

//遍历字典,可以解绑key和value
for (key, value) in dict4 {
    print("\(key) age is \(value)")
}
//字典排序
for key in dict4.keys.sorted() {
    print(key)
}

//直接使用键值对进行新增和修改
var persons = ["zhangsan": 10, "lisi": 30, "wangwu": 57]
persons["zhaoliu"] = 24 //新增
persons["lisi"] = 20   //修改
persons["wangwu"] = nil //移除
print(persons)



//定义Person遵循 Hashable协议 和 Equatable协议
struct Person {
    var name: String
    var age: Int
}

//实现哈希和相等的方法可以判断插入和更新的值是否相等
extension Person: Hashable {
    func hash(into hasher: inout Hasher) {
//        hasher.combine(age)
        hasher.combine(name)
    }
}

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name
    }
}

var personDict = [Person(name: "zhangsan", age: 10): 3000, Person(name: "wangwu", age: 40): 5000]

//只更新value,key不改变,所以key的age可以随便写,不会改变原字典key
//因为Person的Hashable和Equatable协议都是只使用name来对比
personDict.updateValue(4000, forKey: Person(name: "zhangsan", age: 20))

print(personDict)

var dict = ["a": 1, "b": 2]
//合并两个字典,遇到相同的key以左边调用函数的字典内的值为准,此方法不改变原字典的值
let dictResult01 = dict.merging(["a": 2, "c": 3]) { (current, _) -> Int in
    current
}
//合并两个字典,遇到相同的key以右边参数字典内的值为准,此方法不改变原字典的值
let dictResult02 = dict.merging(["a": 2, "c": 3]) { (_, now) -> Int in
    now
}

//合并两个字典,遇到相同的key以左边调用函数的字典内的值为准,此方法改变原字典的值,已经废弃
dict.merge(["a": 2, "c": 3]) { (current, _) -> Int in
    current
}
print(dict)

//合并两个字典,遇到相同的key以右边参数字典内的值为准,此方法改变原字典的值,已经废弃
dict.merge(["a": 2, "c": 3]) { (_, now) -> Int in
    now
}
print(dict)

var dict01 = ["a": 1, "b": 2]

//index是一个可选值类型,不是一个Int型,如果字典扩容,index将会失效
let index = dict01.firstIndex { (_, value) -> Bool in
    value == 1
}
//print(index)
if let i = index {
    print(dict01[i].value)
}

//KeyValuePairs 可以有序排列
var dict02: KeyValuePairs = ["a": 1, "b": 2, "c": 3]
print(dict02)
