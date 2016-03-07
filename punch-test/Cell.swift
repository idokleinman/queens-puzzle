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


@objc public class Cell: NSObject, NSCopying {
    
    public var state : CellState
    init(state : CellState) {
        self.state = state
    }
    
    public func copyWithZone(zone: NSZone) -> AnyObject {
        let copy = Cell(state: self.state)
        return copy
    }

}
