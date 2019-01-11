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
                return value
            case .ratio(let ratio):
                return CGSize(width: ratio.dx * cellSize.width, height: ratio.dy * cellSize.height)
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
            let width: CGFloat = gridSize.width / (columns + innerRatio.dx * (columns - 1.0) + outerRatio.dx * 2.0)
            let height: CGFloat = gridSize.height / (rows + innerRatio.dy * (rows - 1.0) + outerRatio.dy * 2.0)
            return CGSize(width: width, height: height)
            
        case (.value(let innerValue), .ratio(let outerRatio)):
            let width: CGFloat = (gridSize.width - innerValue.width * (columns - 1.0)) / (columns + outerRatio.dx * 2.0)
            let height: CGFloat = (gridSize.height - innerValue.height * (rows - 1.0)) / (rows + outerRatio.dy * 2.0)
            return CGSize(width: width, height: height)
            
        case (.ratio(let innerRatio), .value(let outerValue)):
            let width: CGFloat = (gridSize.width - outerValue.width * 2.0) / (columns + innerRatio.dx * (columns - 1.0))
            let height: CGFloat = (gridSize.height - outerValue.height * 2.0) / (rows + innerRatio.dy * (rows - 1.0))
            return CGSize(width: width, height: height)
            
        case (.value(let innerValue), .value(let outerValue)):
            let width: CGFloat = (gridSize.width - outerValue.width * 2.0 - innerValue.width * (columns - 1.0)) / columns
            let height: CGFloat = (gridSize.height - outerValue.height * 2.0 - innerValue.height * (rows - 1.0)) / rows
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
                return CGPoint(x: cellSize.width * outerRatio.dx, y: cellSize.height * outerRatio.dy)
            case .value(let outerValue):
                return CGPoint(x: outerValue.width, y: outerValue.height)
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
