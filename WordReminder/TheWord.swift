//
//  TheWord.swift
//  WordReminder
//
//  Created by like on 2018/4/4.
//  Copyright © 2018年 like. All rights reserved.
//

import Foundation
import UIKit

class TheWord{
    var text: String
    var meaning: String
    var num: Int32
    var times: Int32
    
    init(text: String, meaning: String, num: Int32, times: Int32){
        self.text = text
        self.meaning = meaning
        self.num = num
        self.times = times
    }
}
