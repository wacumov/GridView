//
//  Slot+Shortcuts.swift
//  GridView
//
//  Created by Mikhail Akopov on 24/11/2018.
//  Copyright © 2018 Mikhail Akopov. All rights reserved.
//

public extension Slot.Size {
    static func makeSquare(_ size: Int) -> Slot.Size {
        return .init(width: size, height: size)
    }
}

public extension Slot {
    static func make1x1Slot(row: Int, column: Int) -> Slot {
        return .init(origin: .init(row: row, column: column), size: .makeSquare(1))
    }
}
