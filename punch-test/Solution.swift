//
//  Solution.swift
//  queens
//
//  Created by Ido Kleinman on 3/6/16.
//  Copyright © 2016 punch. All rights reserved.
//

import UIKit

public class Solution: NSObject  {

    public var board : Board//[[Cell]]//Array<Array<Cell>>
    
    init(boardSize : Int) {
//        super.init()
//        for _ in 0...boardSize-1 {
//            self.board.append(Array<Cell>())
//        }
//        self.board = Array(count: boardSize, repeatedValue: Array(count: boardSize, repeatedValue: Cell(state: .Empty)))
        
        self.board = Array<Array<Cell>>()
        for _ in 0...boardSize-1 {
            var row = Array<Cell>()
            for _ in 0...boardSize-1 {
                row.append(Cell(state: .Empty))
            }
            self.board.append(row)
        }
        
    }
    
    public override var hash: Int {
        var hash = 0
        for i in 0...self.board.count-1 {
            for j in 0...self.board.count-1 {
                if self.board[i][j].state == .Queen {
                    hash |= 1
                    hash <<= 1
                } else {
                    hash <<= 1
                }
            }
//            self.board.append(row)
        }
//        print("hash for board: "+String(hash))
        return hash

    }
    
    public override func isEqual(object: AnyObject?) -> Bool {
        return self.hash == (object as! Solution).hash
    }

    
//    public func copyWithZone(zone: NSZone) -> AnyObject {
//        let copy = Solution(boardSize: self.board.count)
//        copy.board = self.board;
//        return copy
//    }
    
}
