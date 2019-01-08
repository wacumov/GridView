//
//  SlotFrameCalculator.swift
//  GridView
//
//  Created by Mikhail Akopov on 24/11/2018.
//  Copyright © 2018 Mikhail Akopov. All rights reserved.
//

import UIKit

final class SlotFrameCalculator {
    
    let configuration: GridConfiguration
    
    init(configuration: GridConfiguration) {
        self.configuration = configuration
    }
    
    // MARK: - Public
    
    func calculateFrameForSlot(_ slot: Slot, gridSize: CGSize) -> CGRect {
        
        let cellSize = calculateCellSize(gridSize: gridSize)
        let innerOffset: CGSize = {
            switch configuration.innerOffset {
            case .value(let value):
                return CGSize(width: value.x, height: value.y)
            case .ratio(let ratio):
                return CGSize(width: ratio.x * cellSize.width, height: ratio.y * cellSize.height)
            }
        }()
        let topLeftCellOrigin = calculateTopLeftCellOrigin(gridSize: gridSize, cellSize: cellSize, innerOffset: innerOffset)
        
        let slotOrigin = CGPoint(x: slot.origin.column, y: slot.origin.row)
        let slotSize = CGSize(width: slot.size.width, height: slot.size.height)
        
        let origin = CGPoint(x: topLeftCellOrigin.x + slotOrigin.x * (cellSize.width + innerOffset.width),
                             y: topLeftCellOrigin.y + slotOrigin.y * (cellSize.height + innerOffset.height))
        let size = CGSize(width: cellSize.width * slotSize.width + innerOffset.width * (slotSize.width - 1),
                          height: cellSize.height * slotSize.height + innerOffset.height * (slotSize.height - 1))
        
        return CGRect(origin: CGPoint(x: origin.x.nearest, y: origin.y.nearest),
                      size: CGSize(width: size.width.nearest, height: size.height.nearest))
    }
    
    // MARK: - Shortcuts
    
    private lazy var rows = CGFloat(configuration.gridSize.rows)
    private lazy var columns = CGFloat(configuration.gridSize.columns)
    
    // MARK: - Private
    
    private typealias Offset = GridConfiguration.Offset
    
    private func calculateCellSizeForCellDependsOnGrid(_ gridSize: CGSize) -> CGSize {
        
        switch (configuration.innerOffset, configuration.outerOffset) {
            
        case (.ratio(let innerRatio), .ratio(let outerRatio)):
            let width: CGFloat = gridSize.width / (columns + innerRatio.x * (columns - 1.0) + outerRatio.x * 2.0)
            let height: CGFloat = gridSize.height / (rows + innerRatio.y * (rows - 1.0) + outerRatio.y * 2.0)
            return CGSize(width: width, height: height)
            
        case (.value(let innerValue), .ratio(let outerRatio)):
            let width: CGFloat = (gridSize.width - innerValue.x * (columns - 1.0)) / (columns + outerRatio.x * 2.0)
            let height: CGFloat = (gridSize.height - innerValue.y * (rows - 1.0)) / (rows + outerRatio.y * 2.0)
            return CGSize(width: width, height: height)
            
        case (.ratio(let innerRatio), .value(let outerValue)):
            let width: CGFloat = (gridSize.width - outerValue.x * 2.0) / (columns + innerRatio.x * (columns - 1.0))
            let height: CGFloat = (gridSize.height - outerValue.y * 2.0) / (rows + innerRatio.y * (rows - 1.0))
            return CGSize(width: width, height: height)
            
        case (.value(let innerValue), .value(let outerValue)):
            let width: CGFloat = (gridSize.width - outerValue.x * 2.0 - innerValue.x * (columns - 1.0)) / columns
            let height: CGFloat = (gridSize.height - outerValue.y * 2.0 - innerValue.y * (rows - 1.0)) / rows
            return CGSize(width: width, height: height)
        }
    }
    
    private func calculateCellSize(gridSize: CGSize) -> CGSize {
        let dependedOnGrid = calculateCellSizeForCellDependsOnGrid(gridSize)
        switch configuration.cellAspectRatio {
        case .dependsOnGrid:
            return dependedOnGrid
        case .fixed(let ratio):
            if dependedOnGrid.width / ratio > dependedOnGrid.height {
                return CGSize(width: dependedOnGrid.height * ratio, height: dependedOnGrid.height)
            }
            return CGSize(width: dependedOnGrid.width, height: dependedOnGrid.width / ratio)
        }
    }
    
    private func calculateTopLeftCellOrigin(gridSize: CGSize, cellSize: CGSize, innerOffset: CGSize) -> CGPoint {
        switch configuration.cellAspectRatio {
        case .dependsOnGrid:
            switch configuration.outerOffset {
            case .ratio(let outerRatio):
                return CGPoint(x: cellSize.width * outerRatio.x, y: cellSize.height * outerRatio.y)
            case .value(let outerValue):
                return CGPoint(x: outerValue.x, y: outerValue.y)
            }
        case .fixed:
            return CGPoint(x: (gridSize.width - cellSize.width * columns - innerOffset.width * (columns - 1.0)) / 2.0,
                           y: (gridSize.height - cellSize.height * rows - innerOffset.height * (rows - 1.0)) / 2.0)
        }
    }
    
}

private extension CGFloat {
    
    var nearest: CGFloat {
        return floor(self * 100.0 + 0.5) / 100.0
    }
    
}
