//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//是无序的
let courses: Set = ["Math", "English", "History"]
print(courses);

//可以插入值
var letters = Set<Character>()
letters.insert("a")
print(letters)


//Set存储的值必须遵循Hashable协议
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


var persons: Set<Person> = [Person(name: "Zhangsan", age: 20), Person(name: "Lisi", age: 29)]

//print(persons)

//无序遍历
//for c in courses {
//    print(c)
//}
//有序遍历 哈希值大小排序
//for c in courses.sorted() {
//    print(c)
//}

//如果插入的值相同,会失败不会插入
persons.insert(Person(name: "Zhangsan", age: 10))

persons.update(with: Person(name: "Zhangsan", age: 12))
persons.update(with: Person(name: "Wangwu", age: 10))

let persons01 = persons.filter { (person) -> Bool in
    return person.age < 25
}

let persons02 = persons.filter({$0.age < 20})

let result = persons.removeFirst()

//print(result, persons)

var set01: Set<Character> = ["A", "B", "J", "E"]
let set02: Set<Character> = ["A", "B", "C", "D"]
let set03: Set<Character> = ["E", "F", "G", "H"]

set01.intersection(set02) //交集
set01.union(set02) //并集
set01.symmetricDifference(set02) //对称差集 (不同的)
set01.subtract(set02) //相对补集 (01有,02没有)

set01.isSubset(of: set02) //是不是子集
set02.isSuperset(of: set01) //是不是超集
set01.isStrictSubset(of: set02) //是不是真子集 (02中有所有01中元素,还有其他元素)
set02.isStrictSuperset(of: set01) //是否是真超级 (02中有所有01中元素,还有其他元素)
set01.isDisjoint(with: set03) //是否所有元素不同

//: [Next](@next)



