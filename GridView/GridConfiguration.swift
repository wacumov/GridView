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
    
    public struct Size {
        public let rows: Int
        public let columns: Int
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
