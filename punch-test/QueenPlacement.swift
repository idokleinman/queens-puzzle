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
//    var boardView : TTTBoardView?
    var boardSize : Int = 0
    var solutions : Set<Solution>?
    weak var delegate : QueenPlacementDelegate? 
//    private var startCondX : Int = 0
//    private var startCondY : Int = 0

    
    func start() {

        if boardSize == 0 {
            print("Board size was not initialized")
            return
        }
      
        self.solutions = Set<Solution>()
//        var done = false
//        self.startCondX = 0; self.startCondY = 0;
//        var internalSolutions = Array<Solution>()
        
        // add starting conditions to collect solutions
        
        /*
        while (!done) {
            let solution = Solution(boardSize: self.boardSize)
            let board = solution.board
            self.placeQueen(startCondX, yLoc: startCondY, board: board)
            let solutionBoard = self.findSolutionForBoard(board)
//            print("num of queens on board: "+String(self.numOfQueensOnBoard(solutionBoard)))
            
            if self.numOfQueensOnBoard(solutionBoard) == self.boardSize {
                print("solution found")
                solution.board = solutionBoard
//                if !self.solutions!.contains(solution) {
                self.solutions!.insert(solution)
//                }
            }

            done = self.advanceStartConditionsAndCheckIfDone()
            if (done) {
                if self.solutions!.count > 0 {
                    self.delegate!.solutionsFound(self.solutions!.count)
                }
            }
        }
        */
        
        let solutions = queens(self.boardSize)
//        print("found "+String(solutions.count)+" solutions: ")
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
    
    func advanceStartConditionsAndCheckIfDone() -> Bool {
        startCondX++
        if startCondX >= self.boardSize {
            startCondX = 0
            startCondY++
            if startCondY >= self.boardSize {
                return true
            }
        }
        return false
    }
    
    
    func placeQueen(xLoc : Int, yLoc : Int, board : Board) {
        board[xLoc][yLoc].state = .Queen
    }
    
    func findSolutionForBoard(board : Board) -> Board
    {
        let queensPlaced = self.numOfQueensOnBoard(board)
        if queensPlaced == self.boardSize {
            return board
        }
        else
        {
            for i in 0...self.boardSize-1 {
                for j in 0...self.boardSize-1 {
                    if self.canPlaceQueen(xLoc: i, yLoc: j, board: board) {
                        self.placeQueen(i, yLoc: j, board: board)
                    }
                }
            }
            let newQueensPlaced = self.numOfQueensOnBoard(board)

            // recursion exit conditions: could not place any new queen
            if newQueensPlaced > queensPlaced {
                self.findSolutionForBoard(board)
            } else {
                return board
            }
        }

        return board
    }
    
    func numOfQueensOnBoard(board : Board) -> Int {
        var queensPlaced = 0
        for i in 0...self.boardSize-1 {
            for j in 0...self.boardSize-1 {
                if board[i][j].state == .Queen {
                    queensPlaced++
                }
            }
        }
        return queensPlaced
    }
    
    
    func canPlaceQueen(xLoc xLoc : Int, yLoc : Int, board: Board) -> Bool {
        for i in 0...self.boardSize-1 {
            if board[i][yLoc].state == .Queen {
                return false;
            }
            if board[xLoc][i].state == .Queen {
                return false;
            }

        }
        
        var x : Int
        var y : Int
        x = xLoc; y = yLoc;
        while ++x < self.boardSize && ++y < self.boardSize {
            if board[x][y].state == .Queen {
                return false
            }
        }

        x = xLoc; y = yLoc;
        while --x >= 0 && ++y < self.boardSize {
            if board[x][y].state == .Queen {
                return false
            }
        }
        
        x = xLoc; y = yLoc;
        while ++x < self.boardSize && --y >= 0 {
            if board[x][y].state == .Queen {
                return false
            }
        }
        x = xLoc; y = yLoc;
        while --x >= 0 && --y >= 0 {
            if board[x][y].state == .Queen {
                return false
            }
        }

        return true
        
    }
    */
      
    // singleton!
    static let sharedInstance = QueenPlacement()
    private override init() {}
    

}
