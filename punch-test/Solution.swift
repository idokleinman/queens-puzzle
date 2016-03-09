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
        self.board = Array<Array<Cell>>()
        for _ in 0...boardSize-1 {
            var row = Array<Cell>()
            for _ in 0...boardSize-1 {
                row.append(Cell(state: .Empty))
            }
            self.board.append(row)
        }
        
    }
    
    
}
