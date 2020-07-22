//
//  Error.swift
//  SwiftStudyDemo
//
//  Created by Yangdongwu on 2020/7/22.
//  Copyright © 2020 LDY. All rights reserved.
//

import Foundation

enum PrinterError: Error {
    case OutOfPaper
    case NoToner
    case OnFire
}

class ErrorDemo {
    
    func test() {
        do {
            let printerResponse = try send(job: 1040, toPrinter: "Bob")
            print(printerResponse)
        } catch {
            print(error)
        }
    }
    
    /// 特定的类型catch可以进行特殊处理
    func catchForSpecialThrow() {
        
        //无论是否catch都会执行,类似finally
        defer {
            print("defer")
        }
        
        do {
            let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
            print(printerResponse)
        } catch PrinterError.OnFire {
            print("I'll just put this over here, with the rest of the fire.")
        } catch let printerError as PrinterError {
            print("Printer error: \(printerError).")
        } catch {
            print(error)
        }
        
    }
    
    /// 可选值方式
    func optionalTry() {
        //如果失败,返回nil,如果成功返回一个可选择
        let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
        let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")
        print(printerSuccess ?? "nil")
        print(printerFailure ?? "nil")
    }
    
    func send(job: Int, toPrinter printerName: String) throws -> String {
        if printerName == "Never Has Toner" {
            throw PrinterError.NoToner
        }
        else if job == 1440 {
            throw PrinterError.NoToner
        }

        return "Job sent"
    }
    
}
