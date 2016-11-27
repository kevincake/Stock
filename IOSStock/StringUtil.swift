//
//  StringUtil.swift
//  IOSStock
//
//  Created by Eavawu on 24/11/2016.
//  Copyright © 2016 Eavawu. All rights reserved.
//

import Foundation
class StringUtil{
    func isPhoneNum(phone:String) -> Bool {
        return StringRegix("^1[0-9]{10}$").match(input: phone)
    }
    
}
