//
//  GridConfiguration.swift
//  GridView
//
//  Created by Mikhail Akopov on 24/11/2018.
//  Copyright © 2018 Mikhail Akopov. All rights reserved.
//

import UIKit

public struct GridConfiguration {
    
    public let gridSize: Size
    public let innerOffset: Offset
    public let outerOffset: Offset
    public let cellAspectRatio: CellAspectRatio
    
    public init(gridSize: Size,
                innerOffset: Offset,
                outerOffset: Offset,
                cellAspectRatio: CellAspectRatio) {
        self.gridSize = gridSize
        self.innerOffset = innerOffset
        self.outerOffset = outerOffset
        self.cellAspectRatio = cellAspectRatio
    }
    
    public struct Size {
        public let rows: Int
        public let columns: Int
        
        public init(rows: Int, columns: Int) {
            self.rows = rows
            self.columns = columns
        }
    }
    
    public enum Offset {
        case ratio(CGVector)
        case value(CGSize)
    }
    
    public enum CellAspectRatio {
        case dependsOnGrid
        case fixed(CGFloat)
    }
    
}
