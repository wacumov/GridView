//
//  SlotView.swift
//  GridView
//
//  Created by Mikhail Akopov on 24/11/2018.
//  Copyright © 2018 Mikhail Akopov. All rights reserved.
//

import UIKit

public final class SlotView: UIView {
    public let view: UIView
    public let slot: Slot
    
    public init(view: UIView, slot: Slot) {
        self.view = view
        self.slot = slot
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
