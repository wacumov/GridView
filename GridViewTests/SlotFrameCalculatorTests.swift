//
//  SlotFrameCalculatorTests.swift
//  GridView
//
//  Created by Mikhail Akopov on 24/11/2018.
//  Copyright © 2018 Mikhail Akopov. All rights reserved.
//

import XCTest
@testable import GridView

final class SlotFrameCalculatorTests: XCTestCase {
    
    func testFrameForOnlySquareSlotWithoutOffsets() {
        // Given
        let calculator = SlotFrameCalculator(configuration: .makeSquareSlotsNoOffsets1x1Configuration())
        let slot: Slot = .make1x1Slot(row: 0, column: 0)
        let gridSize = CGSize(width: 100, height: 100)
        
        // When
        let frame = calculator.calculateFrameForSlot(slot, gridSize: gridSize)
        
        // Then
        XCTAssertEqual(CGPoint.zero, frame.origin)
        XCTAssertEqual(gridSize, frame.size)
    }
    
    func testFrameForOnlySquareSlotWithOuterValueOffset() {
        // Given
        let calculator = SlotFrameCalculator(configuration: .makeSquareSlots1x1Configuration(outerOffset: .value(.init(x: 10, y: 10))))
        let slot: Slot = .make1x1Slot(row: 0, column: 0)
        let gridSize = CGSize(width: 100, height: 100)
        
        // When
        let frame = calculator.calculateFrameForSlot(slot, gridSize: gridSize)
        
        // Then
        XCTAssertEqual(CGPoint(x: 10, y: 10), frame.origin)
        XCTAssertEqual(CGSize(width: 80, height: 80), frame.size)
    }
    
    func testFrameForOnlySquareSlotWithOuterRatioOffset() {
        // Given
        let calculator = SlotFrameCalculator(configuration: .makeSquareSlots1x1Configuration(outerOffset: .ratio(.init(x: 0.1, y: 0.1))))
        let slot: Slot = .make1x1Slot(row: 0, column: 0)
        let gridSize = CGSize(width: 120, height: 120)
        
        // When
        let frame = calculator.calculateFrameForSlot(slot, gridSize: gridSize)
        
        // Then
        XCTAssertEqual(CGPoint(x: 10, y: 10), frame.origin)
        XCTAssertEqual(CGSize(width: 100, height: 100), frame.size)
    }
    
    func testFrameForOnlySquareSlotWithInnerValueOffset() {
        // Given
        let calculator = SlotFrameCalculator(configuration: .makeSquareSlots1x1Configuration(innerOffset: .value(.init(x: 10, y: 10))))
        let slot: Slot = .make1x1Slot(row: 0, column: 0)
        let gridSize = CGSize(width: 100, height: 100)
        
        // When
        let frame = calculator.calculateFrameForSlot(slot, gridSize: gridSize)
        
        // Then
        XCTAssertEqual(CGPoint.zero, frame.origin)
        XCTAssertEqual(gridSize, frame.size)
    }
    
    func testFrameForOnlySquareSlotWithInnerRatioOffset() {
        // Given
        let calculator = SlotFrameCalculator(configuration: .makeSquareSlots1x1Configuration(innerOffset: .ratio(.init(x: 0.1, y: 0.1))))
        let slot: Slot = .make1x1Slot(row: 0, column: 0)
        let gridSize = CGSize(width: 100, height: 100)
        
        // When
        let frame = calculator.calculateFrameForSlot(slot, gridSize: gridSize)
        
        // Then
        XCTAssertEqual(CGPoint.zero, frame.origin)
        XCTAssertEqual(gridSize, frame.size)
    }
    
    func testFrameForTopLeftSquareSlotIn2x2GridWithoutOffsets() {
        // Given
        let calculator = SlotFrameCalculator(configuration: .makeSquareSlotsConfiguration(rows: 2, columns: 2))
        let slot: Slot = .make1x1Slot(row: 0, column: 0)
        let gridSize = CGSize(width: 100, height: 100)
        
        // When
        let frame = calculator.calculateFrameForSlot(slot, gridSize: gridSize)
        
        // Then
        XCTAssertEqual(CGPoint.zero, frame.origin)
        XCTAssertEqual(CGSize(width: 50, height: 50), frame.size)
    }
    
    func testFrameForBottomRightSquareSlotIn2x2GridWithoutOffsets() {
        // Given
        let calculator = SlotFrameCalculator(configuration: .makeSquareSlotsConfiguration(rows: 2, columns: 2))
        let slot: Slot = .make1x1Slot(row: 1, column: 1)
        let gridSize = CGSize(width: 100, height: 100)
        
        // When
        let frame = calculator.calculateFrameForSlot(slot, gridSize: gridSize)
        
        // Then
        XCTAssertEqual(CGPoint(x: 50, y: 50), frame.origin)
        XCTAssertEqual(CGSize(width: 50, height: 50), frame.size)
    }
    
    func testFrameForBottomRightSquareSlotIn2x2GridWithOuterValueOffset() {
        // Given
        let calculator = SlotFrameCalculator(configuration: .makeSquareSlotsConfiguration(rows: 2, columns: 2, outerOffset: .value(.init(x: 10, y: 10))))
        let slot: Slot = .make1x1Slot(row: 1, column: 1)
        let gridSize = CGSize(width: 100, height: 100)
        
        // When
        let frame = calculator.calculateFrameForSlot(slot, gridSize: gridSize)
        
        // Then
        XCTAssertEqual(CGPoint(x: 50, y: 50), frame.origin)
        XCTAssertEqual(CGSize(width: 40, height: 40), frame.size)
    }
    
    func testFrameForBottomRightSquareSlotIn2x2GridWithOuterRatioOffset() {
        // Given
        let calculator = SlotFrameCalculator(configuration: .makeSquareSlotsConfiguration(rows: 2, columns: 2, outerOffset: .ratio(.init(x: 0.2, y: 0.2))))
        let slot: Slot = .make1x1Slot(row: 1, column: 1)
        let gridSize = CGSize(width: 120, height: 120)
        
        // When
        let frame = calculator.calculateFrameForSlot(slot, gridSize: gridSize)
        
        // Then
        XCTAssertEqual(CGPoint(x: 60, y: 60), frame.origin)
        XCTAssertEqual(CGSize(width: 50, height: 50), frame.size)
    }
    
    func testFrameForBottomRightSquareSlotIn2x2GridWithInnerValueOffset() {
        // Given
        let calculator = SlotFrameCalculator(configuration: .makeSquareSlotsConfiguration(rows: 2, columns: 2, innerOffset: .value(.init(x: 10, y: 10))))
        let slot: Slot = .make1x1Slot(row: 1, column: 1)
        let gridSize = CGSize(width: 100, height: 100)
        
        // When
        let frame = calculator.calculateFrameForSlot(slot, gridSize: gridSize)
        
        // Then
        XCTAssertEqual(CGPoint(x: 55, y: 55), frame.origin)
        XCTAssertEqual(CGSize(width: 45, height: 45), frame.size)
    }
    
    func testFrameForBottomRightSquareSlotIn2x2GridWithInnerRatioOffset() {
        // Given
        let calculator = SlotFrameCalculator(configuration: .makeSquareSlotsConfiguration(rows: 2, columns: 2, innerOffset: .ratio(.init(x: 0.2, y: 0.2))))
        let slot: Slot = .make1x1Slot(row: 1, column: 1)
        let gridSize = CGSize(width: 110, height: 110)
        
        // When
        let frame = calculator.calculateFrameForSlot(slot, gridSize: gridSize)
        
        // Then
        XCTAssertEqual(CGPoint(x: 60, y: 60), frame.origin)
        XCTAssertEqual(CGSize(width: 50, height: 50), frame.size)
    }
    
    func testFrameForCentralSquareSlotIn3x3GridWithInnerValueAndOuterRatioOffsets() {
        // Given
        let calculator = SlotFrameCalculator(configuration: .makeSquareSlotsConfiguration(rows: 3, columns: 3, innerOffset: .value(.init(x: 10, y: 10)), outerOffset: .ratio(.init(x: 0.2, y: 0.2))))
        let slot: Slot = .make1x1Slot(row: 1, column: 1)
        let gridSize = CGSize(width: 190, height: 190)
        
        // When
        let frame = calculator.calculateFrameForSlot(slot, gridSize: gridSize)
        
        // Then
        XCTAssertEqual(CGPoint(x: 70, y: 70), frame.origin)
        XCTAssertEqual(CGSize(width: 50, height: 50), frame.size)
    }
    
    func testFrameForCentralNonFixedRatioSlotIn3x3GridWithInnerRatioAndOuterRatioOffsets() {
        // Given
        let calculator = SlotFrameCalculator(configuration: .init(gridSize: .init(rows: 3, columns: 3), innerOffset: .ratio(.init(x: 0.2, y: 0.2)), outerOffset: .ratio(.init(x: 0.2, y: 0.2)), cellAspectRatio: .dependsOnGrid))
        let slot: Slot = .make1x1Slot(row: 1, column: 1)
        let gridSize = CGSize(width: 190, height: 380)
        
        // When
        let frame = calculator.calculateFrameForSlot(slot, gridSize: gridSize)
        
        // Then
        XCTAssertEqual(CGPoint(x: 70, y: 140), frame.origin)
        XCTAssertEqual(CGSize(width: 50, height: 100), frame.size)
    }
    
    func testFrameForCentralNonFixedRatioSlotIn3x3GridWithInnerValueAndOuterRatioOffsets() {
        // Given
        let calculator = SlotFrameCalculator(configuration: .init(gridSize: .init(rows: 3, columns: 3), innerOffset: .value(.init(x: 10, y: 20)), outerOffset: .ratio(.init(x: 0.2, y: 0.2)), cellAspectRatio: .dependsOnGrid))
        let slot: Slot = .make1x1Slot(row: 1, column: 1)
        let gridSize = CGSize(width: 190, height: 380)
        
        // When
        let frame = calculator.calculateFrameForSlot(slot, gridSize: gridSize)
        
        // Then
        XCTAssertEqual(CGPoint(x: 70, y: 140), frame.origin)
        XCTAssertEqual(CGSize(width: 50, height: 100), frame.size)
    }
    
    func testFrameForCentralNonFixedRatioSlotIn3x3GridWithNonFittedSizeWithInnerValueAndOuterRatioOffsets() {
        // Given
        let calculator = SlotFrameCalculator(configuration: .init(gridSize: .init(rows: 3, columns: 3), innerOffset: .value(.init(x: 15, y: 20)), outerOffset: .ratio(.init(x: 0.2, y: 0.2)), cellAspectRatio: .dependsOnGrid))
        let slot: Slot = .make1x1Slot(row: 1, column: 1)
        let gridSize = CGSize(width: 200, height: 380)
        
        // When
        let frame = calculator.calculateFrameForSlot(slot, gridSize: gridSize)
        
        // Then
        XCTAssertEqual(CGPoint(x: 75, y: 140), frame.origin)
        XCTAssertEqual(CGSize(width: 50, height: 100), frame.size)
    }
}

private extension GridConfiguration {
    
    static func makeSquareSlotsNoOffsets1x1Configuration() -> GridConfiguration {
        return makeSquareSlots1x1Configuration()
    }
    
    static func makeSquareSlots1x1Configuration(innerOffset: Offset = .value(.zero), outerOffset: Offset = .value(.zero)) -> GridConfiguration {
        return makeSquareSlotsConfiguration(rows: 1, columns: 1, innerOffset: innerOffset, outerOffset: outerOffset)
    }
    
    static func makeSquareSlotsConfiguration(rows: Int, columns: Int, innerOffset: Offset = .value(.zero), outerOffset: Offset = .value(.zero)) -> GridConfiguration {
        return GridConfiguration(gridSize: .init(rows: rows, columns: columns), innerOffset: innerOffset, outerOffset: outerOffset, cellAspectRatio: .fixed(1.0))
    }
}
