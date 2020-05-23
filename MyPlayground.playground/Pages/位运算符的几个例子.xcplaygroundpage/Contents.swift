//: [Previous](@previous)

import Foundation

//两个数字进行交换

func exchangeTwoNum (a: Int, b: Int) -> (Int, Int) {
    var a1 = a
    var b1 = b
    a1 = a1 ^ b1
    b1 = a1 ^ b1
    a1 = a1 ^ b1
    return (a1, b1)
}
print(exchangeTwoNum(a: 3, b: 7))


//求int数二进制中1的个数
//遍历次数较多,有多少位数就遍历多少次
func getCountOnes01 (num: UInt) -> UInt {
    var count: UInt = 0
    var temp = num
    while temp != 0 {
//        let a = temp & 1
//        if a == 1 {
//            count += 1
//        }
        count += temp & 1
        temp = temp >> 1
    }
    return count
}
print(getCountOnes01(num: 6))

//改进方法遍历次数少,有多少个1就遍历多少次
//将一个数与自身减一按位与运算,会消除最低位的1
func getCountOnes02(num: UInt) -> UInt {
    var count: UInt = 0
    var temp = num
    while temp != 0 {
        count += 1
        temp = temp & (temp - 1)
    }
    return count
}
print(getCountOnes02(num: 9))

//判断一个数是否是2的整数次幂
//如果一个数是2的整数次幂,那么这个数的二进制表示中只有一位是1
func isPowerOfTwo(num: UInt) -> Bool {
    return (num & (num - 1)) == 0
}
print(isPowerOfTwo(num: 7))


//小时的数字,一个数组里面有两两出现的数字,其中一个数字消失,找出这个消失的数字
//相同的数字异或结果为0
func findLostNum(nums:[UInt]) -> UInt {
    var lostNum: UInt = 0
    for num in nums {
        lostNum = lostNum ^ num
    }
    return lostNum
}
var nums: [UInt] = [1,2,3,4,5,5,3,1,2]
print(findLostNum(nums: nums))

//找到两个消失的数字
//将所有的数字分为两个组,一个组有一个消失的数字,两个数字必定有一位是不同的,按不同位进行分组
func findLostTwoNum(nums: [UInt]) -> (UInt, UInt) {
    var lostNum1: UInt = 0
    var lostNum2: UInt = 0
    //先得到所有数字异或的结果
    var temp: UInt = 0
    for num in nums {
        temp = temp ^ num
    }
    //得到两个数字不同的位数
    var flag: UInt = 1
    while (flag & temp) == 0 {
        flag = flag << 1
    }
    //对数据进行分组异或
    for num in nums {
        if (num & flag) == 1 {
            lostNum1 = lostNum1 ^ num
        }
        else {
            lostNum2 = lostNum2 ^ num
        }
    }
    return (lostNum1, lostNum2)
}
var nums01: [UInt] = [1,2,3,4,5,3,2,5]

print(findLostTwoNum(nums: nums01))

//数组中只有一个数出现一次,其他的都出现三次,找出这个数字

func findOnceNum(nums: [UInt]) -> UInt {
    var a: UInt = 0
    var b: UInt = 0
    for num in nums {
        a = (a ^ num) & ~b
        b = (b ^ num) & ~a
    }
    return a
}
var nums02: [UInt] = [1,1,1,2,2,2,6]
print(findOnceNum(nums: nums02))
