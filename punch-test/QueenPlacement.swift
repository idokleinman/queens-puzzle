//
//  QueenPlacement.swift
//  queens
//
//  Created by Ido Kleinman on 3/6/16.
//  Copyright © 2016 punch. All rights reserved.
//

import UIKit

public typealias Board = Array<Array<Cell>>

@objc protocol QueenPlacementDelegate : class {
    func solutionsFound(numOfSolutions : Int)
}

class QueenPlacement: NSObject {
    var boardSize : Int = 0
    var solutions : Set<Solution>?
    weak var delegate : QueenPlacementDelegate? 

    
    func start() {

        if boardSize == 0 {
            print("Board size was not initialized")
            return
        }
      
        self.solutions = Set<Solution>()

        
        let solutions = queens(self.boardSize)
        solutions.forEach {
//            print(drawTable($0))
            self.solutions!.insert(convertIntArrToSolution($0))
        }
        self.delegate!.solutionsFound(self.solutions!.count)
    }
    
    func convertIntArrToSolution(solIntArr : [Int]) -> Solution {
        let sol = Solution(boardSize: solIntArr.count)
        for i in 0...solIntArr.count-1 {
            let j = solIntArr[i]-1;
            sol.board[i][j].state = .Queen
        }
        return sol
    }
    
    func queens(n: Int) -> [[Int]] {
        
        guard n > 3 else {
            return [[Int]]()
        }
        
        func placeQueens(k: Int) -> [[Int]] {
            
            guard k > 0 else {
                return [[-1]] //stupid hack to let the app go to the for-loop in the * marked place
            }
            var res = [[Int]]()
            
            for var q in placeQueens(k - 1) { //* marked place
                
                if let first = q.first where first == -1 { //this is for removing the hacky -1
                    q.removeAll()
                }
                
                for column in 1...n {
                    
                    if isSafe(column, queens: q) {
                        var solution = q
                        solution.append(column)
                        res.append(solution)
                    }
                }
            }
            return res
        }
        return placeQueens(n)
    }
    
    func isSafe(column: Int, queens: [Int]) -> Bool {
        
        for (index, q) in queens.enumerate() {
            let dy = (index + 1) - (queens.count + 1)
            let dx = q - column
            let isDiagonal = dy * dy == dx * dx
            
            if q == column || isDiagonal {
                return false
            }
        }
        return true
    }
    
    /*
    func drawTable(table: [Int]) -> String {
        var res = ""
        
        table.forEach {
            
            for column in 1...table.count {
                
                if $0 == column {
                    res += "X "
                } else {
                    res += ". "
                }
            }
            res += "\n"
        }
        return res
    }
    */
    
    
    // singleton!
    static let sharedInstance = QueenPlacement()
    private override init() {}
    

}
