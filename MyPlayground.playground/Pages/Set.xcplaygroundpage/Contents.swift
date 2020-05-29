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

extension Person: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(age)
        hasher.combine(name)
    }
}

let persons: Set<Person> = [Person(name: "Zhangsan", age: 20), Person(name: "Lisi", age: 29)]

print(persons)
//: [Next](@next)



