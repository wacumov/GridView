//
//  Slot.swift
//  GridView
//
//  Created by Mikhail Akopov on 24/11/2018.
//  Copyright © 2018 Mikhail Akopov. All rights reserved.
//

public struct Slot {
    public let origin: Origin
    public let size: Size
    
    public struct Origin {
        public let row: Int
        public let column: Int
    }
    
    public struct Size {
        public let width: Int
        public let height: Int
    }

}
