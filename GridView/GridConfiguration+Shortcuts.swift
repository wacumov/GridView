//
//  GridConfiguration+Shortcuts.swift
//  GridView
//
//  Created by Mikhail Akopov on 24/11/2018.
//  Copyright © 2018 Mikhail Akopov. All rights reserved.
//

public extension GridConfiguration.Offset {
    public static var zero: GridConfiguration.Offset {
        return .value(.zero)
    }
}

public extension GridConfiguration.CellAspectRatio {
    public static var square: GridConfiguration.CellAspectRatio {
        return .fixed(1.0)
    }
}
