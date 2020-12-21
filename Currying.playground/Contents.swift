import UIKit
/*
 柯里化
 一种量产相似方法的好办法，可以通过柯里化一个方法模板避免写出很多重复的代码，也方便维护。
 */

func addTo(_ adder: Int) -> (Int) -> Int {
    return { num in
        return num + adder
    }
}

let addOne = addTo(1)
let addTwo = addTo(2)
let a = addOne(2)
let b = addTwo(7)
print(a, b)
