//: [Previous](@previous)

import Foundation


//if语句使用不当,导致嵌套层数很深,阅读很不利
func isIpAddress01(ipString: String) -> (Int, String) {
    let components = ipString.split(separator: ".")
    if components.count == 4 {
        if let first = Int(components[0]), first >= 0 && first <= 255 {
            if let second = Int(components[1]), second >= 0 && second <= 255 {
                if let third = Int(components[2]), third >= 0 && third <= 255 {
                    if let forth = Int(components[3]), forth >= 0 && forth <= 255 {
                        return (0, "IP地址合法")
                    }
                    else {
                       return (3, "第四部分不对")
                    }
                }
                else {
                   return (3, "第三部分不对")
                }
            }
            else {
               return (2, "第二部分不对")
            }
        }
        else {
            return (1, "第一部分不对")
        }
    }
    else {
        return (100, "不是IP地址,不是由四部分组成")
    }
}

func isIpAddress02(ipString: String) -> (Int, String) {

    let components = ipString.split(separator: ".")

    if components.count != 4 {
        return (100, "不是IP地址,不是由四部分组成")
    }

    if let first = Int(components[0]), first < 0 || first > 255 {
        return (1, "第一部分不对")
    }

    if let second = Int(components[1]), second < 0 || second > 255 {
        return (2, "第二部分不对")
    }

    if let third = Int(components[2]), third < 0 || third > 255 {
        return (3, "第三部分不对")
    }

    if let forth = Int(components[3]), forth < 0 || forth > 255 {
        return (3, "第四部分不对")
    }

    return (0, "IP地址合法")

}


//guard语句书写更加直观,避免嵌套
func isIpAdressUseGuard(ipString: String) -> (Int, String) {

    let components = ipString.split(separator: ".")

    guard components.count == 4 else {
        return (100, "不是IP地址,不是由四部分组成")
    }

    guard let first = Int(components[0]), first >= 0 && first <= 255 else {
        return (1, "第一部分不对")
    }

    guard let second = Int(components[1]), second >= 0 && second <= 255 else {
        return (1, "第二部分不对")
    }

    guard let third = Int(components[2]), third >= 0 && third <= 255 else {
        return (2, "第三部分不对")
    }

    guard let forth = Int(components[3]), forth >= 0 && forth <= 255 else {
        return (3, "第四部分不对")
    }

    return (0, "IP地址合法")

}

//print(isIpAdressUseGuard(ipString: "101.110.91.110"))
print(isIpAddress02(ipString: "10.91.91.101"))

