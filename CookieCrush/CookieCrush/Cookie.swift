//
//  Cookie.swift
//  CookieCrush
//
//  Created by Seab on 11/1/16.
//  Copyright © 2016 Seab Jackson. All rights reserved.
//

import SpriteKit

enum CookieType: Int {
    case unknown = 0, croissant, cupcake, danish, donut, macaroon, sugarCookie
    
    var spriteName: String {
        let spriteNames = ["Croissant", "Cupcake", "Danish", "Donut", "Macaroon", "SugarCookie"]
        return spriteNames[rawValue - 1]
    }
    
    var highlightedSpriteName: String {
        return spriteName + "-Highlighted"
    }
    
    static func random() -> CookieType {
        return CookieType(rawValue: Int(arc4random_uniform(6)) + 1)!
    }
}

// hashable protocol requires class to be equatable
func == (lhs: Cookie, rhs: Cookie) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row
}

class Cookie: CustomStringConvertible, Hashable {
    
    var column: Int
    var row: Int
    let cookieType: CookieType
    var sprite: SKSpriteNode?
    
    var description: String {
        return "type:\(cookieType) square: (\(column), \(row))"
    }
    
    var hashValue: Int {
        return row * 10 + column
    }
    
    init(column: Int, row: Int, cookieType: CookieType) {
        self.column = column
        self.row = row
        self.cookieType = cookieType
    }
}
