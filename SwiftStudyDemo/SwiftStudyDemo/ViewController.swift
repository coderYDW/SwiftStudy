//
//  ViewController.swift
//  SwiftStudyDemo
//
//  Created by Apple on 2020/7/22.
//  Copyright © 2020 LDY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let error = ErrorDemo()
        error.test()
        error.optionalTry()
        error.catchForSpecialThrow()
        
    }
    
}

