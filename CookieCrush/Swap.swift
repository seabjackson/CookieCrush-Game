//
//  Swap.swift
//  CookieCrush
//
//  Created by Seab on 11/7/16.
//  Copyright © 2016 Seab Jackson. All rights reserved.
//

import Foundation

struct Swap: CustomStringConvertible {
    let cookieA: Cookie
    let cookieB: Cookie
    
    init(cookieA: Cookie, cookieB: Cookie) {
        self.cookieA = cookieA
        self.cookieB = cookieB
    }
    
    var description: String {
        return "swap \(cookieA) with \(cookieB)"
    }
}
