//
//  Level.swift
//  CookieCrush
//
//  Created by Seab on 11/1/16.
//  Copyright © 2016 Seab Jackson. All rights reserved.
//

import Foundation

let NumColumns = 9
let NumRows = 9



class Level {
    fileprivate var cookies = Array2D<Cookie>(columns: NumColumns, rows: NumRows)
    
    private var tiles = Array2D<Tile>(columns: NumColumns, rows: NumRows)
    
    init(filename: String) {
        // early return if the filename is incorrect
        guard let dictionary = Dictionary<String, AnyObject>.loadJSONFromBundle(filename: filename) else {
            return
        }
        
        guard let tilesArray = dictionary["tiles"] as? [[Int]] else { return }
        
        for (row, rowArray) in tilesArray.enumerated() {
            let tileRow = NumRows - row - 1
            for (column, value) in rowArray.enumerated() {
                if value == 1 {
                    tiles[column, tileRow] = Tile()
                }
            }
        }
        
    }
    
    
    func cookieAt(column: Int, row: Int) -> Cookie? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return cookies[column, row]
    }
    
    func tileAt(column: Int, row: Int) -> Tile? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return tiles[column, row]
    }
    
    private func createInitialCookies() -> Set<Cookie> {
        var set = Set<Cookie>()
        
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                if tiles[column, row] != nil {
                    // smartly fill up the cookies board
                    var cookieType: CookieType
                    
                    repeat {
                        cookieType = CookieType.random()
                    } while (column >= 2 &&
                        cookies[column - 1, row]?.cookieType == cookieType &&
                        cookies[column - 2, row]?.cookieType == cookieType)
                    || (row >= 2 &&
                        cookies[column, row - 1]?.cookieType == cookieType &&
                        cookies[column, row - 2]?.cookieType == cookieType)
                    
                    // create a cookie of that type with current coordinates in the grid
                    let cookie = Cookie(column: column, row: row, cookieType: cookieType)
                    // set the cookie in the correct place in the grid
                    cookies[column, row] = cookie
                    // add the cookie to the set
                    set.insert(cookie)
                }
            }
        }
        return set
    }
    
    func shuffle() -> Set<Cookie> {
        return createInitialCookies()
    }
    
    // updating the data model to ensure that the cookies array is always updated 
    // and that their row and column properties are alway in sync.
    
    func performSwap(swap: Swap) {
        let columnA = swap.cookieA.column
        let rowA = swap.cookieA.row
        let columnB = swap.cookieB.column
        let rowB = swap.cookieB.row
        
        cookies[columnA, rowA] = swap.cookieB
        swap.cookieB.column = columnA
        swap.cookieB.row = rowA
        
        cookies[columnB, rowB] = swap.cookieA
        swap.cookieA.column = columnB
        swap.cookieA.row = rowB
    }

}




