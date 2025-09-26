//
//  TimerCellTests.swift
//  TimerCellTests
//
//  Created by Koushik Reddy Kambham on 9/25/25.
//

import XCTest
@testable import TimerCell

final class TimerCellTests: XCTestCase {
    
    var timerViewModel: TimerViewModelProtocol!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        timerViewModel = TimerViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        timerViewModel = nil
    }

    func testNumberOfCells() {
        XCTAssertEqual(timerViewModel.getTimerCount(), 40)
    }
    
    func testTogglePause() {
        XCTAssertTrue(timerViewModel.timers[0].isPaused)
            
        timerViewModel.togglePause(for: 0)
        XCTAssertFalse(timerViewModel.timers[0].isPaused)
        
        timerViewModel.togglePause(for: 0)
        XCTAssertTrue(timerViewModel.timers[0].isPaused)
    }
    
    func testGetTimerAtIndex() {
        let timer = timerViewModel.getTimer(at: 5)
        XCTAssertEqual(timer.count, 0)
        XCTAssertTrue(timer.isPaused)
    }
    
    func testComparable() {
        let timer1 = TimerModel(count: 2, isPaused: true)
        let timer2 = TimerModel(count: 5, isPaused: false)
            
        XCTAssertLessThan(timer1, timer2)
        XCTAssertGreaterThan(timer2, timer1)
    }
}
