//
//  Cell.swift
//  queens
//
//  Created by Ido Kleinman on 3/6/16.
//  Copyright © 2016 punch. All rights reserved.
//

import Foundation

@objc public enum CellState : Int {
    case Empty
    case Queen
}


@objc public class Cell: NSObject {
    
    public var state : CellState
    init(state : CellState) {
        self.state = state
    }


}
