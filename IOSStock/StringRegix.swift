//
//  StringUtils.swift
//  IOSStock
//
//  Created by Eavawu on 23/11/2016.
//  Copyright © 2016 Eavawu. All rights reserved.
//

import Foundation
class StringRegix{
    let regex: NSRegularExpression?
    init(_ pattern: String) {
        regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    }

    
    func match(input: String) -> Bool {
        if let matches = regex?.matches(in: input,options: [],range: NSMakeRange(0, (input as NSString).length)) {
            return matches.count > 0
        }
        else {
            return false
        }
    }
    
}
