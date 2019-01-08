//
//  GridView.swift
//  GridView
//
//  Created by Mikhail Akopov on 24/11/2018.
//  Copyright © 2018 Mikhail Akopov. All rights reserved.
//

import UIKit

public final class GridView: UIView {
    
    public let slotViews: [SlotView]
    private let frameCalculator: SlotFrameCalculator
    
    public init(configuration: GridConfiguration, slotViews: [SlotView]) {
        self.frameCalculator = SlotFrameCalculator(configuration: configuration)
        self.slotViews = slotViews
        super.init(frame: .zero)
        
        slotViews.forEach { addSubview($0.view) }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        layoutSlots()
    }
    
    private func layoutSlots() {
        slotViews.forEach {
            $0.view.frame = frameCalculator.calculateFrameForSlot($0.slot, gridSize: bounds.size)
        }
    }
    
}
